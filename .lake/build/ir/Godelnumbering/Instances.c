// Lean compiler output
// Module: Godelnumbering.Instances
// Imports: Init Mathlib.Computability.Primrec Mathlib.Computability.Partrec Godelnumbering.Godel
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
static lean_object* l_Godel_instNumberingNat___closed__2;
LEAN_EXPORT lean_object* l_Godel_instNumberingNat;
lean_object* l_id___rarg___boxed(lean_object*);
static lean_object* l_Godel_instNumberingNat___closed__1;
static lean_object* _init_l_Godel_instNumberingNat___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_id___rarg___boxed), 1, 0);
return x_1;
}
}
static lean_object* _init_l_Godel_instNumberingNat___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_Godel_instNumberingNat___closed__1;
x_2 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_2, 0, x_1);
lean_ctor_set(x_2, 1, x_1);
return x_2;
}
}
static lean_object* _init_l_Godel_instNumberingNat() {
_start:
{
lean_object* x_1; 
x_1 = l_Godel_instNumberingNat___closed__2;
return x_1;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib_Computability_Primrec(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib_Computability_Partrec(uint8_t builtin, lean_object*);
lean_object* initialize_Godelnumbering_Godel(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_Godelnumbering_Instances(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib_Computability_Primrec(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib_Computability_Partrec(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Godelnumbering_Godel(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_Godel_instNumberingNat___closed__1 = _init_l_Godel_instNumberingNat___closed__1();
lean_mark_persistent(l_Godel_instNumberingNat___closed__1);
l_Godel_instNumberingNat___closed__2 = _init_l_Godel_instNumberingNat___closed__2();
lean_mark_persistent(l_Godel_instNumberingNat___closed__2);
l_Godel_instNumberingNat = _init_l_Godel_instNumberingNat();
lean_mark_persistent(l_Godel_instNumberingNat);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
