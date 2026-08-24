let rec reverse_string str = 
  match str with 
    | "" -> str
    | s -> 
  let head = s.[0] in
  let tail = String.sub s 1 (String.length s - 1) in
    reverse_string(tail) ^ String.make 1 head


