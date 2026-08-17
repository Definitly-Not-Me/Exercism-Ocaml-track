open Base
let is_nucl = function 
    | 'A' | 'C' | 'G' | 'T' -> true 
    | _ -> false 
let empty = Map.empty (module Char)

let count_nucleotide s c =
    match String.find s ~f:(Fn.non is_nucl) with 
    | None -> 
      if is_nucl c then
        let count = String.count ~f:(Char.equal c) s in 
        Ok (count)
      else 
        Error c
     | Some c' -> Error c'

let count_nucleotides s = 
 String.fold_result s
    ~init:empty 
    ~f:(fun map c ->
      if is_nucl c then
       Ok ( 
        Map.update map c 
        ~f:(Option.value_map ~f:((+) 1) ~default:1)
          )
      else 
        Error c
    )
