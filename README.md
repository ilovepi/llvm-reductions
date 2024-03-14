# Reducing Compiler Bugs

This is a simple little repository with some examples, templates, and notes
related to debugging the compiler and obtaining minimal reproducers that I've
accumulated while working on LLVM. Most of the information here isn't new, and
I've benefited greatly from more detailed writings from my fellow compiler
developers. However, I've found it convenient to have these notes, templates,
and examples, especially when I'm trying to teach someone how to use the
existing tools.

## Organization

The repository has a very simple organization. This README contains a bunch of
general notes I've accumulated and when possible links to the relevant source.
I'll also try my best to link to articles and documentation that I've found
useful.

### llvm-reduce

This part of the repository contains notes, examples, and templates for using
[llvm-reduce](https://llvm.org/docs/CommandGuide/llvm-reduce.html).


### creduce

This part of the repository contains notes, examples, and templates for using
[creduce](https://github.com/csmith-project/creduce).

## Notes

### creduce vs. cvise

A lot of people prefer `cvise` over `creduce`, since it should be more
performant and parallelize better. In my experience though, it often runs into
trouble where `creduce` won't, and I haven't had much success using it.
Generally, I prefer knowing that something I've reduced is correct or making
progress to something that *may* be faster but can go off the rails.

### Getting a reproducer

Sometimes getting a reproducer is challenging, particularly when you have
a complex build with lots of dependencies. However, getting the basics is
usually pretty easy thanks to `clang`'s `-gen-reproducer=always` option.

This flag tells the compiler to create 2 files for you: a preprocessed source
file (yay no headers needed now!) and a script that will run the compiler with
the full `cc1` command. This is almost always the first thing I ask for when
someone needs a potential codegen bug investigated, since it massively
simplifies things.

### Where is the bug?

The next piece of advice is about where the bug is, and how to proceed w/
reduction. So generally, speaking your first order of business is to get
a reproducer and then determine if the bug is in the Frontend, Middleend, or
Backend.

#### Frontend

Frontend bugs tend to be pretty easy to reduce, and often to triage, since
while the frontend can be complicated, there is a lot less machinery than when
the issue involves the interactions between multiple passes in the optimization
pipeline. 

#### Middleend

Use the output from gen-reproducer to get unoptimized IR `-disable-O0-optnone`
is your friend, if you want passes to work on the IR generated at `-O0`. I've
wasted plenty of time forgetting that the `optnone` attribute is added at `O0`,
so try to avoid that headache.

The tool you'll use is `llvm-reduce` for these, since you'll start w/ IR.
Thankfully, `llvm-reduce` is usually **much** faster than `creduce`, so its
a win.

However you need to know what passes to run or what pipeline to use. Get clang
to tell you the pipeline w/ `-mllvm -print-pipeline-passes`.
`llvm/utils/reduce_pipeline.py` is very helpful here, and I consult
https://www.npopov.com/2023/10/22/How-to-reduce-LLVM-crashes.html#special-cases
whenever I need to do this.

If you've bisected to some change already, you can diff the output from
`-print-after-all` between the two toolchains to figure out which pass is the
culprit.


#### Backend

These can be some of the most challenging, but typically I still use
`llvm-reduce` and use an `llc` command to reduce the case.

#### LTO

`--save-temps` is essential if you have the luck to debug a "miscompile" that
only happens in LTO. I use quotes here because in my experience, LTO is the
greatest sanitizer for developers relying on undefined behavior. Usually, we
see assumptions about what was allowed to happen when TUs were separate, like
certain types of inlining being impossible, or that the compiler couldn't
optimize something since inputs weren't constant ... but really were under LTO.

I follow
https://www.npopov.com/2023/10/22/How-to-reduce-LLVM-crashes.html#reproducing-in-optllc
religiously here.

Usually, this is my go to command:
```bash
for f in *.precodegen.bc; do echo $f; llc < $f > /dev/null; done
```

### Making a script 

If you're starting w/ `-gen-reproducer` output, I use the following procedure.

1. Save the CC1 command in a variable. Sometimes I format it so that each line
   has its own option. This is typically the regex I use to do this in `vim`:
   `s/ "-/ \\\r\t"-/g`. It just splits lines on options w/ `-`, and adds some
   indentation. It also adds the trailing `/`, so its a valid command.

2. Figure out how to detect the error. If its an assertion failure, things are
   easy, and you can just take the output from `-gen-reproducer` and give it to
   https://github.com/llvm/llvm-project/blob/main/clang/utils/creduce-clang-crash.py.
   Otherwise, I normally write a test with FileCheck, since I often want the
   test case anyway.

3. Reduce options. The `cc1` command probably has a lot of options, and you can
   normally remove many of them and keep the same behavior. It also pays to use
   options like `-###`, `-fdriver-only`, or `-emit-llvm` to avoid doing more
   work than necessary. Avoiding codgen for an issue in the driver, or in Sema
   can really speed things up.

### Non-determinism :(

Trying to run down non-determinism is ... well its a **pain**. I wish I had
some sage advice here, but the truth is you're going to need some time... maybe
a lot of time. It's not all doom an gloom though. Typically non-determinism is
introduced in LLVM via iteration of a datastructure sorted by pointer value.
Sometimes its not that exactly and its just an unordered container, but
frequently someone sorts a `SmallVector<Instruction*>`, and its up to you to
figure out where and how that affects the output.

So given that a heap allocated thing is being sorted differently, how can we
make it reproduce more reliably? `LD_PRELOAD=/path/to/libSomeOtherMalloc.so`.
That's really been the key for me in these cases, as forcing the compiler to
use a different allocator is enough to increase the frequency at which pointers
are different and trigger the behavior.

Scripts for these typically look like the following:

```bash
CMD=clang -O2 foo.c -mllvm -print-after-all -mllvm -print-module-scope
${CMD}  -o first.o &> first.log
 for i in {1..100}
 do
 ${CMD} -o second.o &> second.log
 cmp first.o second.o
 if [ $? != 0 ]; then
   exit 0;
 fi
 done
 exit 1
```

This really just compiles the source file the same twice and stops when it
produces different output. The other thing I've done is to save the output from
`-print-after-all` w/ the full module scope. That's a bit of overkill, but it
helps to determine which pass introduced the non-determinism, and then I have
a full module I can use to reduce the behavior w/ `llvm-reduce`. An alternate
way to do this is to not use `-print-module-scope`, but manually determine
which pass starts having differences and then just emit the IR before that pass
w/ `-pint-before=passname`. It's a non-deterministic behavior, though, so
I usually hedge my bets and am willing to trade some manual effort for a sure
result.


## Other resources

- [How to reduce LLVM crashes](https://www.npopov.com/2023/10/22/How-to-reduce-LLVM-crashes.html)
- [bugpoint](https://llvm.org/docs/CommandGuide/bugpoint.html).
- [Finding Compiler Bugs With C-Reduce](https://nickdesaulniers.github.io/blog/2019/01/18/finding-compiler-bugs-with-c-reduce/)
- [Reducing an LTO Linux kernel bug with cvise](https://nathanchance.dev/posts/cvise-lto-kernel-bug/)


