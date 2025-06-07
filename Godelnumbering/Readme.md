# godelnumbering

Lean 4 library that packages the **notion of Gödel numbering** into a clean,
re-usable interface.

| Section | What you get |
|---------|--------------|
| [`Godel/Numbering.lean`](Godel/Godel.lean) | `class Godel.Numbering α` &mdash; total `encode / decode` pair, `encode_injective`, and an automatic `Encodable` instance |
| [`Godel/Instances.lean`](Godel/Instances.lean) | Canonical Gödel numbering for `ℕ` plus `Computable`/`Primrec` facts |
| [`Godel/Transport.lean`](Godel/Transport.lean) | Utility `numToCode` and `transportEval` that lift `Code.eval` to *any* Gödel-encoded type |

The code is **sorry-free**, ≤ 200 LOC, and depends only on mathlib.

---

## Motivation

Diagonal arguments (Gödel, Turing, Rice, Kleene…) require shuttling between
*objects* and *numeric codes*.  Mathlib already has partial `encode/Option α`
pairs via `Encodable`, but total Gödel numberings avoid `Option` noise and map
“junk” codes to a default value.

This library:

* formalises that idea as a **type-class**,
* proves the basic lemmas once,
* supplies ready-made instances so downstream projects can focus on the math.

It was originally developed to streamline proofs of Kleene’s Second Recursion
Theorem and various impossibility results but is completely standalone.

---

## Quick start

```lean
import Godel.Godel
import Godel.Transport
open Godel

variable {α : Type} [Numbering α]

-- injectivity “for free”
example (x y : α) (h : Numbering.encode x = Numbering.encode y) : x = y :=
  by
    have := Numbering.encode_injective _ h
    simpa using this

-- evaluate a numeric program on Gödel-encoded data
#eval transportEval 42 (someGodelisedValue)
