#!/bin/bash

# Crash reproducer for Fuchsia clang version 18.0.0git (https://github.com/llvm/llvm-project 47e117c25b011fe0fa241b9615311ef998fbe0b7)
# Driver args: "--driver-mode=g++" "-x" "c++" "--target=riscv32-unknown-elf" "-mabi=ilp32f" "-march=rv32imafc" "-Wno-redundant-decls" "-Wno-unused-variable" "-Oz" "-fdiagnostics-color" "-g" "-fno-common" "-fno-exceptions" "-ffunction-sections" "-fdata-sections" "-fomit-frame-pointer" "-Wall" "-Wextra" "-Wimplicit-fallthrough" "-Wcast-qual" "-Wundef" "-Wpointer-arith" "-Werror" "-Wno-error=cpp" "-Wno-error=deprecated-declarations" "-Wshadow" "-Wredundant-decls" "-Wno-missing-field-initializers" "-fno-jump-tables" "-fmessage-length=0" "-fomit-frame-pointer" "-fno-strict-aliasing" "-fshort-wchar" "-g3" "-Wno-redundant-decls" "-Wno-unused-variable" "-Wno-error=packed-not-aligned" "-fno-rtti" "-Wnon-virtual-dtor" "-std=c++17" "-Wno-register" "-Wno-missing-field-initializers" "-Wno-unknown-warning-option" "-Wno-vla-cxx-extension" "-fno-use-cxa-atexit" "-isystem" "/usr/local/google/home/phosek/experiment/baremetal/include/riscv32-unknown-elf" "-Xclang" "-fmerge-functions" "pb_decode.c" "-c" "-o" "pb_decode.o" "-fshort-enums" "-mllvm" "-enable-gvn-sink=1" "-gen-reproducer"
# Original command:  "/usr/local/google/home/phosek/experiment/baremetal/bin/llvm" "clang++" "-cc1" "-triple" "riscv32-unknown-unknown-elf" "-emit-obj" "-disable-free" "-clear-ast-before-backend" "-main-file-name" "pb_decode.c" "-mrelocation-model" "static" "-fno-jump-tables" "-mframe-pointer=none" "-relaxed-aliasing" "-fmath-errno" "-ffp-contract=on" "-fno-rounding-math" "-mconstructor-aliases" "-nostdsysteminc" "-target-cpu" "generic-rv32" "-target-feature" "+m" "-target-feature" "+a" "-target-feature" "+f" "-target-feature" "+c" "-target-feature" "+zicsr" "-target-feature" "-d" "-target-feature" "-e" "-target-feature" "-h" "-target-feature" "-smaia" "-target-feature" "-ssaia" "-target-feature" "-svinval" "-target-feature" "-svnapot" "-target-feature" "-svpbmt" "-target-feature" "-v" "-target-feature" "-xcvalu" "-target-feature" "-xcvbi" "-target-feature" "-xcvbitmanip" "-target-feature" "-xcvelw" "-target-feature" "-xcvmac" "-target-feature" "-xcvmem" "-target-feature" "-xcvsimd" "-target-feature" "-xsfvcp" "-target-feature" "-xsfvfnrclipxfqf" "-target-feature" "-xsfvfwmaccqqq" "-target-feature" "-xsfvqmaccdod" "-target-feature" "-xsfvqmaccqoq" "-target-feature" "-xtheadba" "-target-feature" "-xtheadbb" "-target-feature" "-xtheadbs" "-target-feature" "-xtheadcmo" "-target-feature" "-xtheadcondmov" "-target-feature" "-xtheadfmemidx" "-target-feature" "-xtheadmac" "-target-feature" "-xtheadmemidx" "-target-feature" "-xtheadmempair" "-target-feature" "-xtheadsync" "-target-feature" "-xtheadvdot" "-target-feature" "-xventanacondops" "-target-feature" "-zawrs" "-target-feature" "-zba" "-target-feature" "-zbb" "-target-feature" "-zbc" "-target-feature" "-zbkb" "-target-feature" "-zbkc" "-target-feature" "-zbkx" "-target-feature" "-zbs" "-target-feature" "-zca" "-target-feature" "-zcb" "-target-feature" "-zcd" "-target-feature" "-zce" "-target-feature" "-zcf" "-target-feature" "-zcmp" "-target-feature" "-zcmt" "-target-feature" "-zdinx" "-target-feature" "-zfa" "-target-feature" "-zfh" "-target-feature" "-zfhmin" "-target-feature" "-zfinx" "-target-feature" "-zhinx" "-target-feature" "-zhinxmin" "-target-feature" "-zicbom" "-target-feature" "-zicbop" "-target-feature" "-zicboz" "-target-feature" "-zicntr" "-target-feature" "-zifencei" "-target-feature" "-zihintntl" "-target-feature" "-zihintpause" "-target-feature" "-zihpm" "-target-feature" "-zk" "-target-feature" "-zkn" "-target-feature" "-zknd" "-target-feature" "-zkne" "-target-feature" "-zknh" "-target-feature" "-zkr" "-target-feature" "-zks" "-target-feature" "-zksed" "-target-feature" "-zksh" "-target-feature" "-zkt" "-target-feature" "-zmmul" "-target-feature" "-zvbb" "-target-feature" "-zvbc" "-target-feature" "-zve32f" "-target-feature" "-zve32x" "-target-feature" "-zve64d" "-target-feature" "-zve64f" "-target-feature" "-zve64x" "-target-feature" "-zvfh" "-target-feature" "-zvfhmin" "-target-feature" "-zvkb" "-target-feature" "-zvkg" "-target-feature" "-zvkn" "-target-feature" "-zvknc" "-target-feature" "-zvkned" "-target-feature" "-zvkng" "-target-feature" "-zvknha" "-target-feature" "-zvknhb" "-target-feature" "-zvks" "-target-feature" "-zvksc" "-target-feature" "-zvksed" "-target-feature" "-zvksg" "-target-feature" "-zvksh" "-target-feature" "-zvkt" "-target-feature" "-zvl1024b" "-target-feature" "-zvl128b" "-target-feature" "-zvl16384b" "-target-feature" "-zvl2048b" "-target-feature" "-zvl256b" "-target-feature" "-zvl32768b" "-target-feature" "-zvl32b" "-target-feature" "-zvl4096b" "-target-feature" "-zvl512b" "-target-feature" "-zvl64b" "-target-feature" "-zvl65536b" "-target-feature" "-zvl8192b" "-target-feature" "-experimental-zacas" "-target-feature" "-experimental-zcmop" "-target-feature" "-experimental-zfbfmin" "-target-feature" "-experimental-zicfilp" "-target-feature" "-experimental-zicfiss" "-target-feature" "-experimental-zicond" "-target-feature" "-experimental-zimop" "-target-feature" "-experimental-ztso" "-target-feature" "-experimental-zvfbfmin" "-target-feature" "-experimental-zvfbfwma" "-target-feature" "+relax" "-target-abi" "ilp32f" "-msmall-data-limit" "8" "-debug-info-kind=constructor" "-dwarf-version=4" "-debugger-tuning=gdb" "-fdebug-compilation-dir=/usr/local/google/home/phosek/experiment" "-ffunction-sections" "-fdata-sections" "-fcoverage-compilation-dir=/usr/local/google/home/phosek/experiment" "-resource-dir" "/usr/local/google/home/phosek/experiment/baremetal/lib/clang/18" "-isystem" "/usr/local/google/home/phosek/experiment/baremetal/include/riscv32-unknown-elf" "-internal-isystem" "/usr/local/google/home/phosek/experiment/baremetal/bin/../lib/clang-runtimes/riscv32-unknown-elf/rv32imafc/ilp32f/include/c++/v1" "-internal-isystem" "/usr/local/google/home/phosek/experiment/baremetal/lib/clang/18/include" "-internal-isystem" "/usr/local/google/home/phosek/experiment/baremetal/bin/../lib/clang-runtimes/riscv32-unknown-elf/rv32imafc/ilp32f/include" "-Oz" "-Wno-redundant-decls" "-Wno-unused-variable" "-Wall" "-Wextra" "-Wimplicit-fallthrough" "-Wcast-qual" "-Wundef" "-Wpointer-arith" "-Werror" "-Wno-error=cpp" "-Wno-error=deprecated-declarations" "-Wshadow" "-Wredundant-decls" "-Wno-missing-field-initializers" "-Wno-redundant-decls" "-Wno-unused-variable" "-Wno-error=packed-not-aligned" "-Wnon-virtual-dtor" "-Wno-register" "-Wno-missing-field-initializers" "-Wno-unknown-warning-option" "-Wno-vla-cxx-extension" "-std=c++17" "-fdeprecated-macro" "-ferror-limit" "19" "-fno-rtti" "-fshort-enums" "-fno-signed-char" "-fwchar-type=short" "-fno-signed-wchar" "-fno-use-cxa-atexit" "-fgnuc-version=4.2.1" "-fcolor-diagnostics" "-vectorize-slp" "-fmerge-functions" "-mllvm" "-enable-gvn-sink=1" "-faddrsig" "-D__GCC_HAVE_DWARF2_CFI_ASM=1" "-o" "pb_decode.o" "-x" "c++" "pb_decode.c"
CMD="$HOME/llvm-fork/build/bin/clang++" "-cc1" "-triple" "riscv32-unknown-unknown-elf" "-emit-obj" "-disable-free" "-clear-ast-before-backend" "-main-file-name" "pb_decode.c" "-mrelocation-model" "static" "-fno-jump-tables" "-mframe-pointer=none" "-relaxed-aliasing" "-fmath-errno" "-ffp-contract=on" "-fno-rounding-math" "-mconstructor-aliases" "-nostdsysteminc" "-target-cpu" "generic-rv32" "-target-feature" "+m" "-target-feature" "+a" "-target-feature" "+f" "-target-feature" "+c" "-target-feature" "+zicsr" "-target-feature" "-d" "-target-feature" "-e" "-target-feature" "-h" "-target-feature" "-smaia" "-target-feature" "-ssaia" "-target-feature" "-svinval" "-target-feature" "-svnapot" "-target-feature" "-svpbmt" "-target-feature" "-v" "-target-feature" "-xcvalu" "-target-feature" "-xcvbi" "-target-feature" "-xcvbitmanip" "-target-feature" "-xcvelw" "-target-feature" "-xcvmac" "-target-feature" "-xcvmem" "-target-feature" "-xcvsimd" "-target-feature" "-xsfvcp" "-target-feature" "-xsfvfnrclipxfqf" "-target-feature" "-xsfvfwmaccqqq" "-target-feature" "-xsfvqmaccdod" "-target-feature" "-xsfvqmaccqoq" "-target-feature" "-xtheadba" "-target-feature" "-xtheadbb" "-target-feature" "-xtheadbs" "-target-feature" "-xtheadcmo" "-target-feature" "-xtheadcondmov" "-target-feature" "-xtheadfmemidx" "-target-feature" "-xtheadmac" "-target-feature" "-xtheadmemidx" "-target-feature" "-xtheadmempair" "-target-feature" "-xtheadsync" "-target-feature" "-xtheadvdot" "-target-feature" "-xventanacondops" "-target-feature" "-zawrs" "-target-feature" "-zba" "-target-feature" "-zbb" "-target-feature" "-zbc" "-target-feature" "-zbkb" "-target-feature" "-zbkc" "-target-feature" "-zbkx" "-target-feature" "-zbs" "-target-feature" "-zca" "-target-feature" "-zcb" "-target-feature" "-zcd" "-target-feature" "-zce" "-target-feature" "-zcf" "-target-feature" "-zcmp" "-target-feature" "-zcmt" "-target-feature" "-zdinx" "-target-feature" "-zfa" "-target-feature" "-zfh" "-target-feature" "-zfhmin" "-target-feature" "-zfinx" "-target-feature" "-zhinx" "-target-feature" "-zhinxmin" "-target-feature" "-zicbom" "-target-feature" "-zicbop" "-target-feature" "-zicboz" "-target-feature" "-zicntr" "-target-feature" "-zifencei" "-target-feature" "-zihintntl" "-target-feature" "-zihintpause" "-target-feature" "-zihpm" "-target-feature" "-zk" "-target-feature" "-zkn" "-target-feature" "-zknd" "-target-feature" "-zkne" "-target-feature" "-zknh" "-target-feature" "-zkr" "-target-feature" "-zks" "-target-feature" "-zksed" "-target-feature" "-zksh" "-target-feature" "-zkt" "-target-feature" "-zmmul" "-target-feature" "-zvbb" "-target-feature" "-zvbc" "-target-feature" "-zve32f" "-target-feature" "-zve32x" "-target-feature" "-zve64d" "-target-feature" "-zve64f" "-target-feature" "-zve64x" "-target-feature" "-zvfh" "-target-feature" "-zvfhmin" "-target-feature" "-zvkb" "-target-feature" "-zvkg" "-target-feature" "-zvkn" "-target-feature" "-zvknc" "-target-feature" "-zvkned" "-target-feature" "-zvkng" "-target-feature" "-zvknha" "-target-feature" "-zvknhb" "-target-feature" "-zvks" "-target-feature" "-zvksc" "-target-feature" "-zvksed" "-target-feature" "-zvksg" "-target-feature" "-zvksh" "-target-feature" "-zvkt" "-target-feature" "-zvl1024b" "-target-feature" "-zvl128b" "-target-feature" "-zvl16384b" "-target-feature" "-zvl2048b" "-target-feature" "-zvl256b" "-target-feature" "-zvl32768b" "-target-feature" "-zvl32b" "-target-feature" "-zvl4096b" "-target-feature" "-zvl512b" "-target-feature" "-zvl64b" "-target-feature" "-zvl65536b" "-target-feature" "-zvl8192b" "-target-feature" "-experimental-zacas" "-target-feature" "-experimental-zcmop" "-target-feature" "-experimental-zfbfmin" "-target-feature" "-experimental-zicfilp" "-target-feature" "-experimental-zicfiss" "-target-feature" "-experimental-zicond" "-target-feature" "-experimental-zimop" "-target-feature" "-experimental-ztso" "-target-feature" "-experimental-zvfbfmin" "-target-feature" "-experimental-zvfbfwma" "-target-feature" "+relax" "-target-abi" "ilp32f" "-msmall-data-limit" "8" "-debug-info-kind=constructor" "-dwarf-version=4" "-debugger-tuning=gdb" "-fdebug-compilation-dir=/usr/local/google/home/phosek/experiment" "-ffunction-sections" "-fdata-sections" "-fcoverage-compilation-dir=/usr/local/google/home/phosek/experiment" "-Oz" "-Wno-redundant-decls" "-Wno-unused-variable" "-Wall" "-Wextra" "-Wimplicit-fallthrough" "-Wcast-qual" "-Wundef" "-Wpointer-arith" "-Werror" "-Wno-error=cpp" "-Wno-error=deprecated-declarations" "-Wshadow" "-Wredundant-decls" "-Wno-missing-field-initializers" "-Wno-redundant-decls" "-Wno-unused-variable" "-Wno-error=packed-not-aligned" "-Wnon-virtual-dtor" "-Wno-register" "-Wno-missing-field-initializers" "-Wno-unknown-warning-option" "-Wno-vla-cxx-extension" "-std=c++17" "-fdeprecated-macro" "-ferror-limit" "19" "-fno-rtti" "-fshort-enums" "-fno-signed-char" "-fwchar-type=short" "-fno-signed-wchar" "-fno-use-cxa-atexit" "-fgnuc-version=4.2.1" "-fcolor-diagnostics" "-vectorize-slp" "-fmerge-functions" "-mllvm" "-enable-gvn-sink=1" "-faddrsig" "-D__GCC_HAVE_DWARF2_CFI_ASM=1" "-x" "c++" "pb_decode-18f258.cpp" -mllvm -print-after-all -mllvm -print-module-scope

# We're emitting a full LLVM module after each pass
# Once we have nondeterministic output, we can diff the (very very large) output
# When they diverge, we know what pass to look at!
# We then can copy out the IR in the module just before they differ(we use -print-after-all)
# and use llvm-reduce

${CMD} -o first.o &> first.log
 if [ $? != 0 ]; then
   echo "can't compile"
   exit 1;
 fi

 for i in {1..100}
 do
 ${CMD} -o second.o &> second.log
 if [ $? != 0 ]; then
   echo "can't compile"
  exit 1;
 fi

 cmp first.o second.o
 if [ $? != 0 ]; then
   exit 0;
 fi

 done

 exit 1


## sometimes I like to be able to see all the options
# CMD="$HOME/llvm-fork/build/bin/clang++" \
# 	"-cc1" \
# 	"-triple" "riscv32-unknown-unknown-elf" \
# 	"-emit-obj" \
# 	"-disable-free" \
# 	"-clear-ast-before-backend" \
# 	"-main-file-name" "pb_decode.c" \
# 	"-mrelocation-model" "static" \
# 	"-fno-jump-tables" \
# 	"-mframe-pointer=none" \
# 	"-relaxed-aliasing" \
# 	"-fmath-errno" \
# 	"-ffp-contract=on" \
# 	"-fno-rounding-math" \
# 	"-mconstructor-aliases" \
# 	"-nostdsysteminc" \
# 	"-target-cpu" "generic-rv32" \
# 	"-target-feature" "+m" \
# 	"-target-feature" "+a" \
# 	"-target-feature" "+f" \
# 	"-target-feature" "+c" \
# 	"-target-feature" "+zicsr" \
# 	"-target-feature" \
# 	"-d" \
# 	"-target-feature" \
# 	"-e" \
# 	"-target-feature" \
# 	"-h" \
# 	"-target-feature" \
# 	"-smaia" \
# 	"-target-feature" \
# 	"-ssaia" \
# 	"-target-feature" \
# 	"-svinval" \
# 	"-target-feature" \
# 	"-svnapot" \
# 	"-target-feature" \
# 	"-svpbmt" \
# 	"-target-feature" \
# 	"-v" \
# 	"-target-feature" \
# 	"-xcvalu" \
# 	"-target-feature" \
# 	"-xcvbi" \
# 	"-target-feature" \
# 	"-xcvbitmanip" \
# 	"-target-feature" \
# 	"-xcvelw" \
# 	"-target-feature" \
# 	"-xcvmac" \
# 	"-target-feature" \
# 	"-xcvmem" \
# 	"-target-feature" \
# 	"-xcvsimd" \
# 	"-target-feature" \
# 	"-xsfvcp" \
# 	"-target-feature" \
# 	"-xsfvfnrclipxfqf" \
# 	"-target-feature" \
# 	"-xsfvfwmaccqqq" \
# 	"-target-feature" \
# 	"-xsfvqmaccdod" \
# 	"-target-feature" \
# 	"-xsfvqmaccqoq" \
# 	"-target-feature" \
# 	"-xtheadba" \
# 	"-target-feature" \
# 	"-xtheadbb" \
# 	"-target-feature" \
# 	"-xtheadbs" \
# 	"-target-feature" \
# 	"-xtheadcmo" \
# 	"-target-feature" \
# 	"-xtheadcondmov" \
# 	"-target-feature" \
# 	"-xtheadfmemidx" \
# 	"-target-feature" \
# 	"-xtheadmac" \
# 	"-target-feature" \
# 	"-xtheadmemidx" \
# 	"-target-feature" \
# 	"-xtheadmempair" \
# 	"-target-feature" \
# 	"-xtheadsync" \
# 	"-target-feature" \
# 	"-xtheadvdot" \
# 	"-target-feature" \
# 	"-xventanacondops" \
# 	"-target-feature" \
# 	"-zawrs" \
# 	"-target-feature" \
# 	"-zba" \
# 	"-target-feature" \
# 	"-zbb" \
# 	"-target-feature" \
# 	"-zbc" \
# 	"-target-feature" \
# 	"-zbkb" \
# 	"-target-feature" \
# 	"-zbkc" \
# 	"-target-feature" \
# 	"-zbkx" \
# 	"-target-feature" \
# 	"-zbs" \
# 	"-target-feature" \
# 	"-zca" \
# 	"-target-feature" \
# 	"-zcb" \
# 	"-target-feature" \
# 	"-zcd" \
# 	"-target-feature" \
# 	"-zce" \
# 	"-target-feature" \
# 	"-zcf" \
# 	"-target-feature" \
# 	"-zcmp" \
# 	"-target-feature" \
# 	"-zcmt" \
# 	"-target-feature" \
# 	"-zdinx" \
# 	"-target-feature" \
# 	"-zfa" \
# 	"-target-feature" \
# 	"-zfh" \
# 	"-target-feature" \
# 	"-zfhmin" \
# 	"-target-feature" \
# 	"-zfinx" \
# 	"-target-feature" \
# 	"-zhinx" \
# 	"-target-feature" \
# 	"-zhinxmin" \
# 	"-target-feature" \
# 	"-zicbom" \
# 	"-target-feature" \
# 	"-zicbop" \
# 	"-target-feature" \
# 	"-zicboz" \
# 	"-target-feature" \
# 	"-zicntr" \
# 	"-target-feature" \
# 	"-zifencei" \
# 	"-target-feature" \
# 	"-zihintntl" \
# 	"-target-feature" \
# 	"-zihintpause" \
# 	"-target-feature" \
# 	"-zihpm" \
# 	"-target-feature" \
# 	"-zk" \
# 	"-target-feature" \
# 	"-zkn" \
# 	"-target-feature" \
# 	"-zknd" \
# 	"-target-feature" \
# 	"-zkne" \
# 	"-target-feature" \
# 	"-zknh" \
# 	"-target-feature" \
# 	"-zkr" \
# 	"-target-feature" \
# 	"-zks" \
# 	"-target-feature" \
# 	"-zksed" \
# 	"-target-feature" \
# 	"-zksh" \
# 	"-target-feature" \
# 	"-zkt" \
# 	"-target-feature" \
# 	"-zmmul" \
# 	"-target-feature" \
# 	"-zvbb" \
# 	"-target-feature" \
# 	"-zvbc" \
# 	"-target-feature" \
# 	"-zve32f" \
# 	"-target-feature" \
# 	"-zve32x" \
# 	"-target-feature" \
# 	"-zve64d" \
# 	"-target-feature" \
# 	"-zve64f" \
# 	"-target-feature" \
# 	"-zve64x" \
# 	"-target-feature" \
# 	"-zvfh" \
# 	"-target-feature" \
# 	"-zvfhmin" \
# 	"-target-feature" \
# 	"-zvkb" \
# 	"-target-feature" \
# 	"-zvkg" \
# 	"-target-feature" \
# 	"-zvkn" \
# 	"-target-feature" \
# 	"-zvknc" \
# 	"-target-feature" \
# 	"-zvkned" \
# 	"-target-feature" \
# 	"-zvkng" \
# 	"-target-feature" \
# 	"-zvknha" \
# 	"-target-feature" \
# 	"-zvknhb" \
# 	"-target-feature" \
# 	"-zvks" \
# 	"-target-feature" \
# 	"-zvksc" \
# 	"-target-feature" \
# 	"-zvksed" \
# 	"-target-feature" \
# 	"-zvksg" \
# 	"-target-feature" \
# 	"-zvksh" \
# 	"-target-feature" \
# 	"-zvkt" \
# 	"-target-feature" \
# 	"-zvl1024b" \
# 	"-target-feature" \
# 	"-zvl128b" \
# 	"-target-feature" \
# 	"-zvl16384b" \
# 	"-target-feature" \
# 	"-zvl2048b" \
# 	"-target-feature" \
# 	"-zvl256b" \
# 	"-target-feature" \
# 	"-zvl32768b" \
# 	"-target-feature" \
# 	"-zvl32b" \
# 	"-target-feature" \
# 	"-zvl4096b" \
# 	"-target-feature" \
# 	"-zvl512b" \
# 	"-target-feature" \
# 	"-zvl64b" \
# 	"-target-feature" \
# 	"-zvl65536b" \
# 	"-target-feature" \
# 	"-zvl8192b" \
# 	"-target-feature" \
# 	"-experimental-zacas" \
# 	"-target-feature" \
# 	"-experimental-zcmop" \
# 	"-target-feature" \
# 	"-experimental-zfbfmin" \
# 	"-target-feature" \
# 	"-experimental-zicfilp" \
# 	"-target-feature" \
# 	"-experimental-zicfiss" \
# 	"-target-feature" \
# 	"-experimental-zicond" \
# 	"-target-feature" \
# 	"-experimental-zimop" \
# 	"-target-feature" \
# 	"-experimental-ztso" \
# 	"-target-feature" \
# 	"-experimental-zvfbfmin" \
# 	"-target-feature" \
# 	"-experimental-zvfbfwma" \
# 	"-target-feature" "+relax" \
# 	"-target-abi" "ilp32f" \
# 	"-msmall-data-limit" "8" \
# 	"-debug-info-kind=constructor" \
# 	"-dwarf-version=4" \
# 	"-debugger-tuning=gdb" \
# 	"-fdebug-compilation-dir=/usr/local/google/home/phosek/experiment" \
# 	"-ffunction-sections" \
# 	"-fdata-sections" \
# 	"-fcoverage-compilation-dir=/usr/local/google/home/phosek/experiment" \
# 	"-Oz" \
# 	"-Wno-redundant-decls" \
# 	"-Wno-unused-variable" \
# 	"-Wall" \
# 	"-Wextra" \
# 	"-Wimplicit-fallthrough" \
# 	"-Wcast-qual" \
# 	"-Wundef" \
# 	"-Wpointer-arith" \
# 	"-Werror" \
# 	"-Wno-error=cpp" \
# 	"-Wno-error=deprecated-declarations" \
# 	"-Wshadow" \
# 	"-Wredundant-decls" \
# 	"-Wno-missing-field-initializers" \
# 	"-Wno-redundant-decls" \
# 	"-Wno-unused-variable" \
# 	"-Wno-error=packed-not-aligned" \
# 	"-Wnon-virtual-dtor" \
# 	"-Wno-register" \
# 	"-Wno-missing-field-initializers" \
# 	"-Wno-unknown-warning-option" \
# 	"-Wno-vla-cxx-extension" \
# 	"-std=c++17" \
# 	"-fdeprecated-macro" \
# 	"-ferror-limit" "19" \
# 	"-fno-rtti" \
# 	"-fshort-enums" \
# 	"-fno-signed-char" \
# 	"-fwchar-type=short" \
# 	"-fno-signed-wchar" \
# 	"-fno-use-cxa-atexit" \
# 	"-fgnuc-version=4.2.1" \
# 	"-fcolor-diagnostics" \
# 	"-vectorize-slp" \
# 	"-fmerge-functions" \
# 	"-mllvm" \
# 	"-enable-gvn-sink=1" \
# 	"-faddrsig" \
# 	"-D__GCC_HAVE_DWARF2_CFI_ASM=1" \
# 	"-x" "c++" "pb_decode-18f258.cpp" -o first.o -mllvm -print-after-all -mllvm -print-module-scope

