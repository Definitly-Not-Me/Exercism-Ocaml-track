let acronym expr =
  expr
|> String.replace_all ~sub:"-" ~by:" "
|> String.to_seq
|> Seq.filter (fun char -> Char.Ascii.is_alphanum char || char = ' ')
|> String.of_seq
|> String.split_on_char ' '
|> List.filter ((<>) "")
|> List.map (fun str -> Char.Ascii.uppercase str.[0])
|> List.fold_left (fun acc letter -> acc ^ (String.make 1 letter)) ""
