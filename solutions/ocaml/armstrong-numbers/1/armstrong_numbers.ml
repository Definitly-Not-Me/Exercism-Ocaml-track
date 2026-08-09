
let pow  x y =
      let rec mul_n_times x y z =
      if (y == 0) then
        1
      else if (y == 1) then
      x
      else
        mul_n_times (x*z) (y - 1) z
    in mul_n_times x y x

let len_of_num num = num |> string_of_int |> String.length

let validate candidate = (
    if (candidate < 10) then
    true
    else
      let len = len_of_num candidate in
      let digit_sum =
        let rec reduce_num acc num = (
        (* Printf.printf "* acc = %d,\n* num = %d\n" acc num; *)
         let digit = num mod 10 in
         match num with
         | 0 -> acc
         | _ -> reduce_num (acc + (pow  digit len)) (num / 10)
        )  in reduce_num 0 candidate
    in
    (* Printf.printf "digit_sum = %d\n" digit_sum; *)
    if (digit_sum = candidate) then
      true
    else
      false
  )
