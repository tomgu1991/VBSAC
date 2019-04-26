; ModuleID = './457_32.c'
source_filename = "./457_32.c"
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
@.str.3 = private unnamed_addr constant [4 x i8] c"%g\0A\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrue() #0 !dbg !18 {
entry:
  ret i32 1, !dbg !21
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !22 {
entry:
  ret i32 0, !dbg !23
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !24 {
entry:
  %call = call i32 @rand() #4, !dbg !25
  %rem = srem i32 %call, 2, !dbg !26
  ret i32 %rem, !dbg !27
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !28 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !32, metadata !33), !dbg !34
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !35
  %conv = sext i8 %0 to i32, !dbg !36
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !39 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !44, metadata !33), !dbg !45
  %0 = load i8*, i8** %line.addr, align 8, !dbg !46
  %cmp = icmp ne i8* %0, null, !dbg !48
  br i1 %cmp, label %if.then, label %if.end, !dbg !49

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !50
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !52
  br label %if.end, !dbg !53

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !54
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !55 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !58, metadata !33), !dbg !59
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !60
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !63 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !69, metadata !33), !dbg !70
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !71
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nounwind uwtable
define void @printDoubleLine(double %doubleNumber) #0 !dbg !74 {
entry:
  %doubleNumber.addr = alloca double, align 8
  store double %doubleNumber, double* %doubleNumber.addr, align 8
  call void @llvm.dbg.declare(metadata double* %doubleNumber.addr, metadata !78, metadata !33), !dbg !79
  %0 = load double, double* %doubleNumber.addr, align 8, !dbg !80
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), double %0), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nounwind uwtable
define void @bad32() #0 !dbg !83 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !86, metadata !33), !dbg !87
  %0 = load i32, i32* @globalFive, align 4, !dbg !88
  %cmp = icmp eq i32 %0, 5, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !92

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !94
  %cmp1 = icmp eq i32 %1, 5, !dbg !96
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !97

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %data, align 4, !dbg !98
  call void @printIntLine(i32 %2), !dbg !100
  br label %if.end3, !dbg !101

if.end3:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !102
}

; Function Attrs: nounwind uwtable
define void @good32() #0 !dbg !103 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !104, metadata !33), !dbg !105
  %0 = load i32, i32* @globalFive, align 4, !dbg !106
  %cmp = icmp eq i32 %0, 5, !dbg !108
  br i1 %cmp, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !110

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !112
  %cmp1 = icmp ne i32 %1, 5, !dbg !114
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !115

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0)), !dbg !116
  br label %if.end3, !dbg !118

if.else:                                          ; preds = %if.end
  store i32 5, i32* %data, align 4, !dbg !119
  %2 = load i32, i32* %data, align 4, !dbg !121
  call void @printIntLine(i32 %2), !dbg !122
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then2
  ret void, !dbg !123
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !124 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good32(), !dbg !125
  call void @bad32(), !dbg !126
  ret i32 1, !dbg !127
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !6)
!1 = !DIFile(filename: "457_32.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/457")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7, !10, !11, !12, !13, !14}
!7 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!8 = !DIFile(filename: "./457_32.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/457")
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !8, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!13 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !8, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!14 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !8, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!15 = !{i32 2, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!18 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !8, file: !8, line: 18, type: !19, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!4}
!21 = !DILocation(line: 20, column: 5, scope: !18)
!22 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !8, file: !8, line: 23, type: !19, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!23 = !DILocation(line: 25, column: 5, scope: !22)
!24 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !8, file: !8, line: 28, type: !19, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 30, column: 13, scope: !24)
!26 = !DILocation(line: 30, column: 20, scope: !24)
!27 = !DILocation(line: 30, column: 5, scope: !24)
!28 = distinct !DISubprogram(name: "printHexCharLine", scope: !8, file: !8, line: 33, type: !29, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{null, !31}
!31 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!32 = !DILocalVariable(name: "charHex", arg: 1, scope: !28, file: !8, line: 33, type: !31)
!33 = !DIExpression()
!34 = !DILocation(line: 33, column: 29, scope: !28)
!35 = !DILocation(line: 35, column: 25, scope: !28)
!36 = !DILocation(line: 35, column: 20, scope: !28)
!37 = !DILocation(line: 35, column: 5, scope: !28)
!38 = !DILocation(line: 36, column: 1, scope: !28)
!39 = distinct !DISubprogram(name: "printLine", scope: !8, file: !8, line: 38, type: !40, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64, align: 64)
!43 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !31)
!44 = !DILocalVariable(name: "line", arg: 1, scope: !39, file: !8, line: 38, type: !42)
!45 = !DILocation(line: 38, column: 30, scope: !39)
!46 = !DILocation(line: 40, column: 8, scope: !47)
!47 = distinct !DILexicalBlock(scope: !39, file: !8, line: 40, column: 8)
!48 = !DILocation(line: 40, column: 13, scope: !47)
!49 = !DILocation(line: 40, column: 8, scope: !39)
!50 = !DILocation(line: 42, column: 24, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !8, line: 41, column: 5)
!52 = !DILocation(line: 42, column: 9, scope: !51)
!53 = !DILocation(line: 43, column: 5, scope: !51)
!54 = !DILocation(line: 44, column: 1, scope: !39)
!55 = distinct !DISubprogram(name: "printIntLine", scope: !8, file: !8, line: 46, type: !56, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{null, !4}
!58 = !DILocalVariable(name: "intNumber", arg: 1, scope: !55, file: !8, line: 46, type: !4)
!59 = !DILocation(line: 46, column: 24, scope: !55)
!60 = !DILocation(line: 48, column: 20, scope: !55)
!61 = !DILocation(line: 48, column: 5, scope: !55)
!62 = !DILocation(line: 49, column: 1, scope: !55)
!63 = distinct !DISubprogram(name: "printLongLine", scope: !8, file: !8, line: 51, type: !64, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{null, !66}
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !67, line: 197, baseType: !68)
!67 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/457")
!68 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!69 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !63, file: !8, line: 51, type: !66)
!70 = !DILocation(line: 51, column: 29, scope: !63)
!71 = !DILocation(line: 53, column: 21, scope: !63)
!72 = !DILocation(line: 53, column: 5, scope: !63)
!73 = !DILocation(line: 54, column: 1, scope: !63)
!74 = distinct !DISubprogram(name: "printDoubleLine", scope: !8, file: !8, line: 56, type: !75, isLocal: false, isDefinition: true, scopeLine: 57, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{null, !77}
!77 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!78 = !DILocalVariable(name: "doubleNumber", arg: 1, scope: !74, file: !8, line: 56, type: !77)
!79 = !DILocation(line: 56, column: 29, scope: !74)
!80 = !DILocation(line: 58, column: 20, scope: !74)
!81 = !DILocation(line: 58, column: 5, scope: !74)
!82 = !DILocation(line: 59, column: 1, scope: !74)
!83 = distinct !DISubprogram(name: "bad32", scope: !8, file: !8, line: 63, type: !84, isLocal: false, isDefinition: true, scopeLine: 64, isOptimized: false, unit: !0, variables: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{null}
!86 = !DILocalVariable(name: "data", scope: !83, file: !8, line: 65, type: !4)
!87 = !DILocation(line: 65, column: 9, scope: !83)
!88 = !DILocation(line: 66, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !8, line: 66, column: 8)
!90 = !DILocation(line: 66, column: 18, scope: !89)
!91 = !DILocation(line: 66, column: 8, scope: !83)
!92 = !DILocation(line: 70, column: 5, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !8, line: 67, column: 5)
!94 = !DILocation(line: 71, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !83, file: !8, line: 71, column: 8)
!96 = !DILocation(line: 71, column: 18, scope: !95)
!97 = !DILocation(line: 71, column: 8, scope: !83)
!98 = !DILocation(line: 74, column: 22, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !8, line: 72, column: 5)
!100 = !DILocation(line: 74, column: 9, scope: !99)
!101 = !DILocation(line: 75, column: 5, scope: !99)
!102 = !DILocation(line: 76, column: 1, scope: !83)
!103 = distinct !DISubprogram(name: "good32", scope: !8, file: !8, line: 82, type: !84, isLocal: false, isDefinition: true, scopeLine: 83, isOptimized: false, unit: !0, variables: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !8, line: 84, type: !4)
!105 = !DILocation(line: 84, column: 9, scope: !103)
!106 = !DILocation(line: 85, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !8, line: 85, column: 8)
!108 = !DILocation(line: 85, column: 18, scope: !107)
!109 = !DILocation(line: 85, column: 8, scope: !103)
!110 = !DILocation(line: 89, column: 5, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !8, line: 86, column: 5)
!112 = !DILocation(line: 90, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !103, file: !8, line: 90, column: 8)
!114 = !DILocation(line: 90, column: 18, scope: !113)
!115 = !DILocation(line: 90, column: 8, scope: !103)
!116 = !DILocation(line: 93, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !8, line: 91, column: 5)
!118 = !DILocation(line: 94, column: 5, scope: !117)
!119 = !DILocation(line: 98, column: 14, scope: !120)
!120 = distinct !DILexicalBlock(scope: !113, file: !8, line: 96, column: 5)
!121 = !DILocation(line: 99, column: 22, scope: !120)
!122 = !DILocation(line: 99, column: 9, scope: !120)
!123 = !DILocation(line: 101, column: 1, scope: !103)
!124 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 105, type: !19, isLocal: false, isDefinition: true, scopeLine: 105, isOptimized: false, unit: !0, variables: !2)
!125 = !DILocation(line: 106, column: 5, scope: !124)
!126 = !DILocation(line: 107, column: 2, scope: !124)
!127 = !DILocation(line: 108, column: 5, scope: !124)
