let egg_count number =
  let rec count_bit ~acc ~num = 
   match num with 
    | 0 -> acc
    | _ -> count_bit ~acc:(acc + (num land 1)) ~num:(num lsr 1)
    in count_bit ~acc:0 ~num:number
