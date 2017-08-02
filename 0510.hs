ans a b =
  let sa = sum a
      sb = sum b
  in
    if sa >= sb
    then sa
    else sb

main = do
  c <- getContents
  let (a:b:_) = map (map read) $ map words $ lines c :: [[Int]]
      o = ans a b
  print o
