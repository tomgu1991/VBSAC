; ModuleID = './190_25.c'
source_filename = "./190_25.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.3 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.4 = private unnamed_addr constant [4 x i8] c"%hd\00", align 1

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
define void @badSink(i16* %dataPtr) #0 !dbg !56 {
entry:
  %dataPtr.addr = alloca i16*, align 8
  %data = alloca i16, align 2
  %result = alloca i16, align 2
  store i16* %dataPtr, i16** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i16** %dataPtr.addr, metadata !61, metadata !15), !dbg !62
  call void @llvm.dbg.declare(metadata i16* %data, metadata !63, metadata !15), !dbg !64
  %0 = load i16*, i16** %dataPtr.addr, align 8, !dbg !65
  %1 = load i16, i16* %0, align 2, !dbg !66
  store i16 %1, i16* %data, align 2, !dbg !64
  call void @llvm.dbg.declare(metadata i16* %result, metadata !67, metadata !15), !dbg !69
  %2 = load i16, i16* %data, align 2, !dbg !70
  %conv = sext i16 %2 to i32, !dbg !70
  %add = add nsw i32 %conv, 1, !dbg !71
  %conv1 = trunc i32 %add to i16, !dbg !70
  store i16 %conv1, i16* %result, align 2, !dbg !69
  %3 = load i16, i16* %result, align 2, !dbg !72
  %conv2 = sext i16 %3 to i32, !dbg !72
  call void @printIntLine(i32 %conv2), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nounwind uwtable
define void @goodSink(i16* %dataPtr) #0 !dbg !75 {
entry:
  %dataPtr.addr = alloca i16*, align 8
  %data = alloca i16, align 2
  %result = alloca i16, align 2
  store i16* %dataPtr, i16** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i16** %dataPtr.addr, metadata !76, metadata !15), !dbg !77
  call void @llvm.dbg.declare(metadata i16* %data, metadata !78, metadata !15), !dbg !79
  %0 = load i16*, i16** %dataPtr.addr, align 8, !dbg !80
  %1 = load i16, i16* %0, align 2, !dbg !81
  store i16 %1, i16* %data, align 2, !dbg !79
  %2 = load i16, i16* %data, align 2, !dbg !82
  %conv = sext i16 %2 to i32, !dbg !82
  %cmp = icmp slt i32 %conv, 32767, !dbg !84
  br i1 %cmp, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i16* %result, metadata !86, metadata !15), !dbg !88
  %3 = load i16, i16* %data, align 2, !dbg !89
  %conv2 = sext i16 %3 to i32, !dbg !89
  %add = add nsw i32 %conv2, 1, !dbg !90
  %conv3 = trunc i32 %add to i16, !dbg !89
  store i16 %conv3, i16* %result, align 2, !dbg !88
  %4 = load i16, i16* %result, align 2, !dbg !91
  %conv4 = sext i16 %4 to i32, !dbg !91
  call void @printIntLine(i32 %conv4), !dbg !92
  br label %if.end, !dbg !93

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.3, i32 0, i32 0)), !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !96
}

; Function Attrs: nounwind uwtable
define void @bad25() #0 !dbg !97 {
entry:
  %data = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %data, metadata !100, metadata !15), !dbg !101
  store i16 0, i16* %data, align 2, !dbg !102
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !103
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i16* %data), !dbg !104
  call void @badSink(i16* %data), !dbg !105
  ret void, !dbg !106
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good25() #0 !dbg !107 {
entry:
  %data = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %data, metadata !108, metadata !15), !dbg !109
  store i16 0, i16* %data, align 2, !dbg !110
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !111
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i16* %data), !dbg !112
  call void @goodSink(i16* %data), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !115 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good25(), !dbg !118
  call void @bad25(), !dbg !119
  ret i32 1, !dbg !120
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "190_25.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{i32 2, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!9 = distinct !DISubprogram(name: "printHexCharLine", scope: !10, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!10 = !DIFile(filename: "./190_25.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
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
!56 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 34, type: !57, isLocal: false, isDefinition: true, scopeLine: 35, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{null, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64, align: 64)
!60 = !DIBasicType(name: "short", size: 16, align: 16, encoding: DW_ATE_signed)
!61 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !56, file: !10, line: 34, type: !59)
!62 = !DILocation(line: 34, column: 22, scope: !56)
!63 = !DILocalVariable(name: "data", scope: !56, file: !10, line: 36, type: !60)
!64 = !DILocation(line: 36, column: 11, scope: !56)
!65 = !DILocation(line: 36, column: 19, scope: !56)
!66 = !DILocation(line: 36, column: 18, scope: !56)
!67 = !DILocalVariable(name: "result", scope: !68, file: !10, line: 39, type: !60)
!68 = distinct !DILexicalBlock(scope: !56, file: !10, line: 37, column: 5)
!69 = !DILocation(line: 39, column: 15, scope: !68)
!70 = !DILocation(line: 39, column: 24, scope: !68)
!71 = !DILocation(line: 39, column: 29, scope: !68)
!72 = !DILocation(line: 40, column: 22, scope: !68)
!73 = !DILocation(line: 40, column: 9, scope: !68)
!74 = !DILocation(line: 42, column: 1, scope: !56)
!75 = distinct !DISubprogram(name: "goodSink", scope: !10, file: !10, line: 44, type: !57, isLocal: false, isDefinition: true, scopeLine: 45, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!76 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !75, file: !10, line: 44, type: !59)
!77 = !DILocation(line: 44, column: 23, scope: !75)
!78 = !DILocalVariable(name: "data", scope: !75, file: !10, line: 46, type: !60)
!79 = !DILocation(line: 46, column: 11, scope: !75)
!80 = !DILocation(line: 46, column: 19, scope: !75)
!81 = !DILocation(line: 46, column: 18, scope: !75)
!82 = !DILocation(line: 48, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !75, file: !10, line: 48, column: 9)
!84 = !DILocation(line: 48, column: 14, scope: !83)
!85 = !DILocation(line: 48, column: 9, scope: !75)
!86 = !DILocalVariable(name: "result", scope: !87, file: !10, line: 50, type: !60)
!87 = distinct !DILexicalBlock(scope: !83, file: !10, line: 49, column: 5)
!88 = !DILocation(line: 50, column: 15, scope: !87)
!89 = !DILocation(line: 50, column: 24, scope: !87)
!90 = !DILocation(line: 50, column: 29, scope: !87)
!91 = !DILocation(line: 51, column: 22, scope: !87)
!92 = !DILocation(line: 51, column: 9, scope: !87)
!93 = !DILocation(line: 52, column: 5, scope: !87)
!94 = !DILocation(line: 55, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !83, file: !10, line: 54, column: 5)
!96 = !DILocation(line: 57, column: 1, scope: !75)
!97 = distinct !DISubprogram(name: "bad25", scope: !10, file: !10, line: 59, type: !98, isLocal: false, isDefinition: true, scopeLine: 60, isOptimized: false, unit: !0, variables: !2)
!98 = !DISubroutineType(types: !99)
!99 = !{null}
!100 = !DILocalVariable(name: "data", scope: !97, file: !10, line: 61, type: !60)
!101 = !DILocation(line: 61, column: 11, scope: !97)
!102 = !DILocation(line: 62, column: 10, scope: !97)
!103 = !DILocation(line: 64, column: 13, scope: !97)
!104 = !DILocation(line: 64, column: 5, scope: !97)
!105 = !DILocation(line: 65, column: 5, scope: !97)
!106 = !DILocation(line: 66, column: 1, scope: !97)
!107 = distinct !DISubprogram(name: "good25", scope: !10, file: !10, line: 68, type: !98, isLocal: false, isDefinition: true, scopeLine: 69, isOptimized: false, unit: !0, variables: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !10, line: 70, type: !60)
!109 = !DILocation(line: 70, column: 11, scope: !107)
!110 = !DILocation(line: 71, column: 10, scope: !107)
!111 = !DILocation(line: 73, column: 13, scope: !107)
!112 = !DILocation(line: 73, column: 5, scope: !107)
!113 = !DILocation(line: 74, column: 5, scope: !107)
!114 = !DILocation(line: 75, column: 1, scope: !107)
!115 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 77, type: !116, isLocal: false, isDefinition: true, scopeLine: 77, isOptimized: false, unit: !0, variables: !2)
!116 = !DISubroutineType(types: !117)
!117 = !{!4}
!118 = !DILocation(line: 78, column: 5, scope: !115)
!119 = !DILocation(line: 79, column: 5, scope: !115)
!120 = !DILocation(line: 80, column: 5, scope: !115)
