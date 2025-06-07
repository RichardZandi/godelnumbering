// Lean compiler output
// Module: Godelnumbering.Transport
// Imports: Init Mathlib.Computability.PartrecCode Godelnumbering.Godel
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
lean_object* l_Nat_Partrec_Code_const(lean_object*);
LEAN_EXPORT lean_object* l_Godel_numToCode(lean_object*);
LEAN_EXPORT lean_object* l_Godel_transportEval(lean_object*);
LEAN_EXPORT lean_object* l_Godel_transportEval___rarg(lean_object*, lean_object*, lean_object*);
lean_object* l_Part_map___elambda__1___rarg___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_Nat_Partrec_Code_eval(lean_object*, lean_object*);
extern lean_object* l_Nat_Partrec_Code_instDenumerable;
LEAN_EXPORT lean_object* l_Godel_numToCode(lean_object* x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_2 = l_Nat_Partrec_Code_instDenumerable;
x_3 = lean_ctor_get(x_2, 1);
lean_inc(x_3);
lean_inc(x_1);
x_4 = lean_apply_1(x_3, x_1);
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_5; 
x_5 = l_Nat_Partrec_Code_const(x_1);
lean_dec(x_1);
return x_5;
}
else
{
lean_object* x_6; 
lean_dec(x_1);
x_6 = lean_ctor_get(x_4, 0);
lean_inc(x_6);
lean_dec(x_4);
return x_6;
}
}
}
LEAN_EXPORT lean_object* l_Godel_transportEval___rarg(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; 
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
x_5 = l_Godel_numToCode(x_2);
x_6 = lean_ctor_get(x_1, 0);
lean_inc(x_6);
lean_dec(x_1);
x_7 = lean_apply_1(x_6, x_3);
x_8 = l_Nat_Partrec_Code_eval(x_5, x_7);
lean_inc(x_8);
x_9 = lean_alloc_closure((void*)(l_Part_map___elambda__1___rarg___boxed), 4, 3);
lean_closure_set(x_9, 0, x_4);
lean_closure_set(x_9, 1, x_8);
lean_closure_set(x_9, 2, x_8);
return x_9;
}
}
LEAN_EXPORT lean_object* l_Godel_transportEval(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_Godel_transportEval___rarg), 3, 0);
return x_2;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib_Computability_PartrecCode(uint8_t builtin, lean_object*);
lean_object* initialize_Godelnumbering_Godel(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_Godelnumbering_Transport(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib_Computability_PartrecCode(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Godelnumbering_Godel(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
