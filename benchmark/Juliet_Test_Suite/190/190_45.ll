; ModuleID = './190_45.c'
source_filename = "./190_45.c"
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
define void @bad45() #0 !dbg !74 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !77, metadata !33), !dbg !78
  call void @llvm.dbg.declare(metadata i32* %j, metadata !79, metadata !33), !dbg !80
  call void @llvm.dbg.declare(metadata i32* %data, metadata !81, metadata !33), !dbg !82
  store i32 0, i32* %data, align 4, !dbg !83
  store i32 0, i32* %i, align 4, !dbg !84
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !87
  %cmp = icmp slt i32 %0, 1, !dbg !90
  br i1 %cmp, label %for.body, label %for.end, !dbg !91

for.body:                                         ; preds = %for.cond
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !92
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i32* %data), !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !96
  %inc = add nsw i32 %2, 1, !dbg !96
  store i32 %inc, i32* %i, align 4, !dbg !96
  br label %for.cond, !dbg !98, !llvm.loop !99

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !101
  br label %for.cond1, !dbg !103

for.cond1:                                        ; preds = %for.inc4, %for.end
  %3 = load i32, i32* %j, align 4, !dbg !104
  %cmp2 = icmp slt i32 %3, 1, !dbg !107
  br i1 %cmp2, label %for.body3, label %for.end6, !dbg !108

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %result, metadata !109, metadata !33), !dbg !112
  %4 = load i32, i32* %data, align 4, !dbg !113
  %add = add nsw i32 %4, 1, !dbg !114
  store i32 %add, i32* %result, align 4, !dbg !112
  %5 = load i32, i32* %result, align 4, !dbg !115
  call void @printIntLine(i32 %5), !dbg !116
  br label %for.inc4, !dbg !117

for.inc4:                                         ; preds = %for.body3
  %6 = load i32, i32* %j, align 4, !dbg !118
  %inc5 = add nsw i32 %6, 1, !dbg !118
  store i32 %inc5, i32* %j, align 4, !dbg !118
  br label %for.cond1, !dbg !120, !llvm.loop !121

for.end6:                                         ; preds = %for.cond1
  ret void, !dbg !123
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @good45() #0 !dbg !124 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !125, metadata !33), !dbg !126
  call void @llvm.dbg.declare(metadata i32* %k, metadata !127, metadata !33), !dbg !128
  call void @llvm.dbg.declare(metadata i32* %data, metadata !129, metadata !33), !dbg !130
  store i32 0, i32* %data, align 4, !dbg !131
  store i32 0, i32* %i, align 4, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !135
  %cmp = icmp slt i32 %0, 1, !dbg !138
  br i1 %cmp, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !140
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i32* %data), !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !144
  %inc = add nsw i32 %2, 1, !dbg !144
  store i32 %inc, i32* %i, align 4, !dbg !144
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !149
  br label %for.cond1, !dbg !151

for.cond1:                                        ; preds = %for.inc5, %for.end
  %3 = load i32, i32* %k, align 4, !dbg !152
  %cmp2 = icmp slt i32 %3, 1, !dbg !155
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !156

for.body3:                                        ; preds = %for.cond1
  %4 = load i32, i32* %data, align 4, !dbg !157
  %cmp4 = icmp slt i32 %4, 2147483647, !dbg !160
  br i1 %cmp4, label %if.then, label %if.else, !dbg !161

if.then:                                          ; preds = %for.body3
  call void @llvm.dbg.declare(metadata i32* %result, metadata !162, metadata !33), !dbg !164
  %5 = load i32, i32* %data, align 4, !dbg !165
  %add = add nsw i32 %5, 1, !dbg !166
  store i32 %add, i32* %result, align 4, !dbg !164
  %6 = load i32, i32* %result, align 4, !dbg !167
  call void @printIntLine(i32 %6), !dbg !168
  br label %if.end, !dbg !169

if.else:                                          ; preds = %for.body3
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i32 0, i32 0)), !dbg !170
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc5, !dbg !172

for.inc5:                                         ; preds = %if.end
  %7 = load i32, i32* %k, align 4, !dbg !173
  %inc6 = add nsw i32 %7, 1, !dbg !173
  store i32 %inc6, i32* %k, align 4, !dbg !173
  br label %for.cond1, !dbg !175, !llvm.loop !176

for.end7:                                         ; preds = %for.cond1
  ret void, !dbg !178
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !179 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good45(), !dbg !180
  call void @bad45(), !dbg !181
  ret i32 1, !dbg !182
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
!1 = !DIFile(filename: "190_45.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7, !10, !11, !12, !13, !14}
!7 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!8 = !DIFile(filename: "./190_45.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
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
!67 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!68 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!69 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !63, file: !8, line: 51, type: !66)
!70 = !DILocation(line: 51, column: 29, scope: !63)
!71 = !DILocation(line: 53, column: 21, scope: !63)
!72 = !DILocation(line: 53, column: 5, scope: !63)
!73 = !DILocation(line: 54, column: 1, scope: !63)
!74 = distinct !DISubprogram(name: "bad45", scope: !8, file: !8, line: 58, type: !75, isLocal: false, isDefinition: true, scopeLine: 59, isOptimized: false, unit: !0, variables: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !DILocalVariable(name: "i", scope: !74, file: !8, line: 60, type: !4)
!78 = !DILocation(line: 60, column: 9, scope: !74)
!79 = !DILocalVariable(name: "j", scope: !74, file: !8, line: 60, type: !4)
!80 = !DILocation(line: 60, column: 11, scope: !74)
!81 = !DILocalVariable(name: "data", scope: !74, file: !8, line: 61, type: !4)
!82 = !DILocation(line: 61, column: 9, scope: !74)
!83 = !DILocation(line: 63, column: 10, scope: !74)
!84 = !DILocation(line: 64, column: 11, scope: !85)
!85 = distinct !DILexicalBlock(scope: !74, file: !8, line: 64, column: 5)
!86 = !DILocation(line: 64, column: 9, scope: !85)
!87 = !DILocation(line: 64, column: 16, scope: !88)
!88 = !DILexicalBlockFile(scope: !89, file: !8, discriminator: 1)
!89 = distinct !DILexicalBlock(scope: !85, file: !8, line: 64, column: 5)
!90 = !DILocation(line: 64, column: 18, scope: !88)
!91 = !DILocation(line: 64, column: 5, scope: !88)
!92 = !DILocation(line: 67, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !8, line: 65, column: 5)
!94 = !DILocation(line: 67, column: 9, scope: !93)
!95 = !DILocation(line: 68, column: 5, scope: !93)
!96 = !DILocation(line: 64, column: 24, scope: !97)
!97 = !DILexicalBlockFile(scope: !89, file: !8, discriminator: 2)
!98 = !DILocation(line: 64, column: 5, scope: !97)
!99 = distinct !{!99, !100}
!100 = !DILocation(line: 64, column: 5, scope: !74)
!101 = !DILocation(line: 69, column: 11, scope: !102)
!102 = distinct !DILexicalBlock(scope: !74, file: !8, line: 69, column: 5)
!103 = !DILocation(line: 69, column: 9, scope: !102)
!104 = !DILocation(line: 69, column: 16, scope: !105)
!105 = !DILexicalBlockFile(scope: !106, file: !8, discriminator: 1)
!106 = distinct !DILexicalBlock(scope: !102, file: !8, line: 69, column: 5)
!107 = !DILocation(line: 69, column: 18, scope: !105)
!108 = !DILocation(line: 69, column: 5, scope: !105)
!109 = !DILocalVariable(name: "result", scope: !110, file: !8, line: 73, type: !4)
!110 = distinct !DILexicalBlock(scope: !111, file: !8, line: 71, column: 9)
!111 = distinct !DILexicalBlock(scope: !106, file: !8, line: 70, column: 5)
!112 = !DILocation(line: 73, column: 17, scope: !110)
!113 = !DILocation(line: 73, column: 26, scope: !110)
!114 = !DILocation(line: 73, column: 31, scope: !110)
!115 = !DILocation(line: 74, column: 26, scope: !110)
!116 = !DILocation(line: 74, column: 13, scope: !110)
!117 = !DILocation(line: 76, column: 5, scope: !111)
!118 = !DILocation(line: 69, column: 24, scope: !119)
!119 = !DILexicalBlockFile(scope: !106, file: !8, discriminator: 2)
!120 = !DILocation(line: 69, column: 5, scope: !119)
!121 = distinct !{!121, !122}
!122 = !DILocation(line: 69, column: 5, scope: !74)
!123 = !DILocation(line: 77, column: 1, scope: !74)
!124 = distinct !DISubprogram(name: "good45", scope: !8, file: !8, line: 83, type: !75, isLocal: false, isDefinition: true, scopeLine: 84, isOptimized: false, unit: !0, variables: !2)
!125 = !DILocalVariable(name: "i", scope: !124, file: !8, line: 85, type: !4)
!126 = !DILocation(line: 85, column: 9, scope: !124)
!127 = !DILocalVariable(name: "k", scope: !124, file: !8, line: 85, type: !4)
!128 = !DILocation(line: 85, column: 11, scope: !124)
!129 = !DILocalVariable(name: "data", scope: !124, file: !8, line: 86, type: !4)
!130 = !DILocation(line: 86, column: 9, scope: !124)
!131 = !DILocation(line: 88, column: 10, scope: !124)
!132 = !DILocation(line: 89, column: 11, scope: !133)
!133 = distinct !DILexicalBlock(scope: !124, file: !8, line: 89, column: 5)
!134 = !DILocation(line: 89, column: 9, scope: !133)
!135 = !DILocation(line: 89, column: 16, scope: !136)
!136 = !DILexicalBlockFile(scope: !137, file: !8, discriminator: 1)
!137 = distinct !DILexicalBlock(scope: !133, file: !8, line: 89, column: 5)
!138 = !DILocation(line: 89, column: 18, scope: !136)
!139 = !DILocation(line: 89, column: 5, scope: !136)
!140 = !DILocation(line: 92, column: 16, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !8, line: 90, column: 5)
!142 = !DILocation(line: 92, column: 9, scope: !141)
!143 = !DILocation(line: 93, column: 5, scope: !141)
!144 = !DILocation(line: 89, column: 24, scope: !145)
!145 = !DILexicalBlockFile(scope: !137, file: !8, discriminator: 2)
!146 = !DILocation(line: 89, column: 5, scope: !145)
!147 = distinct !{!147, !148}
!148 = !DILocation(line: 89, column: 5, scope: !124)
!149 = !DILocation(line: 94, column: 11, scope: !150)
!150 = distinct !DILexicalBlock(scope: !124, file: !8, line: 94, column: 5)
!151 = !DILocation(line: 94, column: 9, scope: !150)
!152 = !DILocation(line: 94, column: 16, scope: !153)
!153 = !DILexicalBlockFile(scope: !154, file: !8, discriminator: 1)
!154 = distinct !DILexicalBlock(scope: !150, file: !8, line: 94, column: 5)
!155 = !DILocation(line: 94, column: 18, scope: !153)
!156 = !DILocation(line: 94, column: 5, scope: !153)
!157 = !DILocation(line: 97, column: 13, scope: !158)
!158 = distinct !DILexicalBlock(scope: !159, file: !8, line: 97, column: 13)
!159 = distinct !DILexicalBlock(scope: !154, file: !8, line: 95, column: 5)
!160 = !DILocation(line: 97, column: 18, scope: !158)
!161 = !DILocation(line: 97, column: 13, scope: !159)
!162 = !DILocalVariable(name: "result", scope: !163, file: !8, line: 99, type: !4)
!163 = distinct !DILexicalBlock(scope: !158, file: !8, line: 98, column: 9)
!164 = !DILocation(line: 99, column: 17, scope: !163)
!165 = !DILocation(line: 99, column: 26, scope: !163)
!166 = !DILocation(line: 99, column: 31, scope: !163)
!167 = !DILocation(line: 100, column: 26, scope: !163)
!168 = !DILocation(line: 100, column: 13, scope: !163)
!169 = !DILocation(line: 101, column: 9, scope: !163)
!170 = !DILocation(line: 104, column: 13, scope: !171)
!171 = distinct !DILexicalBlock(scope: !158, file: !8, line: 103, column: 9)
!172 = !DILocation(line: 106, column: 5, scope: !159)
!173 = !DILocation(line: 94, column: 24, scope: !174)
!174 = !DILexicalBlockFile(scope: !154, file: !8, discriminator: 2)
!175 = !DILocation(line: 94, column: 5, scope: !174)
!176 = distinct !{!176, !177}
!177 = !DILocation(line: 94, column: 5, scope: !124)
!178 = !DILocation(line: 107, column: 1, scope: !124)
!179 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 116, type: !19, isLocal: false, isDefinition: true, scopeLine: 116, isOptimized: false, unit: !0, variables: !2)
!180 = !DILocation(line: 117, column: 5, scope: !179)
!181 = !DILocation(line: 118, column: 5, scope: !179)
!182 = !DILocation(line: 119, column: 5, scope: !179)
