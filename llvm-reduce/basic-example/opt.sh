#!/bin/bash

# Reduction scripts expect to return 0 for interesting and 1 otherwise


CMD="${HOME}/llvm-fork/build/bin/opt -passes=gvn-sink -enable-gvn-sink=1 before.ll -S"

# Run the pass over the IR and store to a file.
$CMD -o first.ll

if [ $? != 0 ]; then
 echo "can't compile first"
 exit 1;
fi

for i in {1..1000}
do
  # echo Round $i

  # Run the pass over the same input, and report that its interesting if they differ
  LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libtcmalloc_minimal.so.4  $CMD -o second.ll
  if [ $? != 0 ]; then
   echo "can't compile second"
  exit 1;
  fi

  cmp first.ll second.ll
  if [ $? != 0 ]; then
   echo Finished in round $i
   exit 0;
  fi

done

echo No difference after round $i
exit 1
