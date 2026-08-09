let score (x: float) (y: float): int = 
  let d = sqrt (x ** 2.0 +. y ** 2.0 ) in
  match d with 
    | _ when d > 10.0 -> 0
    | _ when d > 5.0 -> 1
    | _ when d > 1.0 -> 5
    | _ -> 10
