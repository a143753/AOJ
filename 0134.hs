ans (n:d) =
  let s = sum d
      a = s `div` n
  in
    a

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = ans i
  print o
