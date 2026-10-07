  type 'a node =
    | One of 'a
    | Many of 'a node  list

  let rec flatten list =
    let rec aux acc = function
      | [] -> acc
      | One x::t -> aux (x::acc) t
      | Many l::t -> aux (aux acc l) t
    in List.rev (aux [] list)

  let rec compress = function
    | [] -> []
    | x::[] -> x::[]
    | fs::sd::t -> if fs = sd then compress (fs::t)  else fs::(compress (sd::t))

  let pack list =
    let rec aux current acc = function
    | [] -> []
    | [x] -> (x::current)::acc
    | a::(b::_ as t) -> if a = b then aux (a :: current) acc t
            else aux [] ((a :: current) :: acc) t  in
    List.rev (aux [] [] list)
