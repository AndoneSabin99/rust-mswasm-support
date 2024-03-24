; ModuleID = 'boxes.2a9f7b720e4a03aa-cgu.0'
source_filename = "boxes.2a9f7b720e4a03aa-cgu.0"
target datalayout = "e-m:e-p:32:32-p10:8:8-p20:8:8-i64:64-n32:64-S128-ni:1:10:20"
target triple = "wasm32-unknown-wasi"

%"core::ptr::metadata::PtrRepr<[u8]>" = type { [2 x i32] }

@vtable.0 = private unnamed_addr constant <{ ptr, [8 x i8], ptr, ptr, ptr }> <{ ptr @"_ZN4core3ptr85drop_in_place$LT$std..rt..lang_start$LT$$LP$$RP$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17h11de64221d424f3eE", [8 x i8] c"\04\00\00\00\04\00\00\00", ptr @"_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h0b12d6c3ba740fcfE", ptr @"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h4437eb93c05a4498E", ptr @"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h4437eb93c05a4498E" }>, align 4
@alloc_38a9d1c1fccd92e612dd2762da060982 = private unnamed_addr constant <{}> zeroinitializer, align 1
@__rust_no_alloc_shim_is_unstable = external dso_local global i8
@alloc_618cf91eca10cc36ac98c66c3d77169c = private unnamed_addr constant <{ [8 x i8] }> <{ [8 x i8] c"boxes.rs" }>, align 1
@alloc_4f935b52509c9109dcadbf4236f20dd9 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_618cf91eca10cc36ac98c66c3d77169c, [12 x i8] c"\08\00\00\00\05\00\00\00\0D\00\00\00" }>, align 4

; std::sys_common::backtrace::__rust_begin_short_backtrace
; Function Attrs: noinline nounwind
define internal void @_ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17h0e1bd449a2881db5E(ptr %f) unnamed_addr #0 {
start:
; call core::ops::function::FnOnce::call_once
  call void @_ZN4core3ops8function6FnOnce9call_once17h09bc42261fc4b351E(ptr %f) #11
  call void asm sideeffect "", "~{memory}"(), !srcloc !1
  ret void
}

; std::rt::lang_start
; Function Attrs: noinline nounwind
define hidden i32 @_ZN3std2rt10lang_start17h6063c5dd6bb16c7dE(ptr %main, i32 %argc, ptr %argv, i8 %sigpipe) unnamed_addr #0 {
start:
  %_8 = alloca ptr, align 4
  %_5 = alloca i32, align 4
  store ptr %main, ptr %_8, align 4
; call std::rt::lang_start_internal
  %0 = call i32 @_ZN3std2rt19lang_start_internal17he26dd9e71170290bE(ptr align 1 %_8, ptr align 4 @vtable.0, i32 %argc, ptr %argv, i8 %sigpipe) #11
  store i32 %0, ptr %_5, align 4
  %v = load i32, ptr %_5, align 4, !noundef !2
  ret i32 %v
}

; std::rt::lang_start::{{closure}}
; Function Attrs: inlinehint nounwind
define internal i32 @"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h4437eb93c05a4498E"(ptr align 4 %_1) unnamed_addr #1 {
start:
  %self = alloca i8, align 1
  %_4 = load ptr, ptr %_1, align 4, !nonnull !2, !noundef !2
; call std::sys_common::backtrace::__rust_begin_short_backtrace
  call void @_ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17h0e1bd449a2881db5E(ptr %_4) #11
; call <() as std::process::Termination>::report
  %0 = call zeroext i1 @"_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17h6c426b0ce673a3bbE"() #11
  %1 = zext i1 %0 to i8
  store i8 %1, ptr %self, align 1
  %2 = load i8, ptr %self, align 1, !range !3, !noundef !2
  %_6 = trunc i8 %2 to i1
  %_0 = zext i1 %_6 to i32
  ret i32 %_0
}

; core::ops::function::FnOnce::call_once{{vtable.shim}}
; Function Attrs: inlinehint nounwind
define internal i32 @"_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h0b12d6c3ba740fcfE"(ptr %_1) unnamed_addr #1 {
start:
  %_2 = alloca {}, align 1
  %0 = load ptr, ptr %_1, align 4, !nonnull !2, !noundef !2
; call core::ops::function::FnOnce::call_once
  %_0 = call i32 @_ZN4core3ops8function6FnOnce9call_once17h52363fcca16889e2E(ptr %0) #11
  ret i32 %_0
}

; core::ops::function::FnOnce::call_once
; Function Attrs: inlinehint nounwind
define internal void @_ZN4core3ops8function6FnOnce9call_once17h09bc42261fc4b351E(ptr %_1) unnamed_addr #1 {
start:
  %_2 = alloca {}, align 1
  call void %_1() #11
  ret void
}

; core::ops::function::FnOnce::call_once
; Function Attrs: inlinehint nounwind
define internal i32 @_ZN4core3ops8function6FnOnce9call_once17h52363fcca16889e2E(ptr %0) unnamed_addr #1 {
start:
  %_2 = alloca {}, align 1
  %_1 = alloca ptr, align 4
  store ptr %0, ptr %_1, align 4
; call std::rt::lang_start::{{closure}}
  %_0 = call i32 @"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h4437eb93c05a4498E"(ptr align 4 %_1) #11
  ret i32 %_0
}

; core::ptr::drop_in_place<alloc::boxed::Box<i32>>
; Function Attrs: nounwind
define internal void @"_ZN4core3ptr49drop_in_place$LT$alloc..boxed..Box$LT$i32$GT$$GT$17h8d8751bb811d64a6E"(ptr align 4 %_1) unnamed_addr #2 {
start:
  %_6 = load ptr, ptr %_1, align 4, !noundef !2
; call <alloc::boxed::Box<T,A> as core::ops::drop::Drop>::drop
  call void @"_ZN72_$LT$alloc..boxed..Box$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h47c16b3feda3d786E"(ptr align 4 %_1) #11
  ret void
}

; core::ptr::drop_in_place<std::rt::lang_start<()>::{{closure}}>
; Function Attrs: inlinehint nounwind
define internal void @"_ZN4core3ptr85drop_in_place$LT$std..rt..lang_start$LT$$LP$$RP$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17h11de64221d424f3eE"(ptr align 4 %_1) unnamed_addr #1 {
start:
  ret void
}

; <() as std::process::Termination>::report
; Function Attrs: inlinehint nounwind
define internal zeroext i1 @"_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17h6c426b0ce673a3bbE"() unnamed_addr #1 {
start:
  ret i1 false
}

; alloc::alloc::exchange_malloc
; Function Attrs: inlinehint nounwind
define internal ptr @_ZN5alloc5alloc15exchange_malloc17h673cdb9de67d4918E(i32 %size, i32 %align) unnamed_addr #1 {
start:
  %self = alloca ptr, align 4
  %_4 = alloca { ptr, i32 }, align 4
  %layout = alloca { i32, i32 }, align 4
  %0 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  store i32 %size, ptr %0, align 4
  store i32 %align, ptr %layout, align 4
  %1 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 0
  %2 = load i32, ptr %1, align 4, !range !4, !noundef !2
  %3 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  %4 = load i32, ptr %3, align 4, !noundef !2
; call alloc::alloc::Global::alloc_impl
  %5 = call { ptr, i32 } @_ZN5alloc5alloc6Global10alloc_impl17h1a7c59c9ce8aa94fE(ptr align 1 @alloc_38a9d1c1fccd92e612dd2762da060982, i32 %2, i32 %4, i1 zeroext false) #11
  store { ptr, i32 } %5, ptr %_4, align 4
  %6 = load ptr, ptr %_4, align 4, !noundef !2
  %7 = ptrtoint ptr %6 to i32
  %8 = icmp eq i32 %7, 0
  %_5 = select i1 %8, i32 1, i32 0
  %9 = icmp eq i32 %_5, 0
  br i1 %9, label %bb3, label %bb1

bb3:                                              ; preds = %start
  %10 = getelementptr inbounds { ptr, i32 }, ptr %_4, i32 0, i32 0
  %ptr.0 = load ptr, ptr %10, align 4, !nonnull !2, !noundef !2
  %11 = getelementptr inbounds { ptr, i32 }, ptr %_4, i32 0, i32 1
  %ptr.1 = load i32, ptr %11, align 4, !noundef !2
  store ptr %ptr.0, ptr %self, align 4
  %_16 = load ptr, ptr %self, align 4, !noundef !2
  ret ptr %_16

bb1:                                              ; preds = %start
  %12 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 0
  %13 = load i32, ptr %12, align 4, !range !4, !noundef !2
  %14 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  %15 = load i32, ptr %14, align 4, !noundef !2
; call alloc::alloc::handle_alloc_error
  call void @_ZN5alloc5alloc18handle_alloc_error17h65bcaee229518e24E(i32 %13, i32 %15) #12
  unreachable

bb2:                                              ; No predecessors!
  unreachable
}

; alloc::alloc::Global::alloc_impl
; Function Attrs: inlinehint nounwind
define internal { ptr, i32 } @_ZN5alloc5alloc6Global10alloc_impl17h1a7c59c9ce8aa94fE(ptr align 1 %self, i32 %0, i32 %1, i1 zeroext %zeroed) unnamed_addr #1 {
start:
  %2 = alloca i8, align 1
  %_76 = alloca { ptr, i32 }, align 4
  %_75 = alloca %"core::ptr::metadata::PtrRepr<[u8]>", align 4
  %_62 = alloca ptr, align 4
  %_57 = alloca i32, align 4
  %_43 = alloca i32, align 4
  %_34 = alloca { ptr, i32 }, align 4
  %_33 = alloca %"core::ptr::metadata::PtrRepr<[u8]>", align 4
  %_22 = alloca i32, align 4
  %_18 = alloca { ptr, i32 }, align 4
  %self4 = alloca ptr, align 4
  %self3 = alloca ptr, align 4
  %_12 = alloca ptr, align 4
  %layout2 = alloca { i32, i32 }, align 4
  %layout1 = alloca { i32, i32 }, align 4
  %raw_ptr = alloca ptr, align 4
  %data = alloca ptr, align 4
  %_6 = alloca { ptr, i32 }, align 4
  %_0 = alloca { ptr, i32 }, align 4
  %layout = alloca { i32, i32 }, align 4
  %3 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 0
  store i32 %0, ptr %3, align 4
  %4 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  store i32 %1, ptr %4, align 4
  %5 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  %size = load i32, ptr %5, align 4, !noundef !2
  %6 = icmp eq i32 %size, 0
  br i1 %6, label %bb2, label %bb1

bb2:                                              ; preds = %start
  %self5 = load i32, ptr %layout, align 4, !range !4, !noundef !2
  store i32 %self5, ptr %_22, align 4
  %_23 = load i32, ptr %_22, align 4, !range !4, !noundef !2
  %_24 = icmp uge i32 %_23, 1
  %_25 = icmp ule i32 %_23, -2147483648
  %_26 = and i1 %_24, %_25
  call void @llvm.assume(i1 %_26)
  %ptr = inttoptr i32 %_23 to ptr
  store ptr %ptr, ptr %data, align 4
  %_31 = load ptr, ptr %data, align 4, !noundef !2
  store ptr %_31, ptr %_34, align 4
  %7 = getelementptr inbounds { ptr, i32 }, ptr %_34, i32 0, i32 1
  store i32 0, ptr %7, align 4
  %8 = getelementptr inbounds { ptr, i32 }, ptr %_34, i32 0, i32 0
  %9 = load ptr, ptr %8, align 4, !noundef !2
  %10 = getelementptr inbounds { ptr, i32 }, ptr %_34, i32 0, i32 1
  %11 = load i32, ptr %10, align 4, !noundef !2
  %12 = getelementptr inbounds { ptr, i32 }, ptr %_33, i32 0, i32 0
  store ptr %9, ptr %12, align 4
  %13 = getelementptr inbounds { ptr, i32 }, ptr %_33, i32 0, i32 1
  store i32 %11, ptr %13, align 4
  %14 = getelementptr inbounds { ptr, i32 }, ptr %_33, i32 0, i32 0
  %ptr.0 = load ptr, ptr %14, align 4, !noundef !2
  %15 = getelementptr inbounds { ptr, i32 }, ptr %_33, i32 0, i32 1
  %ptr.1 = load i32, ptr %15, align 4, !noundef !2
  %16 = getelementptr inbounds { ptr, i32 }, ptr %_6, i32 0, i32 0
  store ptr %ptr.0, ptr %16, align 4
  %17 = getelementptr inbounds { ptr, i32 }, ptr %_6, i32 0, i32 1
  store i32 %ptr.1, ptr %17, align 4
  %18 = getelementptr inbounds { ptr, i32 }, ptr %_6, i32 0, i32 0
  %19 = load ptr, ptr %18, align 4, !nonnull !2, !noundef !2
  %20 = getelementptr inbounds { ptr, i32 }, ptr %_6, i32 0, i32 1
  %21 = load i32, ptr %20, align 4, !noundef !2
  %22 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 0
  store ptr %19, ptr %22, align 4
  %23 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 1
  store i32 %21, ptr %23, align 4
  br label %bb11

bb1:                                              ; preds = %start
  br i1 %zeroed, label %bb3, label %bb4

bb11:                                             ; preds = %bb10, %bb8, %bb2
  %24 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 0
  %25 = load ptr, ptr %24, align 4, !noundef !2
  %26 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 1
  %27 = load i32, ptr %26, align 4
  %28 = insertvalue { ptr, i32 } poison, ptr %25, 0
  %29 = insertvalue { ptr, i32 } %28, i32 %27, 1
  ret { ptr, i32 } %29

bb4:                                              ; preds = %bb1
  %30 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 0
  %31 = load i32, ptr %30, align 4, !range !4, !noundef !2
  %32 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  %33 = load i32, ptr %32, align 4, !noundef !2
  %34 = getelementptr inbounds { i32, i32 }, ptr %layout2, i32 0, i32 0
  store i32 %31, ptr %34, align 4
  %35 = getelementptr inbounds { i32, i32 }, ptr %layout2, i32 0, i32 1
  store i32 %33, ptr %35, align 4
  %36 = load volatile i8, ptr @__rust_no_alloc_shim_is_unstable, align 1
  store i8 %36, ptr %2, align 1
  %_48 = load i8, ptr %2, align 1, !noundef !2
  %37 = getelementptr inbounds { i32, i32 }, ptr %layout2, i32 0, i32 1
  %_51 = load i32, ptr %37, align 4, !noundef !2
  %self6 = load i32, ptr %layout2, align 4, !range !4, !noundef !2
  store i32 %self6, ptr %_57, align 4
  %_58 = load i32, ptr %_57, align 4, !range !4, !noundef !2
  %_59 = icmp uge i32 %_58, 1
  %_60 = icmp ule i32 %_58, -2147483648
  %_61 = and i1 %_59, %_60
  call void @llvm.assume(i1 %_61)
  %38 = call ptr @__rust_alloc(i32 %_51, i32 %_58) #11
  store ptr %38, ptr %raw_ptr, align 4
  br label %bb5

bb3:                                              ; preds = %bb1
  %39 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 0
  %40 = load i32, ptr %39, align 4, !range !4, !noundef !2
  %41 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  %42 = load i32, ptr %41, align 4, !noundef !2
  %43 = getelementptr inbounds { i32, i32 }, ptr %layout1, i32 0, i32 0
  store i32 %40, ptr %43, align 4
  %44 = getelementptr inbounds { i32, i32 }, ptr %layout1, i32 0, i32 1
  store i32 %42, ptr %44, align 4
  %45 = getelementptr inbounds { i32, i32 }, ptr %layout1, i32 0, i32 1
  %_38 = load i32, ptr %45, align 4, !noundef !2
  %self7 = load i32, ptr %layout1, align 4, !range !4, !noundef !2
  store i32 %self7, ptr %_43, align 4
  %_44 = load i32, ptr %_43, align 4, !range !4, !noundef !2
  %_45 = icmp uge i32 %_44, 1
  %_46 = icmp ule i32 %_44, -2147483648
  %_47 = and i1 %_45, %_46
  call void @llvm.assume(i1 %_47)
  %46 = call ptr @__rust_alloc_zeroed(i32 %_38, i32 %_44) #11
  store ptr %46, ptr %raw_ptr, align 4
  br label %bb5

bb5:                                              ; preds = %bb3, %bb4
  %ptr8 = load ptr, ptr %raw_ptr, align 4, !noundef !2
  %_63 = ptrtoint ptr %ptr8 to i32
  %47 = icmp eq i32 %_63, 0
  br i1 %47, label %bb15, label %bb16

bb15:                                             ; preds = %bb5
  store ptr null, ptr %self4, align 4
  br label %bb6

bb16:                                             ; preds = %bb5
  store ptr %ptr8, ptr %_62, align 4
  %48 = load ptr, ptr %_62, align 4, !nonnull !2, !noundef !2
  store ptr %48, ptr %self4, align 4
  br label %bb6

bb6:                                              ; preds = %bb16, %bb15
  %49 = load ptr, ptr %self4, align 4, !noundef !2
  %50 = ptrtoint ptr %49 to i32
  %51 = icmp eq i32 %50, 0
  %_67 = select i1 %51, i32 0, i32 1
  %52 = icmp eq i32 %_67, 0
  br i1 %52, label %bb17, label %bb18

bb17:                                             ; preds = %bb6
  store ptr null, ptr %self3, align 4
  br label %bb19

bb18:                                             ; preds = %bb6
  %v = load ptr, ptr %self4, align 4, !nonnull !2, !noundef !2
  store ptr %v, ptr %self3, align 4
  br label %bb19

bb19:                                             ; preds = %bb18, %bb17
  %53 = load ptr, ptr %self3, align 4, !noundef !2
  %54 = ptrtoint ptr %53 to i32
  %55 = icmp eq i32 %54, 0
  %_69 = select i1 %55, i32 1, i32 0
  %56 = icmp eq i32 %_69, 0
  br i1 %56, label %bb21, label %bb20

bb21:                                             ; preds = %bb19
  %v9 = load ptr, ptr %self3, align 4, !nonnull !2, !noundef !2
  store ptr %v9, ptr %_12, align 4
  br label %bb7

bb20:                                             ; preds = %bb19
  store ptr null, ptr %_12, align 4
  br label %bb7

bb7:                                              ; preds = %bb20, %bb21
  %57 = load ptr, ptr %_12, align 4, !noundef !2
  %58 = ptrtoint ptr %57 to i32
  %59 = icmp eq i32 %58, 0
  %_16 = select i1 %59, i32 1, i32 0
  %60 = icmp eq i32 %_16, 0
  br i1 %60, label %bb8, label %bb10

bb8:                                              ; preds = %bb7
  %ptr10 = load ptr, ptr %_12, align 4, !nonnull !2, !noundef !2
  store ptr %ptr10, ptr %_76, align 4
  %61 = getelementptr inbounds { ptr, i32 }, ptr %_76, i32 0, i32 1
  store i32 %size, ptr %61, align 4
  %62 = getelementptr inbounds { ptr, i32 }, ptr %_76, i32 0, i32 0
  %63 = load ptr, ptr %62, align 4, !noundef !2
  %64 = getelementptr inbounds { ptr, i32 }, ptr %_76, i32 0, i32 1
  %65 = load i32, ptr %64, align 4, !noundef !2
  %66 = getelementptr inbounds { ptr, i32 }, ptr %_75, i32 0, i32 0
  store ptr %63, ptr %66, align 4
  %67 = getelementptr inbounds { ptr, i32 }, ptr %_75, i32 0, i32 1
  store i32 %65, ptr %67, align 4
  %68 = getelementptr inbounds { ptr, i32 }, ptr %_75, i32 0, i32 0
  %ptr.011 = load ptr, ptr %68, align 4, !noundef !2
  %69 = getelementptr inbounds { ptr, i32 }, ptr %_75, i32 0, i32 1
  %ptr.112 = load i32, ptr %69, align 4, !noundef !2
  %70 = getelementptr inbounds { ptr, i32 }, ptr %_18, i32 0, i32 0
  store ptr %ptr.011, ptr %70, align 4
  %71 = getelementptr inbounds { ptr, i32 }, ptr %_18, i32 0, i32 1
  store i32 %ptr.112, ptr %71, align 4
  %72 = getelementptr inbounds { ptr, i32 }, ptr %_18, i32 0, i32 0
  %73 = load ptr, ptr %72, align 4, !nonnull !2, !noundef !2
  %74 = getelementptr inbounds { ptr, i32 }, ptr %_18, i32 0, i32 1
  %75 = load i32, ptr %74, align 4, !noundef !2
  %76 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 0
  store ptr %73, ptr %76, align 4
  %77 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 1
  store i32 %75, ptr %77, align 4
  br label %bb11

bb10:                                             ; preds = %bb7
  store ptr null, ptr %_0, align 4
  br label %bb11

bb9:                                              ; No predecessors!
  unreachable
}

; <alloc::alloc::Global as core::alloc::Allocator>::deallocate
; Function Attrs: inlinehint nounwind
define internal void @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h8ff77c19d8011b67E"(ptr align 1 %self, ptr %ptr, i32 %0, i32 %1) unnamed_addr #1 {
start:
  %_14 = alloca i32, align 4
  %layout1 = alloca { i32, i32 }, align 4
  %layout = alloca { i32, i32 }, align 4
  %2 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 0
  store i32 %0, ptr %2, align 4
  %3 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  store i32 %1, ptr %3, align 4
  %4 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  %_4 = load i32, ptr %4, align 4, !noundef !2
  %5 = icmp eq i32 %_4, 0
  br i1 %5, label %bb2, label %bb1

bb2:                                              ; preds = %start
  br label %bb3

bb1:                                              ; preds = %start
  %6 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 0
  %7 = load i32, ptr %6, align 4, !range !4, !noundef !2
  %8 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  %9 = load i32, ptr %8, align 4, !noundef !2
  %10 = getelementptr inbounds { i32, i32 }, ptr %layout1, i32 0, i32 0
  store i32 %7, ptr %10, align 4
  %11 = getelementptr inbounds { i32, i32 }, ptr %layout1, i32 0, i32 1
  store i32 %9, ptr %11, align 4
  %12 = getelementptr inbounds { i32, i32 }, ptr %layout1, i32 0, i32 1
  %_9 = load i32, ptr %12, align 4, !noundef !2
  %self2 = load i32, ptr %layout1, align 4, !range !4, !noundef !2
  store i32 %self2, ptr %_14, align 4
  %_15 = load i32, ptr %_14, align 4, !range !4, !noundef !2
  %_16 = icmp uge i32 %_15, 1
  %_17 = icmp ule i32 %_15, -2147483648
  %_18 = and i1 %_16, %_17
  call void @llvm.assume(i1 %_18)
  call void @__rust_dealloc(ptr %ptr, i32 %_9, i32 %_15) #11
  br label %bb3

bb3:                                              ; preds = %bb1, %bb2
  ret void
}

; <alloc::boxed::Box<T,A> as core::ops::drop::Drop>::drop
; Function Attrs: inlinehint nounwind
define internal void @"_ZN72_$LT$alloc..boxed..Box$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h47c16b3feda3d786E"(ptr align 4 %self) unnamed_addr #1 {
start:
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  %unique = alloca ptr, align 4
  %self1 = alloca ptr, align 4
  %_9 = alloca ptr, align 4
  %layout = alloca { i32, i32 }, align 4
  %ptr = load ptr, ptr %self, align 4, !nonnull !2, !noundef !2
  store i32 4, ptr %1, align 4
  %size = load i32, ptr %1, align 4, !noundef !2
  store i32 4, ptr %0, align 4
  %align = load i32, ptr %0, align 4, !noundef !2
  %2 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  store i32 %size, ptr %2, align 4
  store i32 %align, ptr %layout, align 4
  %3 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  %_5 = load i32, ptr %3, align 4, !noundef !2
  %4 = icmp eq i32 %_5, 0
  br i1 %4, label %bb3, label %bb1

bb3:                                              ; preds = %start
  br label %bb4

bb1:                                              ; preds = %start
  %_8 = getelementptr i8, ptr %self, i32 4
  store ptr %ptr, ptr %self1, align 4
  %_22 = load ptr, ptr %self1, align 4, !noundef !2
  store ptr %_22, ptr %unique, align 4
  %_27 = load ptr, ptr %unique, align 4, !noundef !2
  store ptr %_27, ptr %_9, align 4
  %5 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 0
  %_10.0 = load i32, ptr %5, align 4, !range !4, !noundef !2
  %6 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  %_10.1 = load i32, ptr %6, align 4, !noundef !2
  %7 = load ptr, ptr %_9, align 4, !nonnull !2, !noundef !2
; call <alloc::alloc::Global as core::alloc::Allocator>::deallocate
  call void @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h8ff77c19d8011b67E"(ptr align 1 %_8, ptr %7, i32 %_10.0, i32 %_10.1) #11
  br label %bb4

bb4:                                              ; preds = %bb1, %bb3
  ret void
}

; boxes::main
; Function Attrs: nounwind
define internal void @_ZN5boxes4main17h545208d09810f2ebE() unnamed_addr #2 {
start:
  %b = alloca ptr, align 4
; call alloc::alloc::exchange_malloc
  %_4.i = call ptr @_ZN5alloc5alloc15exchange_malloc17h673cdb9de67d4918E(i32 4, i32 4) #11
  store i32 5, ptr %_4.i, align 4
  store ptr %_4.i, ptr %b, align 4
  %_3 = load ptr, ptr %b, align 4, !noundef !2
  %_5 = ptrtoint ptr %_3 to i32
  %_8 = and i32 %_5, 3
  %_9 = icmp eq i32 %_8, 0
  %0 = call i1 @llvm.expect.i1(i1 %_9, i1 true)
  br i1 %0, label %bb3, label %panic

bb3:                                              ; preds = %start
  %i = load i32, ptr %_3, align 4, !noundef !2
; call core::ptr::drop_in_place<alloc::boxed::Box<i32>>
  call void @"_ZN4core3ptr49drop_in_place$LT$alloc..boxed..Box$LT$i32$GT$$GT$17h8d8751bb811d64a6E"(ptr align 4 %b) #11
  ret void

panic:                                            ; preds = %start
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17ha682d3503e09b4c6E(i32 4, i32 %_5, ptr align 4 @alloc_4f935b52509c9109dcadbf4236f20dd9) #12
  unreachable
}

; std::rt::lang_start_internal
; Function Attrs: nounwind
declare dso_local i32 @_ZN3std2rt19lang_start_internal17he26dd9e71170290bE(ptr align 1, ptr align 4, i32, ptr, i8) unnamed_addr #2

; alloc::alloc::handle_alloc_error
; Function Attrs: cold noreturn nounwind
declare dso_local void @_ZN5alloc5alloc18handle_alloc_error17h65bcaee229518e24E(i32, i32) unnamed_addr #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare hidden void @llvm.assume(i1 noundef) #4

; Function Attrs: nounwind allockind("alloc,uninitialized,aligned") allocsize(0)
declare dso_local noalias ptr @__rust_alloc(i32, i32 allocalign) unnamed_addr #5

; Function Attrs: nounwind allockind("alloc,zeroed,aligned") allocsize(0)
declare dso_local noalias ptr @__rust_alloc_zeroed(i32, i32 allocalign) unnamed_addr #6

; Function Attrs: nounwind allockind("free")
declare dso_local void @__rust_dealloc(ptr allocptr, i32, i32) unnamed_addr #7

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare hidden i1 @llvm.expect.i1(i1, i1) #8

; core::panicking::panic_misaligned_pointer_dereference
; Function Attrs: cold noinline noreturn nounwind
declare dso_local void @_ZN4core9panicking36panic_misaligned_pointer_dereference17ha682d3503e09b4c6E(i32, i32, ptr align 4) unnamed_addr #9

define hidden i32 @__main_void() unnamed_addr #10 {
top:
; call std::rt::lang_start
  %0 = call i32 @_ZN3std2rt10lang_start17h6063c5dd6bb16c7dE(ptr @_ZN5boxes4main17h545208d09810f2ebE, i32 0, ptr null, i8 0)
  ret i32 %0
}

attributes #0 = { noinline nounwind "target-cpu"="generic" }
attributes #1 = { inlinehint nounwind "target-cpu"="generic" }
attributes #2 = { nounwind "target-cpu"="generic" }
attributes #3 = { cold noreturn nounwind "target-cpu"="generic" }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #5 = { nounwind allockind("alloc,uninitialized,aligned") allocsize(0) "alloc-family"="__rust_alloc" "target-cpu"="generic" }
attributes #6 = { nounwind allockind("alloc,zeroed,aligned") allocsize(0) "alloc-family"="__rust_alloc" "target-cpu"="generic" }
attributes #7 = { nounwind allockind("free") "alloc-family"="__rust_alloc" "target-cpu"="generic" }
attributes #8 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #9 = { cold noinline noreturn nounwind "target-cpu"="generic" }
attributes #10 = { "target-cpu"="generic" }
attributes #11 = { nounwind }
attributes #12 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"rustc version 1.76.0-nightly (ba7c7a301 2023-11-13)"}
!1 = !{i32 1824691}
!2 = !{}
!3 = !{i8 0, i8 2}
!4 = !{i32 1, i32 -2147483647}
