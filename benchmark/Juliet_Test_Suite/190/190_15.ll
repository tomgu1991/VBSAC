; ModuleID = './190_15.c'
source_filename = "./190_15.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = constant i32 1, align 4
@GLOBAL_CONST_FALSE = constant i32 0, align 4
@GLOBAL_CONST_FIVE = constant i32 5, align 4
@globalTrue = global i32 1, align 4
@globalFalse = global i32 0, align 4
@globalFive = global i32 5, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.3 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrue() #0 !dbg !20 {
entry:
  ret i32 1, !dbg !23
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !24 {
entry:
  ret i32 0, !dbg !25
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !26 {
entry:
  %call = call i32 @rand() #5, !dbg !27
  %rem = srem i32 %call, 2, !dbg !28
  ret i32 %rem, !dbg !29
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !30 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !34, metadata !35), !dbg !36
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !37
  %conv = sext i8 %0 to i32, !dbg !38
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !41 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !46, metadata !35), !dbg !47
  %0 = load i8*, i8** %line.addr, align 8, !dbg !48
  %cmp = icmp ne i8* %0, null, !dbg !50
  br i1 %cmp, label %if.then, label %if.end, !dbg !51

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !52
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !54
  br label %if.end, !dbg !55

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !56
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !57 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !60, metadata !35), !dbg !61
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !62
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !65 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !70, metadata !35), !dbg !71
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !72
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nounwind uwtable
define void @bad15() #0 !dbg !75 {
entry:
  %data = alloca i64, align 8
  %result = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %data, metadata !78, metadata !35), !dbg !79
  store i64 0, i64* %data, align 8, !dbg !80
  store i64 9223372036854775807, i64* %data, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i64* %result, metadata !82, metadata !35), !dbg !83
  %0 = load i64, i64* %data, align 8, !dbg !84
  %1 = load i64, i64* %data, align 8, !dbg !85
  %mul = mul nsw i64 %0, %1, !dbg !86
  store i64 %mul, i64* %result, align 8, !dbg !83
  %2 = load i64, i64* %result, align 8, !dbg !87
  call void @printLongLine(i64 %2), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nounwind uwtable
define void @good15() #0 !dbg !90 {
entry:
  %data = alloca i64, align 8
  %result = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %data, metadata !91, metadata !35), !dbg !92
  store i64 0, i64* %data, align 8, !dbg !93
  store i64 9223372036854775807, i64* %data, align 8, !dbg !94
  %0 = load i64, i64* %data, align 8, !dbg !95
  %call = call i64 @labs(i64 %0) #2, !dbg !97
  %call1 = call double @sqrt(double 0x43E0000000000000) #5, !dbg !98
  %conv = fptosi double %call1 to i64, !dbg !100
  %cmp = icmp sle i64 %call, %conv, !dbg !101
  br i1 %cmp, label %if.then, label %if.else, !dbg !102

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %result, metadata !103, metadata !35), !dbg !105
  %1 = load i64, i64* %data, align 8, !dbg !106
  %2 = load i64, i64* %data, align 8, !dbg !107
  %mul = mul nsw i64 %1, %2, !dbg !108
  store i64 %mul, i64* %result, align 8, !dbg !105
  %3 = load i64, i64* %result, align 8, !dbg !109
  call void @printLongLine(i64 %3), !dbg !110
  br label %if.end, !dbg !111

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.3, i32 0, i32 0)), !dbg !112
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !114
}

; Function Attrs: nounwind readnone
declare i64 @labs(i64) #4

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !115 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good15(), !dbg !116
  call void @bad15(), !dbg !117
  ret i32 1, !dbg !118
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !8)
!1 = !DIFile(filename: "190_15.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5, !6, !7}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!8 = !{!9, !12, !13, !14, !15, !16}
!9 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!10 = !DIFile(filename: "./190_15.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!12 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !10, line: 11, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!13 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !10, line: 12, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!14 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !10, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!15 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !10, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!16 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !10, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!17 = !{i32 2, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!20 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !10, file: !10, line: 20, type: !21, isLocal: false, isDefinition: true, scopeLine: 21, isOptimized: false, unit: !0, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{!4}
!23 = !DILocation(line: 22, column: 5, scope: !20)
!24 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !10, file: !10, line: 25, type: !21, isLocal: false, isDefinition: true, scopeLine: 26, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 27, column: 5, scope: !24)
!26 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !10, file: !10, line: 30, type: !21, isLocal: false, isDefinition: true, scopeLine: 31, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocation(line: 32, column: 13, scope: !26)
!28 = !DILocation(line: 32, column: 20, scope: !26)
!29 = !DILocation(line: 32, column: 5, scope: !26)
!30 = distinct !DISubprogram(name: "printHexCharLine", scope: !10, file: !10, line: 36, type: !31, isLocal: false, isDefinition: true, scopeLine: 37, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !33}
!33 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!34 = !DILocalVariable(name: "charHex", arg: 1, scope: !30, file: !10, line: 36, type: !33)
!35 = !DIExpression()
!36 = !DILocation(line: 36, column: 29, scope: !30)
!37 = !DILocation(line: 38, column: 25, scope: !30)
!38 = !DILocation(line: 38, column: 20, scope: !30)
!39 = !DILocation(line: 38, column: 5, scope: !30)
!40 = !DILocation(line: 39, column: 1, scope: !30)
!41 = distinct !DISubprogram(name: "printLine", scope: !10, file: !10, line: 41, type: !42, isLocal: false, isDefinition: true, scopeLine: 42, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{null, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64, align: 64)
!45 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!46 = !DILocalVariable(name: "line", arg: 1, scope: !41, file: !10, line: 41, type: !44)
!47 = !DILocation(line: 41, column: 30, scope: !41)
!48 = !DILocation(line: 43, column: 8, scope: !49)
!49 = distinct !DILexicalBlock(scope: !41, file: !10, line: 43, column: 8)
!50 = !DILocation(line: 43, column: 13, scope: !49)
!51 = !DILocation(line: 43, column: 8, scope: !41)
!52 = !DILocation(line: 45, column: 24, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !10, line: 44, column: 5)
!54 = !DILocation(line: 45, column: 9, scope: !53)
!55 = !DILocation(line: 46, column: 5, scope: !53)
!56 = !DILocation(line: 47, column: 1, scope: !41)
!57 = distinct !DISubprogram(name: "printIntLine", scope: !10, file: !10, line: 49, type: !58, isLocal: false, isDefinition: true, scopeLine: 50, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{null, !4}
!60 = !DILocalVariable(name: "intNumber", arg: 1, scope: !57, file: !10, line: 49, type: !4)
!61 = !DILocation(line: 49, column: 24, scope: !57)
!62 = !DILocation(line: 51, column: 20, scope: !57)
!63 = !DILocation(line: 51, column: 5, scope: !57)
!64 = !DILocation(line: 52, column: 1, scope: !57)
!65 = distinct !DISubprogram(name: "printLongLine", scope: !10, file: !10, line: 54, type: !66, isLocal: false, isDefinition: true, scopeLine: 55, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{null, !68}
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !69, line: 197, baseType: !6)
!69 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!70 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !65, file: !10, line: 54, type: !68)
!71 = !DILocation(line: 54, column: 29, scope: !65)
!72 = !DILocation(line: 56, column: 21, scope: !65)
!73 = !DILocation(line: 56, column: 5, scope: !65)
!74 = !DILocation(line: 57, column: 1, scope: !65)
!75 = distinct !DISubprogram(name: "bad15", scope: !10, file: !10, line: 60, type: !76, isLocal: false, isDefinition: true, scopeLine: 61, isOptimized: false, unit: !0, variables: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{null}
!78 = !DILocalVariable(name: "data", scope: !75, file: !10, line: 62, type: !68)
!79 = !DILocation(line: 62, column: 13, scope: !75)
!80 = !DILocation(line: 63, column: 10, scope: !75)
!81 = !DILocation(line: 68, column: 14, scope: !75)
!82 = !DILocalVariable(name: "result", scope: !75, file: !10, line: 80, type: !68)
!83 = !DILocation(line: 80, column: 17, scope: !75)
!84 = !DILocation(line: 80, column: 26, scope: !75)
!85 = !DILocation(line: 80, column: 33, scope: !75)
!86 = !DILocation(line: 80, column: 31, scope: !75)
!87 = !DILocation(line: 81, column: 23, scope: !75)
!88 = !DILocation(line: 81, column: 9, scope: !75)
!89 = !DILocation(line: 89, column: 1, scope: !75)
!90 = distinct !DISubprogram(name: "good15", scope: !10, file: !10, line: 91, type: !76, isLocal: false, isDefinition: true, scopeLine: 92, isOptimized: false, unit: !0, variables: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !10, line: 93, type: !68)
!92 = !DILocation(line: 93, column: 13, scope: !90)
!93 = !DILocation(line: 94, column: 10, scope: !90)
!94 = !DILocation(line: 99, column: 14, scope: !90)
!95 = !DILocation(line: 114, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !10, line: 114, column: 13)
!97 = !DILocation(line: 114, column: 13, scope: !96)
!98 = !DILocation(line: 114, column: 39, scope: !99)
!99 = !DILexicalBlockFile(scope: !96, file: !10, discriminator: 1)
!100 = !DILocation(line: 114, column: 33, scope: !96)
!101 = !DILocation(line: 114, column: 30, scope: !96)
!102 = !DILocation(line: 114, column: 13, scope: !90)
!103 = !DILocalVariable(name: "result", scope: !104, file: !10, line: 116, type: !68)
!104 = distinct !DILexicalBlock(scope: !96, file: !10, line: 115, column: 9)
!105 = !DILocation(line: 116, column: 21, scope: !104)
!106 = !DILocation(line: 116, column: 30, scope: !104)
!107 = !DILocation(line: 116, column: 37, scope: !104)
!108 = !DILocation(line: 116, column: 35, scope: !104)
!109 = !DILocation(line: 117, column: 27, scope: !104)
!110 = !DILocation(line: 117, column: 13, scope: !104)
!111 = !DILocation(line: 118, column: 9, scope: !104)
!112 = !DILocation(line: 121, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !96, file: !10, line: 120, column: 9)
!114 = !DILocation(line: 125, column: 1, scope: !90)
!115 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 127, type: !21, isLocal: false, isDefinition: true, scopeLine: 127, isOptimized: false, unit: !0, variables: !2)
!116 = !DILocation(line: 128, column: 5, scope: !115)
!117 = !DILocation(line: 129, column: 5, scope: !115)
!118 = !DILocation(line: 130, column: 5, scope: !115)
