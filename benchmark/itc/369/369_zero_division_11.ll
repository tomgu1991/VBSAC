; ModuleID = './369_zero_division_11.c'
source_filename = "./369_zero_division_11.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @zero_division_013_func_001_bad() #0 !dbg !6 {
entry:
  ret i32 0, !dbg !11
}

; Function Attrs: nounwind uwtable
define void @zero_division_013_bad() #0 !dbg !12 {
entry:
  %dividend = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %dividend, metadata !15, metadata !16), !dbg !17
  store i32 1000, i32* %dividend, align 4, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !18, metadata !16), !dbg !19
  %0 = load i32, i32* %dividend, align 4, !dbg !20
  %call = call i32 @zero_division_013_func_001_bad(), !dbg !21
  %div = sdiv i32 %0, %call, !dbg !22
  store i32 %div, i32* %ret, align 4, !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @zero_division_013_func_001_good() #0 !dbg !25 {
entry:
  ret i32 1, !dbg !26
}

; Function Attrs: nounwind uwtable
define void @zero_division_013_good() #0 !dbg !27 {
entry:
  %dividend = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %dividend, metadata !28, metadata !16), !dbg !29
  store i32 1000, i32* %dividend, align 4, !dbg !29
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !30, metadata !16), !dbg !31
  %0 = load i32, i32* %dividend, align 4, !dbg !32
  %call = call i32 @zero_division_013_func_001_good(), !dbg !33
  %div = sdiv i32 %0, %call, !dbg !34
  store i32 %div, i32* %ret, align 4, !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !37 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @zero_division_013_good(), !dbg !38
  call void @zero_division_013_bad(), !dbg !39
  ret i32 0, !dbg !40
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "369_zero_division_11.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/369")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "zero_division_013_func_001_bad", scope: !7, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./369_zero_division_11.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/369")
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!11 = !DILocation(line: 9, column: 2, scope: !6)
!12 = distinct !DISubprogram(name: "zero_division_013_bad", scope: !7, file: !7, line: 12, type: !13, isLocal: false, isDefinition: true, scopeLine: 13, isOptimized: false, unit: !0, variables: !2)
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "dividend", scope: !12, file: !7, line: 14, type: !10)
!16 = !DIExpression()
!17 = !DILocation(line: 14, column: 6, scope: !12)
!18 = !DILocalVariable(name: "ret", scope: !12, file: !7, line: 15, type: !10)
!19 = !DILocation(line: 15, column: 6, scope: !12)
!20 = !DILocation(line: 16, column: 8, scope: !12)
!21 = !DILocation(line: 16, column: 19, scope: !12)
!22 = !DILocation(line: 16, column: 17, scope: !12)
!23 = !DILocation(line: 16, column: 6, scope: !12)
!24 = !DILocation(line: 17, column: 1, scope: !12)
!25 = distinct !DISubprogram(name: "zero_division_013_func_001_good", scope: !7, file: !7, line: 23, type: !8, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!26 = !DILocation(line: 25, column: 2, scope: !25)
!27 = distinct !DISubprogram(name: "zero_division_013_good", scope: !7, file: !7, line: 28, type: !13, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!28 = !DILocalVariable(name: "dividend", scope: !27, file: !7, line: 30, type: !10)
!29 = !DILocation(line: 30, column: 6, scope: !27)
!30 = !DILocalVariable(name: "ret", scope: !27, file: !7, line: 31, type: !10)
!31 = !DILocation(line: 31, column: 6, scope: !27)
!32 = !DILocation(line: 32, column: 8, scope: !27)
!33 = !DILocation(line: 32, column: 19, scope: !27)
!34 = !DILocation(line: 32, column: 17, scope: !27)
!35 = !DILocation(line: 32, column: 6, scope: !27)
!36 = !DILocation(line: 33, column: 1, scope: !27)
!37 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 35, type: !8, isLocal: false, isDefinition: true, scopeLine: 35, isOptimized: false, unit: !0, variables: !2)
!38 = !DILocation(line: 36, column: 3, scope: !37)
!39 = !DILocation(line: 37, column: 2, scope: !37)
!40 = !DILocation(line: 38, column: 3, scope: !37)
