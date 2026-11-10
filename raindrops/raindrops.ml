let raindrop num =
    let divisible_by_3 = (fun x -> if (x mod 3) = 0 then "Pling" else "")  in
    let divisible_by_5 = (fun x -> if ( x mod 5) = 0 then "Plang" else "") in
    let divisible_by_7 = (fun x -> if (x mod 7) = 0 then "Plong" else "") in

    match (divisible_by_3 num) ^ (divisible_by_5 num) ^ (divisible_by_7 num) with
    | "" -> Int.to_string num
    | s -> s
