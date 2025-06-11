/-
Godelnumbering/Instances.lean
-----------------------------

The *identity* Gödel numbering for `ℕ`, plus the obvious `Computable`
and `Primrec` facts.  Registering these instances once, in one place,
keeps downstream files uncluttered.

This file is **sorry-free**.
-/


import Mathlib.Computability.Primrec
import Mathlib.Computability.Partrec
import Godelnumbering.Godel

namespace Godel

/-! ### The canonical Gödel numbering for `ℕ` -/

/-- The trivial Gödel numbering: every natural number codes itself. -/
instance instNumberingNat : Numbering ℕ where
  encode        := id
  decode        := id
  decode_encode := by
    intro n; rfl

@[simp] lemma nat_encode_eq (n : ℕ) :
    (Numbering.encode : ℕ → ℕ) n = n := rfl

@[simp] lemma nat_decode_eq (n : ℕ) :
    (Numbering.decode : ℕ → ℕ) n = n := rfl

/-- `encode : ℕ → ℕ` is computable (it is the identity). -/
lemma instComputableEncodeNat :
    Computable (Numbering.encode : ℕ → ℕ) := by
  simpa using
    (Computable.id (α := ℕ) :
      Computable (fun n : ℕ ↦ n))

/-- `decode : ℕ → ℕ` is computable (it is the identity). -/
lemma instComputableDecodeNat :
    Computable (Numbering.decode : ℕ → ℕ) := by
  simpa using
    (Computable.id (α := ℕ) :
      Computable (fun n : ℕ ↦ n))

/-- …and both maps are primitive-recursive. -/
lemma instPrimrecEncodeNat :
    Primrec (Numbering.encode : ℕ → ℕ) := by
  simpa using
    (Primrec.id (α := ℕ) :
      Primrec (fun n : ℕ ↦ n))

lemma instPrimrecDecodeNat :
    Primrec (Numbering.decode : ℕ → ℕ) := by
  simpa using
    (Primrec.id (α := ℕ) :
      Primrec (fun n : ℕ ↦ n))

end Godel

#lint
