; ModuleID = 'before.ll'
source_filename = "pb_decode-18f258.cpp"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

@a = dso_local local_unnamed_addr global i8 0, align 1, !dbg !0
@f = dso_local local_unnamed_addr global i8 0, align 1, !dbg !5
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1, !dbg !9

; Function Attrs: minsize mustprogress nounwind optsize
define dso_local noundef zeroext i1 @_Z3fn3b(i1 noundef zeroext %i) local_unnamed_addr #0 !dbg !23 {
entry:
  tail call void @llvm.dbg.value(metadata i1 %i, metadata !27, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !30
  call void @llvm.dbg.value(metadata ptr undef, metadata !31, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.value(metadata i1 %i, metadata !37, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !47
  call void @llvm.dbg.value(metadata ptr null, metadata !38, metadata !DIExpression()), !dbg !47
  br label %do.body.i, !dbg !49

do.body.i:                                        ; preds = %if.end22.i, %entry
  %call.i = call noundef zeroext i1 @_Z1gv() #4, !dbg !50
  br i1 %call.i, label %if.then3.i, label %if.end22.i, !dbg !53

if.then3.i:                                       ; preds = %do.body.i
  %0 = load i8, ptr @f, align 1, !dbg !54, !range !58, !noundef !59
  %tobool4.not.i = icmp eq i8 %0, 0, !dbg !54
  br i1 %tobool4.not.i, label %if.end9.i, label %if.then5.i, !dbg !60

if.then5.i:                                       ; preds = %if.then3.i
  br label %_ZL1hPjb.exit.gvnsink.split, !dbg !61

if.end9.i:                                        ; preds = %if.then3.i
  %1 = load i8, ptr @a, align 1, !dbg !62
  %tobool10.not.i = icmp eq i8 %1, 0, !dbg !62
  br i1 %tobool10.not.i, label %do.end.i, label %if.then11.i, !dbg !64

if.then11.i:                                      ; preds = %if.end9.i
  br label %_ZL1hPjb.exit.gvnsink.split, !dbg !65

if.end22.i:                                       ; preds = %do.body.i
  %.pr.i = load i8, ptr @a, align 1, !dbg !66
  call void @llvm.dbg.value(metadata i8 7, metadata !46, metadata !DIExpression()), !dbg !47
  %tobool23.not.i = icmp eq i8 %.pr.i, 0, !dbg !66
  br i1 %tobool23.not.i, label %do.end.i, label %do.body.i, !dbg !67, !llvm.loop !68

do.end.i:                                         ; preds = %if.end22.i, %if.end9.i
  tail call void @llvm.dbg.value(metadata i32 5, metadata !28, metadata !DIExpression()), !dbg !30
  br label %_ZL1hPjb.exit, !dbg !71

_ZL1hPjb.exit.gvnsink.split:                      ; preds = %if.then11.i, %if.then5.i
  %2 = load ptr, ptr inttoptr (i32 4 to ptr), align 4, !dbg !61
  %tobool6.not.i = icmp eq ptr %2, null, !dbg !61
  %..str.i = select i1 %tobool6.not.i, ptr @.str, ptr %2, !dbg !61
  store ptr %..str.i, ptr inttoptr (i32 4 to ptr), align 4, !dbg !61
  br label %_ZL1hPjb.exit, !dbg !72

_ZL1hPjb.exit:                                    ; preds = %_ZL1hPjb.exit.gvnsink.split, %do.end.i
  tail call void @llvm.dbg.value(metadata i32 1, metadata !28, metadata !DIExpression()), !dbg !30
  ret i1 true, !dbg !72
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: minsize optsize
declare !dbg !73 dso_local noundef zeroext i1 @_Z1gv() local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.assign(metadata, metadata, metadata, metadata, metadata, metadata) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

attributes #0 = { minsize mustprogress nounwind optsize "no-jump-tables"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+zicsr,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zicond,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zicntr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { minsize optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+zicsr,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zicond,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zicntr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { minsize nounwind optsize }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !7, line: 8, type: !13, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !3, producer: "Fuchsia clang version 18.0.0git (git@github.com:ilovepi/llvm-project a7262d2d9bee9bdfdbcd03ca27a0128c2e2b1c1a)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "pb_decode.c", directory: "/usr/local/google/home/phosek/experiment")
!4 = !{!0, !5, !9}
!5 = !DIGlobalVariableExpression(var: !6, expr: !DIExpression())
!6 = distinct !DIGlobalVariable(name: "f", scope: !2, file: !7, line: 9, type: !8, isLocal: false, isDefinition: true)
!7 = !DIFile(filename: "pb_decode-18f258.cpp", directory: "/usr/local/google/home/phosek/experiment")
!8 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(scope: null, file: !7, line: 19, type: !11, isLocal: true, isDefinition: true)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 8, elements: !14)
!12 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_unsigned_char)
!14 = !{!15}
!15 = !DISubrange(count: 1)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 2}
!19 = !{i32 1, !"target-abi", !"ilp32f"}
!20 = !{i32 8, !"SmallDataLimit", i32 8}
!21 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!22 = !{!"Fuchsia clang version 18.0.0git (git@github.com:ilovepi/llvm-project a7262d2d9bee9bdfdbcd03ca27a0128c2e2b1c1a)"}
!23 = distinct !DISubprogram(name: "fn3", linkageName: "_Z3fn3b", scope: !7, file: !7, line: 28, type: !24, scopeLine: 28, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !26)
!24 = !DISubroutineType(types: !25)
!25 = !{!8, !8}
!26 = !{!27, !28}
!27 = !DILocalVariable(name: "i", arg: 1, scope: !23, file: !7, line: 28, type: !8)
!28 = !DILocalVariable(name: "c", scope: !23, file: !7, line: 29, type: !29)
!29 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!30 = !DILocation(line: 0, scope: !23)
!31 = !DILocalVariable(name: "i", arg: 1, scope: !32, file: !7, line: 10, type: !35)
!32 = distinct !DISubprogram(name: "h", linkageName: "_ZL1hPjb", scope: !7, file: !7, line: 10, type: !33, scopeLine: 10, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !36)
!33 = !DISubroutineType(types: !34)
!34 = !{!8, !35, !8}
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 32)
!36 = !{!31, !37, !38, !46}
!37 = !DILocalVariable(name: "p2", arg: 2, scope: !32, file: !7, line: 10, type: !8)
!38 = !DILocalVariable(name: "e", scope: !32, file: !7, line: 11, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 32)
!40 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "A", file: !7, line: 3, size: 64, flags: DIFlagTypePassByValue, elements: !41, identifier: "_ZTS1A")
!41 = !{!42, !44}
!42 = !DIDerivedType(tag: DW_TAG_member, name: "d", scope: !40, file: !7, line: 4, baseType: !43, size: 32)
!43 = !DIBasicType(name: "long", size: 32, encoding: DW_ATE_signed)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "ac", scope: !40, file: !7, line: 5, baseType: !45, size: 32, offset: 32)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 32)
!46 = !DILocalVariable(name: "b", scope: !32, file: !7, line: 14, type: !13)
!47 = !DILocation(line: 0, scope: !32, inlinedAt: !48)
!48 = distinct !DILocation(line: 29, column: 14, scope: !23)
!49 = !DILocation(line: 15, column: 3, scope: !32, inlinedAt: !48)
!50 = !DILocation(line: 16, column: 9, scope: !51, inlinedAt: !48)
!51 = distinct !DILexicalBlock(scope: !52, file: !7, line: 16, column: 9)
!52 = distinct !DILexicalBlock(scope: !32, file: !7, line: 15, column: 6)
!53 = !DILocation(line: 16, column: 9, scope: !52, inlinedAt: !48)
!54 = !DILocation(line: 18, column: 13, scope: !55, inlinedAt: !48)
!55 = distinct !DILexicalBlock(scope: !56, file: !7, line: 18, column: 13)
!56 = distinct !DILexicalBlock(scope: !57, file: !7, line: 17, column: 14)
!57 = distinct !DILexicalBlock(scope: !51, file: !7, line: 17, column: 11)
!58 = !{i8 0, i8 2}
!59 = !{}
!60 = !DILocation(line: 18, column: 13, scope: !56, inlinedAt: !48)
!61 = !DILocation(line: 19, column: 11, scope: !55, inlinedAt: !48)
!62 = !DILocation(line: 20, column: 13, scope: !63, inlinedAt: !48)
!63 = distinct !DILexicalBlock(scope: !56, file: !7, line: 20, column: 13)
!64 = !DILocation(line: 20, column: 13, scope: !56, inlinedAt: !48)
!65 = !DILocation(line: 21, column: 11, scope: !63, inlinedAt: !48)
!66 = !DILocation(line: 24, column: 12, scope: !32, inlinedAt: !48)
!67 = !DILocation(line: 24, column: 3, scope: !52, inlinedAt: !48)
!68 = distinct !{!68, !49, !69, !70}
!69 = !DILocation(line: 24, column: 13, scope: !32, inlinedAt: !48)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 26, column: 3, scope: !32, inlinedAt: !48)
!72 = !DILocation(line: 30, column: 3, scope: !23)
!73 = !DISubprogram(name: "g", linkageName: "_Z1gv", scope: !7, file: !7, line: 7, type: !74, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!74 = !DISubroutineType(types: !75)
!75 = !{!8}
