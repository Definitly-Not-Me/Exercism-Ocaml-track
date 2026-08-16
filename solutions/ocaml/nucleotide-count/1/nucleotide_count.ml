open Base

let empty = Map.empty (module Char)

let count_nucleotide s c =
      String.fold s ~init:0 ~f:(fun acc ch ->
      
      acc + (if (Char.equal ch c) then 1 else 0)
    ) 

let count_nucleotides s = 
   String.fold  s ~init:( Ok empty ) ~f:(fun acc c -> 
    if String.contains "ACGT" c then
      match acc with 
      | Ok map ->  Ok (Map.set map ~key:c ~data:(count_nucleotide s c))
      | Error e -> Error e
    else 
      Error c
  ) 
  
