(* let rec reverse_string str =
  match str with
    | "" -> str
    | s ->
  let head = s.[0] in
  let tail = String.sub s 1 (String.length s - 1) in
    reverse_string(tail) ^ String.make 1 head
*)

let reverse_string = function
  | "" -> ""
  | s -> Stdlib.String.fold_left (fun  acc ch -> (String.of_char ch) ^ acc)  "" s


