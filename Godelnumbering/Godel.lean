import Mathlib.Logic.Encodable.Basic

/-!
# Gödel numberings

A **Gödel numbering** of a type `α` is a *total* numeric coding:

* `encode : α → ℕ` assigns a code to every element;
* `decode : ℕ → α` assigns *some* element to **every** natural number;
* `decode (encode a) = a` guarantees that decoding an honest code
  recovers the original value.

Because `decode` is total, users never have to juggle `Option`.
Bad codes simply map to a default element.

This file provides

* the type-class `Godel.Numbering α`;
* `encode_injective`, showing that `encode` is injective;
* an `Encodable α` instance derived from any Gödel numbering.

Everything lives in the `Godel` namespace, so it will not clash with
other material in `Computability`.

* Authors: Richard Zandi
-/

set_option linter.unnecessarySimpa false

namespace Godel

/-- A **Gödel numbering** (total numeric code) for a type `α`. -/
class Numbering (α : Type*) where
  /-- Numeric code of an element. -/
  encode        : α → ℕ
  /-- *Total* decoder: every natural number produces *some* element. -/
  decode        : ℕ → α
  /-- Decoding after encoding is the identity. -/
  decode_encode : ∀ a : α, decode (encode a) = a

namespace Numbering

variable {α : Type*} (n : Numbering α)

/-- `encode` is injective because `decode ∘ encode = id`. -/
@[simp] theorem encode_injective :
    Function.Injective (@Numbering.encode α n) := by
  intro a₁ a₂ h
  have : @Numbering.decode α n (@Numbering.encode α n a₁) =
         @Numbering.decode α n (@Numbering.encode α n a₂) := by
    simpa [h]
  simpa [Numbering.decode_encode] using this

/-- Any *total* Gödel numbering yields an `Encodable` instance whose
    decoder never fails. -/
instance instEncodable (α : Type*) [Numbering α] : Encodable α where
  encode    := Numbering.encode
  decode k  := some (Numbering.decode k)
  encodek a := by
    simp [Numbering.decode_encode]

end Numbering
end Godel
