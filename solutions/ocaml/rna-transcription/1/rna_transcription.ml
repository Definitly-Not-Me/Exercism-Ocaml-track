type dna = [ `A | `C | `G | `T ]
type rna = [ `A | `C | `G | `U ]

let to_rna list =
    List.map (
        fun nucleo ->
        match nucleo with
        | `A -> `U
        | `C -> `G
        | `G -> `C
        | `T -> `A
    ) list
