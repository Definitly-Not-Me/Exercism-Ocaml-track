type nucleotide = A | C | G | T

let hamming_distance seq1 seq2 =
  let open  List  in 
    if  (length seq1 <> length seq2) then
      Error ("strands must be of equal length")
    else  
      Ok(fold_left (fun acc pair -> acc + (if (fst pair = snd pair) then 0 else 1 )) 0 (combine seq1 seq2))

