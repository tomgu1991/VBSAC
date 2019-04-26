; ModuleID = './190_16.c'
source_filename = "./190_16.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@GLOBAL_CONST_TRUE = constant i32 1, align 4
@GLOBAL_CONST_FALSE = constant i32 0, align 4
@GLOBAL_CONST_FIVE = constant i32 5, align 4
@globalTrue = global i32 1, align 4
@globalFalse = global i32 0, align 4
@globalFive = global i32 5, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.4 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

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
define void @bad16() #0 !dbg !74 {
entry:
  %data = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !77, metadata !33), !dbg !78
  store i32 0, i32* %data, align 4, !dbg !79
  br label %while.body, !dbg !80

while.body:                                       ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !81
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i32* %data), !dbg !83
  br label %while.end, !dbg !84

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !85

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %result, metadata !86, metadata !33), !dbg !89
  %1 = load i32, i32* %data, align 4, !dbg !90
  %add = add nsw i32 %1, 1, !dbg !91
  store i32 %add, i32* %result, align 4, !dbg !89
  %2 = load i32, i32* %result, align 4, !dbg !92
  call void @printIntLine(i32 %2), !dbg !93
  br label %while.end2, !dbg !94

while.end2:                                       ; preds = %while.body1
  ret void, !dbg !95
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @good16() #0 !dbg !96 {
entry:
  %data = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !97, metadata !33), !dbg !98
  store i32 0, i32* %data, align 4, !dbg !99
  br label %while.body, !dbg !100

while.body:                                       ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !101
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i32* %data), !dbg !103
  br label %while.end, !dbg !104

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !105

while.body1:                                      ; preds = %while.end
  %1 = load i32, i32* %data, align 4, !dbg !106
  %cmp = icmp slt i32 %1, 2147483647, !dbg !109
  br i1 %cmp, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %while.body1
  call void @llvm.dbg.declare(metadata i32* %result, metadata !111, metadata !33), !dbg !113
  %2 = load i32, i32* %data, align 4, !dbg !114
  %add = add nsw i32 %2, 1, !dbg !115
  store i32 %add, i32* %result, align 4, !dbg !113
  %3 = load i32, i32* %result, align 4, !dbg !116
  call void @printIntLine(i32 %3), !dbg !117
  br label %if.end, !dbg !118

if.else:                                          ; preds = %while.body1
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i32 0, i32 0)), !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.end2, !dbg !121

while.end2:                                       ; preds = %if.end
  ret void, !dbg !122
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !123 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good16(), !dbg !124
  call void @bad16(), !dbg !125
  ret i32 1, !dbg !126
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
!1 = !DIFile(filename: "190_16.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7, !10, !11, !12, !13, !14}
!7 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!8 = !DIFile(filename: "./190_16.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !8, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!13 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !8, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!14 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !8, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!15 = !{i32 2, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!18 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !8, file: !8, line: 20, type: !19, isLocal: false, isDefinition: true, scopeLine: 21, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!4}
!21 = !DILocation(line: 22, column: 5, scope: !18)
!22 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !8, file: !8, line: 25, type: !19, isLocal: false, isDefinition: true, scopeLine: 26, isOptimized: false, unit: !0, variables: !2)
!23 = !DILocation(line: 27, column: 5, scope: !22)
!24 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !8, file: !8, line: 30, type: !19, isLocal: false, isDefinition: true, scopeLine: 31, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 32, column: 13, scope: !24)
!26 = !DILocation(line: 32, column: 20, scope: !24)
!27 = !DILocation(line: 32, column: 5, scope: !24)
!28 = distinct !DISubprogram(name: "printHexCharLine", scope: !8, file: !8, line: 36, type: !29, isLocal: false, isDefinition: true, scopeLine: 37, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{null, !31}
!31 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!32 = !DILocalVariable(name: "charHex", arg: 1, scope: !28, file: !8, line: 36, type: !31)
!33 = !DIExpression()
!34 = !DILocation(line: 36, column: 29, scope: !28)
!35 = !DILocation(line: 38, column: 25, scope: !28)
!36 = !DILocation(line: 38, column: 20, scope: !28)
!37 = !DILocation(line: 38, column: 5, scope: !28)
!38 = !DILocation(line: 39, column: 1, scope: !28)
!39 = distinct !DISubprogram(name: "printLine", scope: !8, file: !8, line: 41, type: !40, isLocal: false, isDefinition: true, scopeLine: 42, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64, align: 64)
!43 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !31)
!44 = !DILocalVariable(name: "line", arg: 1, scope: !39, file: !8, line: 41, type: !42)
!45 = !DILocation(line: 41, column: 30, scope: !39)
!46 = !DILocation(line: 43, column: 8, scope: !47)
!47 = distinct !DILexicalBlock(scope: !39, file: !8, line: 43, column: 8)
!48 = !DILocation(line: 43, column: 13, scope: !47)
!49 = !DILocation(line: 43, column: 8, scope: !39)
!50 = !DILocation(line: 45, column: 24, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !8, line: 44, column: 5)
!52 = !DILocation(line: 45, column: 9, scope: !51)
!53 = !DILocation(line: 46, column: 5, scope: !51)
!54 = !DILocation(line: 47, column: 1, scope: !39)
!55 = distinct !DISubprogram(name: "printIntLine", scope: !8, file: !8, line: 49, type: !56, isLocal: false, isDefinition: true, scopeLine: 50, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{null, !4}
!58 = !DILocalVariable(name: "intNumber", arg: 1, scope: !55, file: !8, line: 49, type: !4)
!59 = !DILocation(line: 49, column: 24, scope: !55)
!60 = !DILocation(line: 51, column: 20, scope: !55)
!61 = !DILocation(line: 51, column: 5, scope: !55)
!62 = !DILocation(line: 52, column: 1, scope: !55)
!63 = distinct !DISubprogram(name: "printLongLine", scope: !8, file: !8, line: 54, type: !64, isLocal: false, isDefinition: true, scopeLine: 55, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{null, !66}
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !67, line: 197, baseType: !68)
!67 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!68 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!69 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !63, file: !8, line: 54, type: !66)
!70 = !DILocation(line: 54, column: 29, scope: !63)
!71 = !DILocation(line: 56, column: 21, scope: !63)
!72 = !DILocation(line: 56, column: 5, scope: !63)
!73 = !DILocation(line: 57, column: 1, scope: !63)
!74 = distinct !DISubprogram(name: "bad16", scope: !8, file: !8, line: 60, type: !75, isLocal: false, isDefinition: true, scopeLine: 61, isOptimized: false, unit: !0, variables: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !DILocalVariable(name: "data", scope: !74, file: !8, line: 62, type: !4)
!78 = !DILocation(line: 62, column: 9, scope: !74)
!79 = !DILocation(line: 64, column: 10, scope: !74)
!80 = !DILocation(line: 65, column: 5, scope: !74)
!81 = !DILocation(line: 68, column: 16, scope: !82)
!82 = distinct !DILexicalBlock(scope: !74, file: !8, line: 66, column: 5)
!83 = !DILocation(line: 68, column: 9, scope: !82)
!84 = !DILocation(line: 69, column: 9, scope: !82)
!85 = !DILocation(line: 71, column: 5, scope: !74)
!86 = !DILocalVariable(name: "result", scope: !87, file: !8, line: 75, type: !4)
!87 = distinct !DILexicalBlock(scope: !88, file: !8, line: 73, column: 9)
!88 = distinct !DILexicalBlock(scope: !74, file: !8, line: 72, column: 5)
!89 = !DILocation(line: 75, column: 17, scope: !87)
!90 = !DILocation(line: 75, column: 26, scope: !87)
!91 = !DILocation(line: 75, column: 31, scope: !87)
!92 = !DILocation(line: 76, column: 26, scope: !87)
!93 = !DILocation(line: 76, column: 13, scope: !87)
!94 = !DILocation(line: 78, column: 9, scope: !88)
!95 = !DILocation(line: 80, column: 1, scope: !74)
!96 = distinct !DISubprogram(name: "good16", scope: !8, file: !8, line: 82, type: !75, isLocal: false, isDefinition: true, scopeLine: 83, isOptimized: false, unit: !0, variables: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !8, line: 84, type: !4)
!98 = !DILocation(line: 84, column: 9, scope: !96)
!99 = !DILocation(line: 86, column: 10, scope: !96)
!100 = !DILocation(line: 87, column: 5, scope: !96)
!101 = !DILocation(line: 90, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !96, file: !8, line: 88, column: 5)
!103 = !DILocation(line: 90, column: 9, scope: !102)
!104 = !DILocation(line: 91, column: 9, scope: !102)
!105 = !DILocation(line: 93, column: 5, scope: !96)
!106 = !DILocation(line: 96, column: 13, scope: !107)
!107 = distinct !DILexicalBlock(scope: !108, file: !8, line: 96, column: 13)
!108 = distinct !DILexicalBlock(scope: !96, file: !8, line: 94, column: 5)
!109 = !DILocation(line: 96, column: 18, scope: !107)
!110 = !DILocation(line: 96, column: 13, scope: !108)
!111 = !DILocalVariable(name: "result", scope: !112, file: !8, line: 98, type: !4)
!112 = distinct !DILexicalBlock(scope: !107, file: !8, line: 97, column: 9)
!113 = !DILocation(line: 98, column: 17, scope: !112)
!114 = !DILocation(line: 98, column: 26, scope: !112)
!115 = !DILocation(line: 98, column: 31, scope: !112)
!116 = !DILocation(line: 99, column: 26, scope: !112)
!117 = !DILocation(line: 99, column: 13, scope: !112)
!118 = !DILocation(line: 100, column: 9, scope: !112)
!119 = !DILocation(line: 103, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !107, file: !8, line: 102, column: 9)
!121 = !DILocation(line: 105, column: 9, scope: !108)
!122 = !DILocation(line: 107, column: 1, scope: !96)
!123 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 109, type: !19, isLocal: false, isDefinition: true, scopeLine: 109, isOptimized: false, unit: !0, variables: !2)
!124 = !DILocation(line: 110, column: 5, scope: !123)
!125 = !DILocation(line: 111, column: 5, scope: !123)
!126 = !DILocation(line: 112, column: 5, scope: !123)
