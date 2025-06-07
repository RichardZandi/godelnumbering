import Lake
open Lake DSL

package godelnumbering where
  moreLeanArgs := #["-DautoImplicit=false"]

-- 𝗲𝘅𝗮𝗰𝘁 𝗳𝗼𝗿𝗺𝗮𝘁 (   require  + newline + git URL   )
require mathlib from
  git "https://github.com/leanprover-community/mathlib4.git" @ "v4.20.0"



@[default_target]
lean_lib godelnumbering where
  roots := #[`Test.Smoke, `Godelnumbering.Transport, `Godelnumbering.Godel, `Godelnumbering.Instances]
