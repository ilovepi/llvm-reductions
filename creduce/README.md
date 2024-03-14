# Using creduce for compiler bugs

First, most of this information isn't new. Much of it comes from my fellow LLVM
developers, but I've found it useful to have my own notes and templates.

`creduce` is a tool for reducing C and C++ code examples based on some
"interestingness" test. Typically this takes the form of a script that returns
`0` when something interesting happens. Any other return code are assumed
"uninteresting", and shouldn't be used. There's some caveats to that, as you
can provide a list of other return codes that are also interesting. For `clang`
that is usually `127`.


A simple way to generate a basic version of such a script is to use the
`-gen-reproducer=always` flag w/ clang, which will generate a source file that
is preprocessed and an accompanying script which will give you the full `cc1`
compiler invocation.

From there its usually a matter of just making sure the script returns
something useful. For example, if something should error, you likely want to
detect that error (probably using `grep`), and `exit 0` if the "interesting"
behavior happens.

If you're an LLVM developer, I'd recommend using `FileCheck` in place of other
methods. As a bonus, you end up w/ a ready made test case.

## Example

This directory has a pretty simple example. Its a real reduced case from
https://github.com/llvm/llvm-project/issues/77852. We found this when building
Fuchsia, as we have some builders that test the compiler for non-deterministic
behavior. Often we've found rather benign differences in debug info, for
instance the ordering of DWARF entries being reversed in a location list. In
those cases the non-determinism isn't a "real" bug per se, as nothing will
behave differently at runtime. However, we rely heavily on hashing binaries and
on BuildID in particular to enable caching in our distributed build system.
This is pretty typical of how large software corporations orchestrate their
build pipelines, so its important that given the same inputs and compiler
switches we have a consistent version of the binary artifacts that were
generated. For GVN Sink, this is just a bug, and it isn't clear how severe it
is or not. At first glance it seems like may just miss optimization
opportunities, but I'm not completely certain.

`foo.cpp` is an already reduce file (I know not the best example, but it was on
hand).

`foo.sh` is the script I used to ultimately reduce `foo.cpp` from a several
hundred MB pre-processed C++ file. You'll notice that right now I have it
written to dump the LLVM IR after every pass w/ 


