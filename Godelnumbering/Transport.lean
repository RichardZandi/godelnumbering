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
import Mathlib.ModelTheory.Syntax

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



/-! ## Sentence encoding/decoding

This section provides tools for encoding first-order sentences as natural numbers
and decoding them back. These functions are generic over any language `L` that has
a `Godel.Numbering` instance for its sentences.

This is particularly useful for:
- Gödel's incompleteness theorems
- Arithmetization of syntax
- Meta-mathematical proofs about formal systems

The encoding/decoding functions form a bijection when a proper `Numbering` instance
exists for `Sentence L`.
-/

open FirstOrder Language

variable {L : Language}

/-- Encode a first-order sentence as a natural number using the provided Gödel numbering.

    Given a sentence `φ` in language `L`, this returns its Gödel number.
    Requires a `Numbering (Sentence L)` instance to be in scope. -/
def encodeSentence [Numbering (Sentence L)] (φ : Sentence L) : ℕ :=
  Numbering.encode φ

/-- Decode a natural number to a first-order sentence using the provided Gödel numbering.

    Given a natural number `n`, this returns the sentence it encodes in language `L`.
    Requires a `Numbering (Sentence L)` instance to be in scope. -/
def decodeSentence [Numbering (Sentence L)] (n : ℕ) : Sentence L :=
  Numbering.decode n

/-- Encoding and decoding are inverse operations: `decodeSentence (encodeSentence φ) = φ`.

    This lemma is marked `@[simp]` for automation in proofs involving sentence encoding. -/
@[simp] lemma decodeSentence_encodeSentence [Numbering (Sentence L)] (φ : Sentence L) :
    decodeSentence (encodeSentence φ) = φ := by
  simp [decodeSentence, encodeSentence, Numbering.decode_encode]


end Godel

#lint
