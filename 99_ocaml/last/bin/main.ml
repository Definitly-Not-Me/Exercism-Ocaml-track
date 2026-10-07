open Stdlib

let rec last = function
  | x :: [] -> Some x
  | hd :: tail -> last tail
  | [] -> None

let rec last_two = function
  | [] | [ _ ] -> None
  | [ fst; snd ] -> Some (fst, snd)
  | _ :: tl -> last_two tl

let rec at n list =
  match list with
  | [] -> None
  | hd :: tl -> if n = 0 then Some hd else at (n - 1) tl

let rec reverse_list list =
  match list with
  | [] | [ _ ] -> list
  | x :: tl -> reverse_list tl @ [ x ]

let length list =
  let rec count_list_item list acc =
    match list with
    | [] -> acc
    | _ :: tl -> count_list_item tl (acc + 1)
  in
  count_list_item list 0

let rle list =
  let rec aux list acc counter =
    match list with
    | [] -> acc
    | [ x ] -> (x, counter + 1) :: acc
    | fs :: (sd :: _ as tl) ->
        if fs = sd then aux tl acc (counter + 1)
        else aux tl ((fs, counter + 1) :: acc) 0
  in
  List.rev (aux list [] 0)

type 'a encoding = One of 'a | Many of int * 'a

let modded_rle list =
  let get_encoding elem count =
    if count = 1 then One elem else Many (count, elem)
  in
  let rec aux list acc counter =
    match list with
    | [] -> acc
    | [ x ] -> get_encoding x (counter + 1) :: acc
    | fs :: (sd :: _ as tl) ->
        if fs = sd then aux tl acc (counter + 1)
        else aux tl (get_encoding fs (counter + 1) :: acc) 0
  in
  List.rev (aux list [] 0)

let () =
  print_endline
    (match last [ "a"; "b"; "c"; "d"; "e" ] with
    | None -> ""
    | Some x -> x)
