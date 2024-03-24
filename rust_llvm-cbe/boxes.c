/* Provide Declarations */
#include <stdint.h>
#ifndef __cplusplus
typedef unsigned char bool;
#endif

#ifdef _MSC_VER
#define __builtin_unreachable() __assume(0)
#endif
#ifdef _MSC_VER
#define __noreturn __declspec(noreturn)
#else
#define __noreturn __attribute__((noreturn))
#endif
#ifndef _MSC_VER
#define __forceinline __attribute__((always_inline)) inline
#endif

#if defined(__GNUC__)
#define __HIDDEN__ __attribute__((visibility("hidden")))
#endif

#if defined(__GNUC__)
#define  __ATTRIBUTELIST__(x) __attribute__(x)
#else
#define  __ATTRIBUTELIST__(x)  
#endif

#ifdef _MSC_VER  /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif

#ifdef _MSC_VER
#define __PREFIXALIGN__(X) __declspec(align(X))
#define __POSTFIXALIGN__(X)
#else
#define __PREFIXALIGN__(X)
#define __POSTFIXALIGN__(X) __attribute__((aligned(X)))
#endif



/* Global Declarations */

/* Types Declarations */
struct l_array_2_uint32_t;
struct l_struct_core_KD__KD_ptr_KD__KD_metadata_KD__KD_PtrRepr_MD__LF_u8_NF__OD_;
struct l_array_8_uint8_t;
struct l_unnamed_3;
struct l_unnamed_4;
struct l_array_12_uint8_t;
struct l_unnamed_5;
struct l_unnamed_1;
struct l_unnamed_2;

/* Function definitions */
typedef void l_fptr_1(void);

/* Types Definitions */
struct l_array_2_uint32_t {
  uint32_t array[2];
};
struct l_struct_core_KD__KD_ptr_KD__KD_metadata_KD__KD_PtrRepr_MD__LF_u8_NF__OD_ {
  struct l_array_2_uint32_t field0;
};
struct l_array_8_uint8_t {
  uint8_t array[8];
};
#ifdef _MSC_VER
#pragma pack(push, 1)
#endif
struct l_unnamed_3 {
  void* field0;
  struct l_array_8_uint8_t field1;
  void* field2;
  void* field3;
  void* field4;
} __attribute__ ((packed));
#ifdef _MSC_VER
#pragma pack(pop)
#endif
#ifdef _MSC_VER
#pragma pack(push, 1)
#endif
struct l_unnamed_4 {
  struct l_array_8_uint8_t field0;
} __attribute__ ((packed));
#ifdef _MSC_VER
#pragma pack(pop)
#endif
struct l_array_12_uint8_t {
  uint8_t array[12];
};
#ifdef _MSC_VER
#pragma pack(push, 1)
#endif
struct l_unnamed_5 {
  void* field0;
  struct l_array_12_uint8_t field1;
} __attribute__ ((packed));
#ifdef _MSC_VER
#pragma pack(pop)
#endif
struct l_unnamed_1 {
  void* field0;
  uint32_t field1;
};
struct l_unnamed_2 {
  uint32_t field0;
  uint32_t field1;
};

/* External Global Variable Declarations */
extern uint8_t __rust_no_alloc_shim_is_unstable;

/* Function Declarations */
static void _ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17h0e1bd449a2881db5E(void* llvm_cbe_f) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t _ZN3std2rt10lang_start17h6063c5dd6bb16c7dE(void* llvm_cbe_main, uint32_t llvm_cbe_argc, void* llvm_cbe_argv, uint8_t llvm_cbe_sigpipe) __ATTRIBUTELIST__((noinline, nothrow)) __HIDDEN__;
static uint32_t _ZN3std2rt10lang_start28__EC_u7b_EC__EC_u7b_EC_closure_EC_u7d_EC__EC_u7d_EC_17h4437eb93c05a4498E(void* llvm_cbe__1) __ATTRIBUTELIST__((nothrow));
static uint32_t _ZN4core3ops8function6FnOnce40call_once_EC_u7b_EC__EC_u7b_EC_vtable_OC_shim_EC_u7d_EC__EC_u7d_EC_17h0b12d6c3ba740fcfE(void* llvm_cbe__1) __ATTRIBUTELIST__((nothrow));
static void _ZN4core3ops8function6FnOnce9call_once17h09bc42261fc4b351E(void* llvm_cbe__1) __ATTRIBUTELIST__((nothrow));
static uint32_t _ZN4core3ops8function6FnOnce9call_once17h52363fcca16889e2E(void* _5) __ATTRIBUTELIST__((nothrow));
static void _ZN4core3ptr49drop_in_place_EC_LT_EC_alloc_OC__OC_boxed_OC__OC_Box_EC_LT_EC_i32_EC_GT_EC__EC_GT_EC_17h8d8751bb811d64a6E(void* llvm_cbe__1) __ATTRIBUTELIST__((nothrow));
static void _ZN4core3ptr85drop_in_place_EC_LT_EC_std_OC__OC_rt_OC__OC_lang_start_EC_LT_EC__EC_LP_EC__EC_RP_EC__EC_GT_EC__OC__OC__EC_u7b_EC__EC_u7b_EC_closure_EC_u7d_EC__EC_u7d_EC__EC_GT_EC_17h11de64221d424f3eE(void* llvm_cbe__1) __ATTRIBUTELIST__((nothrow));
static bool _ZN54__EC_LT_EC__EC_LP_EC__EC_RP_EC__EC_u20_EC_as_EC_u20_EC_std_OC__OC_process_OC__OC_Termination_EC_GT_EC_6report17h6c426b0ce673a3bbE(void) __ATTRIBUTELIST__((nothrow));
static void* _ZN5alloc5alloc15exchange_malloc17h673cdb9de67d4918E(uint32_t llvm_cbe_size, uint32_t llvm_cbe_align) __ATTRIBUTELIST__((nothrow));
static struct l_unnamed_1 _ZN5alloc5alloc6Global10alloc_impl17h1a7c59c9ce8aa94fE(void* llvm_cbe_self, uint32_t _12, uint32_t _13, bool llvm_cbe_zeroed) __ATTRIBUTELIST__((nothrow));
static void _ZN63__EC_LT_EC_alloc_OC__OC_alloc_OC__OC_Global_EC_u20_EC_as_EC_u20_EC_core_OC__OC_alloc_OC__OC_Allocator_EC_GT_EC_10deallocate17h8ff77c19d8011b67E(void* llvm_cbe_self, void* llvm_cbe_ptr, uint32_t _38, uint32_t _39) __ATTRIBUTELIST__((nothrow));
static void _ZN72__EC_LT_EC_alloc_OC__OC_boxed_OC__OC_Box_EC_LT_EC_T_EC_C_EC_A_EC_GT_EC__EC_u20_EC_as_EC_u20_EC_core_OC__OC_ops_OC__OC_drop_OC__OC_Drop_EC_GT_EC_4drop17h47c16b3feda3d786E(void* llvm_cbe_self) __ATTRIBUTELIST__((nothrow));
static void _ZN5boxes4main17h545208d09810f2ebE(void) __ATTRIBUTELIST__((nothrow));
uint32_t _ZN3std2rt19lang_start_internal17he26dd9e71170290bE(void* _46, void* _47, uint32_t _48, void* _49, uint8_t _50) __ATTRIBUTELIST__((nothrow));
__noreturn void _ZN5alloc5alloc18handle_alloc_error17h65bcaee229518e24E(uint32_t _51, uint32_t _52) __ATTRIBUTELIST__((cold, nothrow));
void* __rust_alloc(uint32_t _53, uint32_t _54) __ATTRIBUTELIST__((nothrow, alloc_size(0)));
void* __rust_alloc_zeroed(uint32_t _55, uint32_t _56) __ATTRIBUTELIST__((nothrow, alloc_size(0)));
void __rust_dealloc(void* _57, uint32_t _58, uint32_t _59) __ATTRIBUTELIST__((nothrow));
__noreturn void _ZN4core9panicking36panic_misaligned_pointer_dereference17ha682d3503e09b4c6E(uint32_t _60, uint32_t _61, void* _62) __ATTRIBUTELIST__((cold, noinline, nothrow));
uint32_t __main_void(void) __HIDDEN__;


/* Global Variable Definitions and Initialization */
static const __PREFIXALIGN__(4) struct l_unnamed_3 vtable_OC_0 __POSTFIXALIGN__(4) = { ((void*)&_ZN4core3ptr85drop_in_place_EC_LT_EC_std_OC__OC_rt_OC__OC_lang_start_EC_LT_EC__EC_LP_EC__EC_RP_EC__EC_GT_EC__OC__OC__EC_u7b_EC__EC_u7b_EC_closure_EC_u7d_EC__EC_u7d_EC__EC_GT_EC_17h11de64221d424f3eE), { "\x04\x00\x00\x00\x04\x00\x00" }, ((void*)&_ZN4core3ops8function6FnOnce40call_once_EC_u7b_EC__EC_u7b_EC_vtable_OC_shim_EC_u7d_EC__EC_u7d_EC_17h0b12d6c3ba740fcfE), ((void*)&_ZN3std2rt10lang_start28__EC_u7b_EC__EC_u7b_EC_closure_EC_u7d_EC__EC_u7d_EC_17h4437eb93c05a4498E), ((void*)&_ZN3std2rt10lang_start28__EC_u7b_EC__EC_u7b_EC_closure_EC_u7d_EC__EC_u7d_EC_17h4437eb93c05a4498E) };
static const char /* (empty) */ alloc_38a9d1c1fccd92e612dd2762da060982;
static const struct l_unnamed_4 alloc_618cf91eca10cc36ac98c66c3d77169c = { { "boxes.rs" } };
static const __PREFIXALIGN__(4) struct l_unnamed_5 alloc_4f935b52509c9109dcadbf4236f20dd9 __POSTFIXALIGN__(4) = { (&alloc_618cf91eca10cc36ac98c66c3d77169c), { "\x08\x00\x00\x00\x05\x00\x00\x00\r\x00\x00" } };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_select_u32(bool condition, uint32_t iftrue, uint32_t ifnot) {
  uint32_t r;
  r = condition ? iftrue : ifnot;
  return r;
}
static __forceinline struct l_unnamed_1 llvm_ctor_unnamed_1(void* x0, uint32_t x1) {
  struct l_unnamed_1 r;
  r.field0 = x0;
  r.field1 = x1;
  return r;
}


/* Function Bodies */

static void _ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17h0e1bd449a2881db5E(void* llvm_cbe_f) {
  _ZN4core3ops8function6FnOnce9call_once17h09bc42261fc4b351E(llvm_cbe_f);
  __asm__ volatile (""
        :
        :);
}


uint32_t _ZN3std2rt10lang_start17h6063c5dd6bb16c7dE(void* llvm_cbe_main, uint32_t llvm_cbe_argc, void* llvm_cbe_argv, uint8_t llvm_cbe_sigpipe) {
  void* llvm_cbe__8;    /* Address-exposed local */
  uint32_t llvm_cbe__5;    /* Address-exposed local */
  uint32_t _1;
  uint32_t llvm_cbe_v;

  llvm_cbe__8 = llvm_cbe_main;
  _1 = _ZN3std2rt19lang_start_internal17he26dd9e71170290bE((&llvm_cbe__8), (&vtable_OC_0), llvm_cbe_argc, llvm_cbe_argv, llvm_cbe_sigpipe);
  llvm_cbe__5 = _1;
  llvm_cbe_v = llvm_cbe__5;
  return llvm_cbe_v;
}


static uint32_t _ZN3std2rt10lang_start28__EC_u7b_EC__EC_u7b_EC_closure_EC_u7d_EC__EC_u7d_EC_17h4437eb93c05a4498E(void* llvm_cbe__1) {
  uint8_t llvm_cbe_self;    /* Address-exposed local */
  void* llvm_cbe__4;
  bool _2;
  uint8_t _3;

  llvm_cbe__4 = *(void**)llvm_cbe__1;
  _ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17h0e1bd449a2881db5E(llvm_cbe__4);
  _2 = _ZN54__EC_LT_EC__EC_LP_EC__EC_RP_EC__EC_u20_EC_as_EC_u20_EC_std_OC__OC_process_OC__OC_Termination_EC_GT_EC_6report17h6c426b0ce673a3bbE();
  llvm_cbe_self = (((uint8_t)(bool)_2));
  _3 = llvm_cbe_self;
  return (((uint32_t)(bool)(((bool)_3&1u))));
}


static uint32_t _ZN4core3ops8function6FnOnce40call_once_EC_u7b_EC__EC_u7b_EC_vtable_OC_shim_EC_u7d_EC__EC_u7d_EC_17h0b12d6c3ba740fcfE(void* llvm_cbe__1) {
  char /* (empty) */ llvm_cbe__2;    /* Address-exposed local */
  void* _4;
  uint32_t llvm_cbe__0;

  _4 = *(void**)llvm_cbe__1;
  llvm_cbe__0 = _ZN4core3ops8function6FnOnce9call_once17h52363fcca16889e2E(_4);
  return llvm_cbe__0;
}


static void _ZN4core3ops8function6FnOnce9call_once17h09bc42261fc4b351E(void* llvm_cbe__1) {
  char /* (empty) */ llvm_cbe__2;    /* Address-exposed local */

  ((l_fptr_1*)(void*)llvm_cbe__1)();
}


static uint32_t _ZN4core3ops8function6FnOnce9call_once17h52363fcca16889e2E(void* _5) {
  char /* (empty) */ llvm_cbe__2;    /* Address-exposed local */
  void* llvm_cbe__1;    /* Address-exposed local */
  uint32_t llvm_cbe__0;

  llvm_cbe__1 = _5;
  llvm_cbe__0 = _ZN3std2rt10lang_start28__EC_u7b_EC__EC_u7b_EC_closure_EC_u7d_EC__EC_u7d_EC_17h4437eb93c05a4498E((&llvm_cbe__1));
  return llvm_cbe__0;
}


static void _ZN4core3ptr49drop_in_place_EC_LT_EC_alloc_OC__OC_boxed_OC__OC_Box_EC_LT_EC_i32_EC_GT_EC__EC_GT_EC_17h8d8751bb811d64a6E(void* llvm_cbe__1) {
  void* llvm_cbe__6;

  llvm_cbe__6 = *(void**)llvm_cbe__1;
  _ZN72__EC_LT_EC_alloc_OC__OC_boxed_OC__OC_Box_EC_LT_EC_T_EC_C_EC_A_EC_GT_EC__EC_u20_EC_as_EC_u20_EC_core_OC__OC_ops_OC__OC_drop_OC__OC_Drop_EC_GT_EC_4drop17h47c16b3feda3d786E(llvm_cbe__1);
}


static void _ZN4core3ptr85drop_in_place_EC_LT_EC_std_OC__OC_rt_OC__OC_lang_start_EC_LT_EC__EC_LP_EC__EC_RP_EC__EC_GT_EC__OC__OC__EC_u7b_EC__EC_u7b_EC_closure_EC_u7d_EC__EC_u7d_EC__EC_GT_EC_17h11de64221d424f3eE(void* llvm_cbe__1) {
  return;
}


static bool _ZN54__EC_LT_EC__EC_LP_EC__EC_RP_EC__EC_u20_EC_as_EC_u20_EC_std_OC__OC_process_OC__OC_Termination_EC_GT_EC_6report17h6c426b0ce673a3bbE(void) {
  return 0;
}


static void* _ZN5alloc5alloc15exchange_malloc17h673cdb9de67d4918E(uint32_t llvm_cbe_size, uint32_t llvm_cbe_align) {
  void* llvm_cbe_self;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe__4;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_layout;    /* Address-exposed local */
  uint32_t _6;
  uint32_t _7;
  struct l_unnamed_1 _8;
  void* _9;
  void* llvm_cbe_ptr_2e_0;
  uint32_t llvm_cbe_ptr_2e_1;
  void* llvm_cbe__16;
  uint32_t _10;
  uint32_t _11;

  *(uint32_t*)(((&(&llvm_cbe_layout)->field1))) = llvm_cbe_size;
  *((uint32_t*)&llvm_cbe_layout) = llvm_cbe_align;
  _6 = *(uint32_t*)(((&(&llvm_cbe_layout)->field0)));
  _7 = *(uint32_t*)(((&(&llvm_cbe_layout)->field1)));
  _8 = _ZN5alloc5alloc6Global10alloc_impl17h1a7c59c9ce8aa94fE(((void*)&alloc_38a9d1c1fccd92e612dd2762da060982), _6, _7, 0);
  llvm_cbe__4 = _8;
  _9 = *((void**)&llvm_cbe__4);
  if (((llvm_select_u32(((((uint32_t)(uintptr_t)_9)) == 0u), 1, 0)) == 0u)) {
    goto llvm_cbe_bb3;
  } else {
    goto llvm_cbe_bb1;
  }

llvm_cbe_bb3:
  llvm_cbe_ptr_2e_0 = *(void**)(((&(&llvm_cbe__4)->field0)));
  llvm_cbe_ptr_2e_1 = *(uint32_t*)(((&(&llvm_cbe__4)->field1)));
  llvm_cbe_self = llvm_cbe_ptr_2e_0;
  llvm_cbe__16 = llvm_cbe_self;
  return llvm_cbe__16;
llvm_cbe_bb1:
  _10 = *(uint32_t*)(((&(&llvm_cbe_layout)->field0)));
  _11 = *(uint32_t*)(((&(&llvm_cbe_layout)->field1)));
  _ZN5alloc5alloc18handle_alloc_error17h65bcaee229518e24E(_10, _11);
  __builtin_unreachable();

}


static struct l_unnamed_1 _ZN5alloc5alloc6Global10alloc_impl17h1a7c59c9ce8aa94fE(void* llvm_cbe_self, uint32_t _12, uint32_t _13, bool llvm_cbe_zeroed) {
  uint8_t _14;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe__76;    /* Address-exposed local */
  struct l_struct_core_KD__KD_ptr_KD__KD_metadata_KD__KD_PtrRepr_MD__LF_u8_NF__OD_ llvm_cbe__75;    /* Address-exposed local */
  void* llvm_cbe__62;    /* Address-exposed local */
  uint32_t llvm_cbe__57;    /* Address-exposed local */
  uint32_t llvm_cbe__43;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe__34;    /* Address-exposed local */
  struct l_struct_core_KD__KD_ptr_KD__KD_metadata_KD__KD_PtrRepr_MD__LF_u8_NF__OD_ llvm_cbe__33;    /* Address-exposed local */
  uint32_t llvm_cbe__22;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe__18;    /* Address-exposed local */
  void* llvm_cbe_self4;    /* Address-exposed local */
  void* llvm_cbe_self3;    /* Address-exposed local */
  void* llvm_cbe__12;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_layout2;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_layout1;    /* Address-exposed local */
  void* llvm_cbe_raw_ptr;    /* Address-exposed local */
  void* llvm_cbe_data;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe__6;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe__0;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_layout;    /* Address-exposed local */
  uint32_t llvm_cbe_size;
  uint32_t llvm_cbe_self5;
  uint32_t llvm_cbe__23;
  bool llvm_cbe__26;
  void* llvm_cbe__31;
  void* _15;
  uint32_t _16;
  void* llvm_cbe_ptr_2e_0;
  uint32_t llvm_cbe_ptr_2e_1;
  void* _17;
  uint32_t _18;
  void* _19;
  uint32_t _20;
  struct l_unnamed_1 _21;
  struct l_unnamed_1 _22;
  uint32_t _23;
  uint32_t _24;
  uint8_t _25;
  uint8_t llvm_cbe__48;
  uint32_t llvm_cbe__51;
  uint32_t llvm_cbe_self6;
  uint32_t llvm_cbe__58;
  bool llvm_cbe__61;
  void* _26;
  uint32_t _27;
  uint32_t _28;
  uint32_t llvm_cbe__38;
  uint32_t llvm_cbe_self7;
  uint32_t llvm_cbe__44;
  bool llvm_cbe__47;
  void* _29;
  void* llvm_cbe_ptr8;
  void* _30;
  void* _31;
  void* llvm_cbe_v;
  void* _32;
  void* llvm_cbe_v9;
  void* _33;
  void* llvm_cbe_ptr10;
  void* _34;
  uint32_t _35;
  void* llvm_cbe_ptr_2e_011;
  uint32_t llvm_cbe_ptr_2e_112;
  void* _36;
  uint32_t _37;

  *(uint32_t*)(((&(&llvm_cbe_layout)->field0))) = _12;
  *(uint32_t*)(((&(&llvm_cbe_layout)->field1))) = _13;
  llvm_cbe_size = *(uint32_t*)(((&(&llvm_cbe_layout)->field1)));
  if ((llvm_cbe_size == 0u)) {
    goto llvm_cbe_bb2;
  } else {
    goto llvm_cbe_bb1;
  }

llvm_cbe_bb2:
  llvm_cbe_self5 = *((uint32_t*)&llvm_cbe_layout);
  llvm_cbe__22 = llvm_cbe_self5;
  llvm_cbe__23 = llvm_cbe__22;
  llvm_cbe__26 = (((uint32_t)llvm_cbe__23) >= ((uint32_t)1u)) & (((uint32_t)llvm_cbe__23) <= ((uint32_t)2147483648u));
  llvm_cbe_data = (((void*)(uintptr_t)llvm_cbe__23));
  llvm_cbe__31 = llvm_cbe_data;
  *((void**)&llvm_cbe__34) = llvm_cbe__31;
  *(uint32_t*)(((&(&llvm_cbe__34)->field1))) = 0;
  _15 = *(void**)(((&(&llvm_cbe__34)->field0)));
  _16 = *(uint32_t*)(((&(&llvm_cbe__34)->field1)));
  *(void**)(((&(&llvm_cbe__33)->field0))) = _15;
  *(uint32_t*)(((&(&llvm_cbe__33)->field1))) = _16;
  llvm_cbe_ptr_2e_0 = *(void**)(((&(&llvm_cbe__33)->field0)));
  llvm_cbe_ptr_2e_1 = *(uint32_t*)(((&(&llvm_cbe__33)->field1)));
  *(void**)(((&(&llvm_cbe__6)->field0))) = llvm_cbe_ptr_2e_0;
  *(uint32_t*)(((&(&llvm_cbe__6)->field1))) = llvm_cbe_ptr_2e_1;
  _17 = *(void**)(((&(&llvm_cbe__6)->field0)));
  _18 = *(uint32_t*)(((&(&llvm_cbe__6)->field1)));
  *(void**)(((&(&llvm_cbe__0)->field0))) = _17;
  *(uint32_t*)(((&(&llvm_cbe__0)->field1))) = _18;
  goto llvm_cbe_bb11;

llvm_cbe_bb1:
  if (llvm_cbe_zeroed) {
    goto llvm_cbe_bb3;
  } else {
    goto llvm_cbe_bb4;
  }

llvm_cbe_bb11:
  _19 = *(void**)(((&(&llvm_cbe__0)->field0)));
  _20 = *(uint32_t*)(((&(&llvm_cbe__0)->field1)));
  _21 = llvm_ctor_unnamed_1(((void*)/*NULL*/0), 0);
  _21.field0 = _19;
  _22 = _21;
  _22.field1 = _20;
  return _22;
llvm_cbe_bb4:
  _23 = *(uint32_t*)(((&(&llvm_cbe_layout)->field0)));
  _24 = *(uint32_t*)(((&(&llvm_cbe_layout)->field1)));
  *(uint32_t*)(((&(&llvm_cbe_layout2)->field0))) = _23;
  *(uint32_t*)(((&(&llvm_cbe_layout2)->field1))) = _24;
  _25 = *(volatile uint8_t*)(&__rust_no_alloc_shim_is_unstable);
  _14 = _25;
  llvm_cbe__48 = _14;
  llvm_cbe__51 = *(uint32_t*)(((&(&llvm_cbe_layout2)->field1)));
  llvm_cbe_self6 = *((uint32_t*)&llvm_cbe_layout2);
  llvm_cbe__57 = llvm_cbe_self6;
  llvm_cbe__58 = llvm_cbe__57;
  llvm_cbe__61 = (((uint32_t)llvm_cbe__58) >= ((uint32_t)1u)) & (((uint32_t)llvm_cbe__58) <= ((uint32_t)2147483648u));
  _26 = __rust_alloc(llvm_cbe__51, llvm_cbe__58);
  llvm_cbe_raw_ptr = _26;
  goto llvm_cbe_bb5;

llvm_cbe_bb3:
  _27 = *(uint32_t*)(((&(&llvm_cbe_layout)->field0)));
  _28 = *(uint32_t*)(((&(&llvm_cbe_layout)->field1)));
  *(uint32_t*)(((&(&llvm_cbe_layout1)->field0))) = _27;
  *(uint32_t*)(((&(&llvm_cbe_layout1)->field1))) = _28;
  llvm_cbe__38 = *(uint32_t*)(((&(&llvm_cbe_layout1)->field1)));
  llvm_cbe_self7 = *((uint32_t*)&llvm_cbe_layout1);
  llvm_cbe__43 = llvm_cbe_self7;
  llvm_cbe__44 = llvm_cbe__43;
  llvm_cbe__47 = (((uint32_t)llvm_cbe__44) >= ((uint32_t)1u)) & (((uint32_t)llvm_cbe__44) <= ((uint32_t)2147483648u));
  _29 = __rust_alloc_zeroed(llvm_cbe__38, llvm_cbe__44);
  llvm_cbe_raw_ptr = _29;
  goto llvm_cbe_bb5;

llvm_cbe_bb5:
  llvm_cbe_ptr8 = llvm_cbe_raw_ptr;
  if (((((uint32_t)(uintptr_t)llvm_cbe_ptr8)) == 0u)) {
    goto llvm_cbe_bb15;
  } else {
    goto llvm_cbe_bb16;
  }

llvm_cbe_bb15:
  llvm_cbe_self4 = ((void*)/*NULL*/0);
  goto llvm_cbe_bb6;

llvm_cbe_bb16:
  llvm_cbe__62 = llvm_cbe_ptr8;
  _30 = llvm_cbe__62;
  llvm_cbe_self4 = _30;
  goto llvm_cbe_bb6;

llvm_cbe_bb6:
  _31 = llvm_cbe_self4;
  if (((llvm_select_u32(((((uint32_t)(uintptr_t)_31)) == 0u), 0, 1)) == 0u)) {
    goto llvm_cbe_bb17;
  } else {
    goto llvm_cbe_bb18;
  }

llvm_cbe_bb17:
  llvm_cbe_self3 = ((void*)/*NULL*/0);
  goto llvm_cbe_bb19;

llvm_cbe_bb18:
  llvm_cbe_v = llvm_cbe_self4;
  llvm_cbe_self3 = llvm_cbe_v;
  goto llvm_cbe_bb19;

llvm_cbe_bb19:
  _32 = llvm_cbe_self3;
  if (((llvm_select_u32(((((uint32_t)(uintptr_t)_32)) == 0u), 1, 0)) == 0u)) {
    goto llvm_cbe_bb21;
  } else {
    goto llvm_cbe_bb20;
  }

llvm_cbe_bb21:
  llvm_cbe_v9 = llvm_cbe_self3;
  llvm_cbe__12 = llvm_cbe_v9;
  goto llvm_cbe_bb7;

llvm_cbe_bb20:
  llvm_cbe__12 = ((void*)/*NULL*/0);
  goto llvm_cbe_bb7;

llvm_cbe_bb7:
  _33 = llvm_cbe__12;
  if (((llvm_select_u32(((((uint32_t)(uintptr_t)_33)) == 0u), 1, 0)) == 0u)) {
    goto llvm_cbe_bb8;
  } else {
    goto llvm_cbe_bb10;
  }

llvm_cbe_bb8:
  llvm_cbe_ptr10 = llvm_cbe__12;
  *((void**)&llvm_cbe__76) = llvm_cbe_ptr10;
  *(uint32_t*)(((&(&llvm_cbe__76)->field1))) = llvm_cbe_size;
  _34 = *(void**)(((&(&llvm_cbe__76)->field0)));
  _35 = *(uint32_t*)(((&(&llvm_cbe__76)->field1)));
  *(void**)(((&(&llvm_cbe__75)->field0))) = _34;
  *(uint32_t*)(((&(&llvm_cbe__75)->field1))) = _35;
  llvm_cbe_ptr_2e_011 = *(void**)(((&(&llvm_cbe__75)->field0)));
  llvm_cbe_ptr_2e_112 = *(uint32_t*)(((&(&llvm_cbe__75)->field1)));
  *(void**)(((&(&llvm_cbe__18)->field0))) = llvm_cbe_ptr_2e_011;
  *(uint32_t*)(((&(&llvm_cbe__18)->field1))) = llvm_cbe_ptr_2e_112;
  _36 = *(void**)(((&(&llvm_cbe__18)->field0)));
  _37 = *(uint32_t*)(((&(&llvm_cbe__18)->field1)));
  *(void**)(((&(&llvm_cbe__0)->field0))) = _36;
  *(uint32_t*)(((&(&llvm_cbe__0)->field1))) = _37;
  goto llvm_cbe_bb11;

llvm_cbe_bb10:
  *((void**)&llvm_cbe__0) = ((void*)/*NULL*/0);
  goto llvm_cbe_bb11;

}


static void _ZN63__EC_LT_EC_alloc_OC__OC_alloc_OC__OC_Global_EC_u20_EC_as_EC_u20_EC_core_OC__OC_alloc_OC__OC_Allocator_EC_GT_EC_10deallocate17h8ff77c19d8011b67E(void* llvm_cbe_self, void* llvm_cbe_ptr, uint32_t _38, uint32_t _39) {
  uint32_t llvm_cbe__14;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_layout1;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_layout;    /* Address-exposed local */
  uint32_t llvm_cbe__4;
  uint32_t _40;
  uint32_t _41;
  uint32_t llvm_cbe__9;
  uint32_t llvm_cbe_self2;
  uint32_t llvm_cbe__15;
  bool llvm_cbe__18;

  *(uint32_t*)(((&(&llvm_cbe_layout)->field0))) = _38;
  *(uint32_t*)(((&(&llvm_cbe_layout)->field1))) = _39;
  llvm_cbe__4 = *(uint32_t*)(((&(&llvm_cbe_layout)->field1)));
  if ((llvm_cbe__4 == 0u)) {
    goto llvm_cbe_bb2;
  } else {
    goto llvm_cbe_bb1;
  }

llvm_cbe_bb2:
  goto llvm_cbe_bb3;

llvm_cbe_bb1:
  _40 = *(uint32_t*)(((&(&llvm_cbe_layout)->field0)));
  _41 = *(uint32_t*)(((&(&llvm_cbe_layout)->field1)));
  *(uint32_t*)(((&(&llvm_cbe_layout1)->field0))) = _40;
  *(uint32_t*)(((&(&llvm_cbe_layout1)->field1))) = _41;
  llvm_cbe__9 = *(uint32_t*)(((&(&llvm_cbe_layout1)->field1)));
  llvm_cbe_self2 = *((uint32_t*)&llvm_cbe_layout1);
  llvm_cbe__14 = llvm_cbe_self2;
  llvm_cbe__15 = llvm_cbe__14;
  llvm_cbe__18 = (((uint32_t)llvm_cbe__15) >= ((uint32_t)1u)) & (((uint32_t)llvm_cbe__15) <= ((uint32_t)2147483648u));
  __rust_dealloc(llvm_cbe_ptr, llvm_cbe__9, llvm_cbe__15);
  goto llvm_cbe_bb3;

llvm_cbe_bb3:
  return;
}


static void _ZN72__EC_LT_EC_alloc_OC__OC_boxed_OC__OC_Box_EC_LT_EC_T_EC_C_EC_A_EC_GT_EC__EC_u20_EC_as_EC_u20_EC_core_OC__OC_ops_OC__OC_drop_OC__OC_Drop_EC_GT_EC_4drop17h47c16b3feda3d786E(void* llvm_cbe_self) {
  uint32_t _42;    /* Address-exposed local */
  uint32_t _43;    /* Address-exposed local */
  void* llvm_cbe_unique;    /* Address-exposed local */
  void* llvm_cbe_self1;    /* Address-exposed local */
  void* llvm_cbe__9;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_layout;    /* Address-exposed local */
  void* llvm_cbe_ptr;
  uint32_t llvm_cbe_size;
  uint32_t llvm_cbe_align;
  uint32_t llvm_cbe__5;
  void* llvm_cbe__22;
  void* llvm_cbe__27;
  uint32_t llvm_cbe__10_2e_0;
  uint32_t llvm_cbe__10_2e_1;
  void* _44;

  llvm_cbe_ptr = *(void**)llvm_cbe_self;
  _43 = 4;
  llvm_cbe_size = _43;
  _42 = 4;
  llvm_cbe_align = _42;
  *(uint32_t*)(((&(&llvm_cbe_layout)->field1))) = llvm_cbe_size;
  *((uint32_t*)&llvm_cbe_layout) = llvm_cbe_align;
  llvm_cbe__5 = *(uint32_t*)(((&(&llvm_cbe_layout)->field1)));
  if ((llvm_cbe__5 == 0u)) {
    goto llvm_cbe_bb3;
  } else {
    goto llvm_cbe_bb1;
  }

llvm_cbe_bb3:
  goto llvm_cbe_bb4;

llvm_cbe_bb1:
  llvm_cbe_self1 = llvm_cbe_ptr;
  llvm_cbe__22 = llvm_cbe_self1;
  llvm_cbe_unique = llvm_cbe__22;
  llvm_cbe__27 = llvm_cbe_unique;
  llvm_cbe__9 = llvm_cbe__27;
  llvm_cbe__10_2e_0 = *(uint32_t*)(((&(&llvm_cbe_layout)->field0)));
  llvm_cbe__10_2e_1 = *(uint32_t*)(((&(&llvm_cbe_layout)->field1)));
  _44 = llvm_cbe__9;
  _ZN63__EC_LT_EC_alloc_OC__OC_alloc_OC__OC_Global_EC_u20_EC_as_EC_u20_EC_core_OC__OC_alloc_OC__OC_Allocator_EC_GT_EC_10deallocate17h8ff77c19d8011b67E((((&((uint8_t*)llvm_cbe_self)[((int32_t)4)]))), _44, llvm_cbe__10_2e_0, llvm_cbe__10_2e_1);
  goto llvm_cbe_bb4;

llvm_cbe_bb4:
  return;
}


static void _ZN5boxes4main17h545208d09810f2ebE(void) {
  void* llvm_cbe_b;    /* Address-exposed local */
  void* llvm_cbe__4_2e_i;
  void* llvm_cbe__3;
  uint32_t llvm_cbe__5;
  uint32_t llvm_cbe_i;

  llvm_cbe__4_2e_i = _ZN5alloc5alloc15exchange_malloc17h673cdb9de67d4918E(4, 4);
  *(uint32_t*)llvm_cbe__4_2e_i = 5;
  llvm_cbe_b = llvm_cbe__4_2e_i;
  llvm_cbe__3 = llvm_cbe_b;
  llvm_cbe__5 = ((uint32_t)(uintptr_t)llvm_cbe__3);
  if (((llvm_cbe__5 & 3) == 0u)) {
    goto llvm_cbe_bb3;
  } else {
    goto llvm_cbe_panic;
  }

llvm_cbe_bb3:
  llvm_cbe_i = *(uint32_t*)llvm_cbe__3;
  _ZN4core3ptr49drop_in_place_EC_LT_EC_alloc_OC__OC_boxed_OC__OC_Box_EC_LT_EC_i32_EC_GT_EC__EC_GT_EC_17h8d8751bb811d64a6E((&llvm_cbe_b));
  return;
llvm_cbe_panic:
  _ZN4core9panicking36panic_misaligned_pointer_dereference17ha682d3503e09b4c6E(4, llvm_cbe__5, (&alloc_4f935b52509c9109dcadbf4236f20dd9));
  __builtin_unreachable();

}


uint32_t __main_void(void) {
  uint32_t _45;

  _45 = _ZN3std2rt10lang_start17h6063c5dd6bb16c7dE(((void*)&_ZN5boxes4main17h545208d09810f2ebE), 0, ((void*)/*NULL*/0), 0);
  return _45;
}

