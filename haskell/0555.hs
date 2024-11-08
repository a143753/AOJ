find _ [] = 0
find s r =
  let s' = take (length s) r
  in
    if s' == s
    then 1
    else find s (drop 1 r)

ans s r =
  let ls = length s
      lr = length r
      d  = take (ls+lr) $ cycle r
  in
    find s d

main = do
  s <- getLine
  _ <- getLine
  c <- getContents
  let i = lines c
      o = sum $ map (ans s) i
  print o
