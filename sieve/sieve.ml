
let primes num =
    if num <= 1 then
        []
    else
        let nat_in_range_n = List.init (num - 1) (fun i -> 2 + i) in
        let aux lst x =
           match List.filter (fun elem -> x  mod elem == 0) lst with
           | [ ] -> x::lst
           | _ -> lst
        in
            List.fold_left (aux) [] nat_in_range_n




