import Godelnumbering.Instances
open Godel


example {m n : ℕ}
        (h : Numbering.encode m = Numbering.encode n) :
        m = n :=
by
  -- `inj` is the injectivity lemma specialised to `ℕ`
  have inj : Function.Injective (Numbering.encode : ℕ → ℕ) :=
    Numbering.encode_injective (α := ℕ) _
  exact inj h        -- feed `h`; Lean infers `m` and `n`

#lint
