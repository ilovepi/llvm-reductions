#!/bin/bash

## llvm-reduce will pass the source IR file in as the first argument

# output file names
OUT_LL=out.ll
OUT_BC=out.bc
OUT_S=out.S
OUT_OBJ=out.o

LLVM_BIN=${HOME}/llvm-project/build/bin
OPT=${LLVM_BIN}/opt
MC=${LLVM_BIN}/llvm-mc
READELF=${LLVM_BIN}/llvm-readelf
FILECHECK=${LLVM_BIN}/FileCheck

## put your command here w/ all the necessary flags
# CMD=opt -passes="default<O3>" < "$1" -S -o ${OUT_LL}

# Saving the command is useful if you need to run it multiple times (e.g. non-determinism)
# LLC command. Be sure to specify a triple
CMD=${LLC} -mtriple=riscv64 -O3 -enable-tlsdesc -relocation-model=pic < ${OUT_LL} -o ${OUT_S}

## run the command
${CMD}
status=$?

## if you expect a crash, it isn't interesting
# [ $status -eq 0 ] && echo "Compile succeeded"  && exit 1

## But sometimes we expect multiple steps to succeed
# [ $status -eq 0 ] && echo "opt succeeded" || exit 1

## Check if we should continue or if this is non-interesting
[ $status -eq 0 ] && echo "llc succeeded" || echo "llc failed" && exit 1

## an alternate way to check for the status
${MC} -triple=riscv64 -filetype=obj --position-independent -o ${OUT_OBJ} \
    < ${OUT_S} || echo "llvm-mc failed" && exit 1

## FileCheck usually returns the code we want so nothing else to do
${READELF} --symbols ${OUT_OBJ} | FileCheck $0

## grep also works in place of FileCheck, but its less powerful and I often
#make these test cases upstream.

# CHECK: Symbol table '.symtab' contains 7 entries:
# CHECK: TLS {{.*}} unspecified
