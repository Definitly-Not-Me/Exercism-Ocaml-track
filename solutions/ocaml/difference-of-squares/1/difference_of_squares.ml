let square_of_sum = 
  (fun n -> n*n * (n*n + 2 * n +1) / 4)

let sum_of_squares =
  (fun n -> n * (n + 1) * (2*n + 1) / 6)

let difference_of_squares n =
  let squared_sum =  square_of_sum n in
  let sumed_squares = sum_of_squares n in
  squared_sum - sumed_squares 
