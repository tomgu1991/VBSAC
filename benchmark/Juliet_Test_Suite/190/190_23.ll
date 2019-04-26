; ModuleID = './190_23.c'
source_filename = "./190_23.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.3 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !9 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !14, metadata !15), !dbg !16
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !17
  %conv = sext i8 %0 to i32, !dbg !18
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !19
  ret void, !dbg !20
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !21 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !26, metadata !15), !dbg !27
  %0 = load i8*, i8** %line.addr, align 8, !dbg !28
  %cmp = icmp ne i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !32
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !36
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !37 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !40, metadata !15), !dbg !41
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !42
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !45 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !51, metadata !15), !dbg !52
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !53
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nounwind uwtable
define void @bad23() #0 !dbg !56 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !59, metadata !15), !dbg !60
  store i32 0, i32* %data, align 4, !dbg !61
  %call = call i32 @rand() #4, !dbg !62
  store i32 %call, i32* %data, align 4, !dbg !63
  %0 = load i32, i32* %data, align 4, !dbg !64
  call void @badSink(i32 %0), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nounwind
declare i32 @rand() #3

; Function Attrs: nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !67 {
entry:
  %data.addr = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !68, metadata !15), !dbg !69
  %0 = load i32, i32* %data.addr, align 4, !dbg !70
  %cmp = icmp sgt i32 %0, 0, !dbg !72
  br i1 %cmp, label %if.then, label %if.end, !dbg !73

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %result, metadata !74, metadata !15), !dbg !76
  %1 = load i32, i32* %data.addr, align 4, !dbg !77
  %mul = mul nsw i32 %1, 2, !dbg !78
  store i32 %mul, i32* %result, align 4, !dbg !76
  %2 = load i32, i32* %result, align 4, !dbg !79
  call void @printIntLine(i32 %2), !dbg !80
  br label %if.end, !dbg !81

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !82
}

; Function Attrs: nounwind uwtable
define void @good23() #0 !dbg !83 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !84, metadata !15), !dbg !85
  store i32 0, i32* %data, align 4, !dbg !86
  %call = call i32 @rand() #4, !dbg !87
  store i32 %call, i32* %data, align 4, !dbg !88
  %0 = load i32, i32* %data, align 4, !dbg !89
  call void @goodSink(i32 %0), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: nounwind uwtable
define internal void @goodSink(i32 %data) #0 !dbg !92 {
entry:
  %data.addr = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !93, metadata !15), !dbg !94
  %0 = load i32, i32* %data.addr, align 4, !dbg !95
  %cmp = icmp sgt i32 %0, 0, !dbg !97
  br i1 %cmp, label %if.then, label %if.end3, !dbg !98

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %data.addr, align 4, !dbg !99
  %cmp1 = icmp slt i32 %1, 1073741823, !dbg !102
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !103

if.then2:                                         ; preds = %if.then
  call void @llvm.dbg.declare(metadata i32* %result, metadata !104, metadata !15), !dbg !106
  %2 = load i32, i32* %data.addr, align 4, !dbg !107
  %mul = mul nsw i32 %2, 2, !dbg !108
  store i32 %mul, i32* %result, align 4, !dbg !106
  %3 = load i32, i32* %result, align 4, !dbg !109
  call void @printIntLine(i32 %3), !dbg !110
  br label %if.end, !dbg !111

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.3, i32 0, i32 0)), !dbg !112
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end3, !dbg !114

if.end3:                                          ; preds = %if.end, %entry
  ret void, !dbg !115
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !116 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good23(), !dbg !119
  call void @bad23(), !dbg !120
  ret i32 1, !dbg !121
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "190_23.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{i32 2, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!9 = distinct !DISubprogram(name: "printHexCharLine", scope: !10, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!10 = !DIFile(filename: "./190_23.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "charHex", arg: 1, scope: !9, file: !10, line: 10, type: !13)
!15 = !DIExpression()
!16 = !DILocation(line: 10, column: 29, scope: !9)
!17 = !DILocation(line: 12, column: 25, scope: !9)
!18 = !DILocation(line: 12, column: 20, scope: !9)
!19 = !DILocation(line: 12, column: 5, scope: !9)
!20 = !DILocation(line: 13, column: 1, scope: !9)
!21 = distinct !DISubprogram(name: "printLine", scope: !10, file: !10, line: 15, type: !22, isLocal: false, isDefinition: true, scopeLine: 16, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !24}
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64, align: 64)
!25 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!26 = !DILocalVariable(name: "line", arg: 1, scope: !21, file: !10, line: 15, type: !24)
!27 = !DILocation(line: 15, column: 30, scope: !21)
!28 = !DILocation(line: 17, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !21, file: !10, line: 17, column: 8)
!30 = !DILocation(line: 17, column: 13, scope: !29)
!31 = !DILocation(line: 17, column: 8, scope: !21)
!32 = !DILocation(line: 19, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !10, line: 18, column: 5)
!34 = !DILocation(line: 19, column: 9, scope: !33)
!35 = !DILocation(line: 20, column: 5, scope: !33)
!36 = !DILocation(line: 21, column: 1, scope: !21)
!37 = distinct !DISubprogram(name: "printIntLine", scope: !10, file: !10, line: 23, type: !38, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{null, !4}
!40 = !DILocalVariable(name: "intNumber", arg: 1, scope: !37, file: !10, line: 23, type: !4)
!41 = !DILocation(line: 23, column: 24, scope: !37)
!42 = !DILocation(line: 25, column: 20, scope: !37)
!43 = !DILocation(line: 25, column: 5, scope: !37)
!44 = !DILocation(line: 26, column: 1, scope: !37)
!45 = distinct !DISubprogram(name: "printLongLine", scope: !10, file: !10, line: 28, type: !46, isLocal: false, isDefinition: true, scopeLine: 29, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{null, !48}
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !49, line: 197, baseType: !50)
!49 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!50 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!51 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !45, file: !10, line: 28, type: !48)
!52 = !DILocation(line: 28, column: 29, scope: !45)
!53 = !DILocation(line: 30, column: 21, scope: !45)
!54 = !DILocation(line: 30, column: 5, scope: !45)
!55 = !DILocation(line: 31, column: 1, scope: !45)
!56 = distinct !DISubprogram(name: "bad23", scope: !10, file: !10, line: 61, type: !57, isLocal: false, isDefinition: true, scopeLine: 62, isOptimized: false, unit: !0, variables: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{null}
!59 = !DILocalVariable(name: "data", scope: !56, file: !10, line: 63, type: !4)
!60 = !DILocation(line: 63, column: 9, scope: !56)
!61 = !DILocation(line: 65, column: 10, scope: !56)
!62 = !DILocation(line: 67, column: 12, scope: !56)
!63 = !DILocation(line: 67, column: 10, scope: !56)
!64 = !DILocation(line: 68, column: 13, scope: !56)
!65 = !DILocation(line: 68, column: 5, scope: !56)
!66 = !DILocation(line: 69, column: 1, scope: !56)
!67 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 34, type: !38, isLocal: true, isDefinition: true, scopeLine: 35, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!68 = !DILocalVariable(name: "data", arg: 1, scope: !67, file: !10, line: 34, type: !4)
!69 = !DILocation(line: 34, column: 25, scope: !67)
!70 = !DILocation(line: 36, column: 8, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !10, line: 36, column: 8)
!72 = !DILocation(line: 36, column: 13, scope: !71)
!73 = !DILocation(line: 36, column: 8, scope: !67)
!74 = !DILocalVariable(name: "result", scope: !75, file: !10, line: 39, type: !4)
!75 = distinct !DILexicalBlock(scope: !71, file: !10, line: 37, column: 5)
!76 = !DILocation(line: 39, column: 13, scope: !75)
!77 = !DILocation(line: 39, column: 22, scope: !75)
!78 = !DILocation(line: 39, column: 27, scope: !75)
!79 = !DILocation(line: 40, column: 22, scope: !75)
!80 = !DILocation(line: 40, column: 9, scope: !75)
!81 = !DILocation(line: 41, column: 5, scope: !75)
!82 = !DILocation(line: 42, column: 1, scope: !67)
!83 = distinct !DISubprogram(name: "good23", scope: !10, file: !10, line: 71, type: !57, isLocal: false, isDefinition: true, scopeLine: 72, isOptimized: false, unit: !0, variables: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !10, line: 73, type: !4)
!85 = !DILocation(line: 73, column: 9, scope: !83)
!86 = !DILocation(line: 75, column: 10, scope: !83)
!87 = !DILocation(line: 77, column: 12, scope: !83)
!88 = !DILocation(line: 77, column: 10, scope: !83)
!89 = !DILocation(line: 78, column: 14, scope: !83)
!90 = !DILocation(line: 78, column: 5, scope: !83)
!91 = !DILocation(line: 79, column: 1, scope: !83)
!92 = distinct !DISubprogram(name: "goodSink", scope: !10, file: !10, line: 44, type: !38, isLocal: true, isDefinition: true, scopeLine: 45, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!93 = !DILocalVariable(name: "data", arg: 1, scope: !92, file: !10, line: 44, type: !4)
!94 = !DILocation(line: 44, column: 26, scope: !92)
!95 = !DILocation(line: 46, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !10, line: 46, column: 8)
!97 = !DILocation(line: 46, column: 13, scope: !96)
!98 = !DILocation(line: 46, column: 8, scope: !92)
!99 = !DILocation(line: 49, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !101, file: !10, line: 49, column: 13)
!101 = distinct !DILexicalBlock(scope: !96, file: !10, line: 47, column: 5)
!102 = !DILocation(line: 49, column: 18, scope: !100)
!103 = !DILocation(line: 49, column: 13, scope: !101)
!104 = !DILocalVariable(name: "result", scope: !105, file: !10, line: 51, type: !4)
!105 = distinct !DILexicalBlock(scope: !100, file: !10, line: 50, column: 9)
!106 = !DILocation(line: 51, column: 17, scope: !105)
!107 = !DILocation(line: 51, column: 26, scope: !105)
!108 = !DILocation(line: 51, column: 31, scope: !105)
!109 = !DILocation(line: 52, column: 26, scope: !105)
!110 = !DILocation(line: 52, column: 13, scope: !105)
!111 = !DILocation(line: 53, column: 9, scope: !105)
!112 = !DILocation(line: 56, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !100, file: !10, line: 55, column: 9)
!114 = !DILocation(line: 58, column: 5, scope: !101)
!115 = !DILocation(line: 59, column: 1, scope: !92)
!116 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 81, type: !117, isLocal: false, isDefinition: true, scopeLine: 81, isOptimized: false, unit: !0, variables: !2)
!117 = !DISubroutineType(types: !118)
!118 = !{!4}
!119 = !DILocation(line: 82, column: 5, scope: !116)
!120 = !DILocation(line: 83, column: 5, scope: !116)
!121 = !DILocation(line: 84, column: 5, scope: !116)
