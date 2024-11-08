ans i =
  let p = take 3 i
      j = drop 3 i
  in
    (minimum p) + (minimum j) - 50


main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = ans i
  print o
  
