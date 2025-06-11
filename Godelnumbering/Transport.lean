/-
Godelnumbering/Transport.lean
-----------------------------

Tools for running `Nat.Partrec.Code` programs on *any* Gödel-encoded
type.

This file is deliberately application-agnostic: once you
import Godelnumbering.Transport you get

* `numToCode : ℕ → Code`   — a **total** numeric decoder
* `transportEval : ℕ → α → Part α` — evaluate a numeric program on any
  type `α` that has a `Godel.Numbering`

No `sorry`s, and only mathlib dependencies.
-/

import Mathlib.Computability.PartrecCode
import Godelnumbering.Godel

open Classical
open Nat.Partrec   -- brings `Code`, `Code.eval`, `Code.const` into scope

namespace Godel

/-! ## Constant codes -/

/- Evaluating a *constant* code always yields that constant.
@[simp] lemma eval_const (n x : ℕ) :
    Code.eval (Code.const n) x = Part.some n := by
  simp [Code.eval, Code.const]
-/

/-- The map `n ↦ Code.const n` is computable. -/
lemma computable_const : Computable Code.const := by
  exact (Nat.Partrec.Code.primrec_const).to_comp


/-! ## Total numeric decoder -/

/-- A **total** decoder `ℕ → Code`.

If `n` is already the Gödel number of a `Code`, we return that `Code`;
otherwise we default to `Code.const n`. -/
def numToCode (n : ℕ) : Code :=
  (Encodable.decode (α := Code) n).getD (Code.const n)

/-- Encoding is left-inverse to `numToCode`. -/
@[simp] lemma numToCode_encode (c : Code) :
    numToCode (Encodable.encode c) = c := by
  simp [numToCode]


/-! ## Transporting the evaluator -/

/-- Run the numeric program `idx` on the Gödel-encoded value `a`.

The result is partial (`Part α`) for the same reason that
`Code.eval` is partial. -/
def transportEval {α} [Numbering α] (idx : ℕ) (a : α) : Part α :=
  (Code.eval (numToCode idx) (Numbering.encode a)).map Numbering.decode

end Godel

#lint
