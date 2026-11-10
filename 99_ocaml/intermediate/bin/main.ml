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

  let decode_rle encoded =
    let rec populate n x acc =
    if n = 0 then acc else populate (n - 1) x (x::acc)
    in
    let rec aux list acc =
    match list with
    | [] -> acc
    | One x :: [] -> x :: acc
    | Many (num, char) :: tl -> aux tl (populate num char acc)

    in List.rev (aux encoded [])

