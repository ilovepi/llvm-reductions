#!/bin/bash

# LLVM build directory
LLVM_BUILD_DIR=$HOME/llvm-project/build

# try to build clang (or whatever projects you need)
ninja -C $LLVM_BUILD_DIR clang -j2048 || exit 125

# The following test is basically the output from
# https://github.com/llvm/llvm-project/blob/main/clang/utils/creduce-clang-crash.py
# If you do the creduce step you can get a much shorter commandline. The big
# difference is that the exit codes are reversed. Creduce thinks 1 is
# interesting and zero is not. bisect thinks 0 is "good" and anything else is
# "bad". 125 is special in that it means the project can't build, so skip this
# revision In this case the we were trying to bisect which revision introduced
# an assertion failure in clang, so the exit code situation was easy.
# If you want to try this case out use https://github.com/llvm/llvm-project/commit/a61f9fe31750cee65c726fb51f1b14e31e177258
export LLVM_DISABLE_SYMBOLIZATION=1
if $LLVM_BUILD_DIR/bin/clang -cc1 -triple aarch64-unknown-linux-gnu -O3 -emit-llvm PHIElimination-360586.reduced.cpp >& t.log ; then
  exit 0
fi
grep -F 'Assertion `i < NumUserOperands && "getOperand() out of range!"'"'"' failed' t.log && exit 1 || exit 0

