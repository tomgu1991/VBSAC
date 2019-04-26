; ModuleID = './476_7.c'
source_filename = "./476_7.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@GLOBAL_CONST_TRUE = constant i32 1, align 4
@GLOBAL_CONST_FALSE = constant i32 0, align 4
@GLOBAL_CONST_FIVE = constant i32 5, align 4
@globalTrue = global i32 1, align 4
@globalFalse = global i32 0, align 4
@globalFive = global i32 5, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@staticFive = internal global i32 5, align 4
@.str.3 = private unnamed_addr constant [12 x i8] c"intOne == 5\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrue() #0 !dbg !19 {
entry:
  ret i32 1, !dbg !22
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !23 {
entry:
  ret i32 0, !dbg !24
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !25 {
entry:
  %call = call i32 @rand() #4, !dbg !26
  %rem = srem i32 %call, 2, !dbg !27
  ret i32 %rem, !dbg !28
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !29 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !33, metadata !34), !dbg !35
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !36
  %conv = sext i8 %0 to i32, !dbg !37
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !40 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !45, metadata !34), !dbg !46
  %0 = load i8*, i8** %line.addr, align 8, !dbg !47
  %cmp = icmp ne i8* %0, null, !dbg !49
  br i1 %cmp, label %if.then, label %if.end, !dbg !50

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !51
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !53
  br label %if.end, !dbg !54

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !55
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !56 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !59, metadata !34), !dbg !60
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !61
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !64 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !70, metadata !34), !dbg !71
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !72
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nounwind uwtable
define void @bad7() #0 !dbg !75 {
entry:
  %twoIntsStructPointer = alloca %struct._twoIntsStruct*, align 8
  %0 = load i32, i32* @staticFive, align 4, !dbg !78
  %cmp = icmp eq i32 %0, 5, !dbg !80
  br i1 %cmp, label %if.then, label %if.end5, !dbg !81

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %twoIntsStructPointer, metadata !82, metadata !34), !dbg !92
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !92
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !93
  %cmp1 = icmp ne %struct._twoIntsStruct* %1, null, !dbg !95
  %conv = zext i1 %cmp1 to i32, !dbg !95
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !96
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !97
  %3 = load i32, i32* %intOne, align 4, !dbg !97
  %cmp2 = icmp eq i32 %3, 5, !dbg !98
  %conv3 = zext i1 %cmp2 to i32, !dbg !98
  %and = and i32 %conv, %conv3, !dbg !99
  %tobool = icmp ne i32 %and, 0, !dbg !99
  br i1 %tobool, label %if.then4, label %if.end, !dbg !100

if.then4:                                         ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0)), !dbg !101
  br label %if.end, !dbg !103

if.end:                                           ; preds = %if.then4, %if.then
  br label %if.end5, !dbg !104

if.end5:                                          ; preds = %if.end, %entry
  ret void, !dbg !105
}

; Function Attrs: nounwind uwtable
define void @good7() #0 !dbg !106 {
entry:
  %twoIntsStructPointer = alloca %struct._twoIntsStruct*, align 8
  %0 = load i32, i32* @staticFive, align 4, !dbg !107
  %cmp = icmp ne i32 %0, 5, !dbg !109
  br i1 %cmp, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0)), !dbg !111
  br label %if.end4, !dbg !113

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %twoIntsStructPointer, metadata !114, metadata !34), !dbg !117
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !117
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !118
  %cmp1 = icmp ne %struct._twoIntsStruct* %1, null, !dbg !120
  br i1 %cmp1, label %land.lhs.true, label %if.end, !dbg !121

land.lhs.true:                                    ; preds = %if.else
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !122
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !124
  %3 = load i32, i32* %intOne, align 4, !dbg !124
  %cmp2 = icmp eq i32 %3, 5, !dbg !125
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !126

if.then3:                                         ; preds = %land.lhs.true
  call void @printLine(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0)), !dbg !127
  br label %if.end, !dbg !129

if.end:                                           ; preds = %if.then3, %land.lhs.true, %if.else
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  ret void, !dbg !130
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !131 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good7(), !dbg !132
  call void @bad7(), !dbg !133
  ret i32 1, !dbg !134
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !6)
!1 = !DIFile(filename: "476_7.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/476")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7, !10, !11, !12, !13, !14, !15}
!7 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!8 = !DIFile(filename: "./476_7.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/476")
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !8, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!13 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !8, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!14 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !8, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!15 = distinct !DIGlobalVariable(name: "staticFive", scope: !0, file: !8, line: 57, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticFive)
!16 = !{i32 2, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!19 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !8, file: !8, line: 18, type: !20, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!20 = !DISubroutineType(types: !21)
!21 = !{!4}
!22 = !DILocation(line: 20, column: 5, scope: !19)
!23 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !8, file: !8, line: 23, type: !20, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!24 = !DILocation(line: 25, column: 5, scope: !23)
!25 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !8, file: !8, line: 28, type: !20, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!26 = !DILocation(line: 30, column: 13, scope: !25)
!27 = !DILocation(line: 30, column: 20, scope: !25)
!28 = !DILocation(line: 30, column: 5, scope: !25)
!29 = distinct !DISubprogram(name: "printHexCharLine", scope: !8, file: !8, line: 33, type: !30, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{null, !32}
!32 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!33 = !DILocalVariable(name: "charHex", arg: 1, scope: !29, file: !8, line: 33, type: !32)
!34 = !DIExpression()
!35 = !DILocation(line: 33, column: 29, scope: !29)
!36 = !DILocation(line: 35, column: 25, scope: !29)
!37 = !DILocation(line: 35, column: 20, scope: !29)
!38 = !DILocation(line: 35, column: 5, scope: !29)
!39 = !DILocation(line: 36, column: 1, scope: !29)
!40 = distinct !DISubprogram(name: "printLine", scope: !8, file: !8, line: 38, type: !41, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{null, !43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64, align: 64)
!44 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !32)
!45 = !DILocalVariable(name: "line", arg: 1, scope: !40, file: !8, line: 38, type: !43)
!46 = !DILocation(line: 38, column: 30, scope: !40)
!47 = !DILocation(line: 40, column: 8, scope: !48)
!48 = distinct !DILexicalBlock(scope: !40, file: !8, line: 40, column: 8)
!49 = !DILocation(line: 40, column: 13, scope: !48)
!50 = !DILocation(line: 40, column: 8, scope: !40)
!51 = !DILocation(line: 42, column: 24, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !8, line: 41, column: 5)
!53 = !DILocation(line: 42, column: 9, scope: !52)
!54 = !DILocation(line: 43, column: 5, scope: !52)
!55 = !DILocation(line: 44, column: 1, scope: !40)
!56 = distinct !DISubprogram(name: "printIntLine", scope: !8, file: !8, line: 46, type: !57, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{null, !4}
!59 = !DILocalVariable(name: "intNumber", arg: 1, scope: !56, file: !8, line: 46, type: !4)
!60 = !DILocation(line: 46, column: 24, scope: !56)
!61 = !DILocation(line: 48, column: 20, scope: !56)
!62 = !DILocation(line: 48, column: 5, scope: !56)
!63 = !DILocation(line: 49, column: 1, scope: !56)
!64 = distinct !DISubprogram(name: "printLongLine", scope: !8, file: !8, line: 51, type: !65, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{null, !67}
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !68, line: 197, baseType: !69)
!68 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/476")
!69 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!70 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !64, file: !8, line: 51, type: !67)
!71 = !DILocation(line: 51, column: 29, scope: !64)
!72 = !DILocation(line: 53, column: 21, scope: !64)
!73 = !DILocation(line: 53, column: 5, scope: !64)
!74 = !DILocation(line: 54, column: 1, scope: !64)
!75 = distinct !DISubprogram(name: "bad7", scope: !8, file: !8, line: 61, type: !76, isLocal: false, isDefinition: true, scopeLine: 62, isOptimized: false, unit: !0, variables: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{null}
!78 = !DILocation(line: 63, column: 8, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !8, line: 63, column: 8)
!80 = !DILocation(line: 63, column: 18, scope: !79)
!81 = !DILocation(line: 63, column: 8, scope: !75)
!82 = !DILocalVariable(name: "twoIntsStructPointer", scope: !83, file: !8, line: 66, type: !85)
!83 = distinct !DILexicalBlock(scope: !84, file: !8, line: 65, column: 9)
!84 = distinct !DILexicalBlock(scope: !79, file: !8, line: 64, column: 5)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64, align: 64)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !87, line: 14, baseType: !88)
!87 = !DIFile(filename: "./476.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/476")
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !87, line: 10, size: 64, align: 32, elements: !89)
!89 = !{!90, !91}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !88, file: !87, line: 12, baseType: !4, size: 32, align: 32)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !88, file: !87, line: 13, baseType: !4, size: 32, align: 32, offset: 32)
!92 = !DILocation(line: 66, column: 28, scope: !83)
!93 = !DILocation(line: 69, column: 18, scope: !94)
!94 = distinct !DILexicalBlock(scope: !83, file: !8, line: 69, column: 17)
!95 = !DILocation(line: 69, column: 39, scope: !94)
!96 = !DILocation(line: 69, column: 51, scope: !94)
!97 = !DILocation(line: 69, column: 73, scope: !94)
!98 = !DILocation(line: 69, column: 80, scope: !94)
!99 = !DILocation(line: 69, column: 48, scope: !94)
!100 = !DILocation(line: 69, column: 17, scope: !83)
!101 = !DILocation(line: 71, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !94, file: !8, line: 70, column: 13)
!103 = !DILocation(line: 72, column: 13, scope: !102)
!104 = !DILocation(line: 74, column: 5, scope: !84)
!105 = !DILocation(line: 75, column: 1, scope: !75)
!106 = distinct !DISubprogram(name: "good7", scope: !8, file: !8, line: 81, type: !76, isLocal: false, isDefinition: true, scopeLine: 82, isOptimized: false, unit: !0, variables: !2)
!107 = !DILocation(line: 83, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !106, file: !8, line: 83, column: 8)
!109 = !DILocation(line: 83, column: 18, scope: !108)
!110 = !DILocation(line: 83, column: 8, scope: !106)
!111 = !DILocation(line: 86, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !8, line: 84, column: 5)
!113 = !DILocation(line: 87, column: 5, scope: !112)
!114 = !DILocalVariable(name: "twoIntsStructPointer", scope: !115, file: !8, line: 91, type: !85)
!115 = distinct !DILexicalBlock(scope: !116, file: !8, line: 90, column: 9)
!116 = distinct !DILexicalBlock(scope: !108, file: !8, line: 89, column: 5)
!117 = !DILocation(line: 91, column: 28, scope: !115)
!118 = !DILocation(line: 94, column: 18, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !8, line: 94, column: 17)
!120 = !DILocation(line: 94, column: 39, scope: !119)
!121 = !DILocation(line: 94, column: 48, scope: !119)
!122 = !DILocation(line: 94, column: 52, scope: !123)
!123 = !DILexicalBlockFile(scope: !119, file: !8, discriminator: 1)
!124 = !DILocation(line: 94, column: 74, scope: !123)
!125 = !DILocation(line: 94, column: 81, scope: !123)
!126 = !DILocation(line: 94, column: 17, scope: !123)
!127 = !DILocation(line: 96, column: 17, scope: !128)
!128 = distinct !DILexicalBlock(scope: !119, file: !8, line: 95, column: 13)
!129 = !DILocation(line: 97, column: 13, scope: !128)
!130 = !DILocation(line: 100, column: 1, scope: !106)
!131 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 103, type: !20, isLocal: false, isDefinition: true, scopeLine: 103, isOptimized: false, unit: !0, variables: !2)
!132 = !DILocation(line: 104, column: 5, scope: !131)
!133 = !DILocation(line: 105, column: 2, scope: !131)
!134 = !DILocation(line: 106, column: 5, scope: !131)
