splitBy :: Char -> String -> [String]
splitBy _ [] = []
splitBy a x =
  let s = takeWhile (/= a) x
      x'= dropWhile (/= a) x
  in
    if x' == []
    then [s]
    else s:(splitBy a $ drop 1 x')

judge (a:b:c:_) =
  let x = if ((a*a) + (b*b)) == (c*c)
          then 1
          else 0
      y = if a == b
          then 1
          else 0
  in
    (x,y)

main = do
  c <- getContents
  let i = map (map read) $ map (splitBy ',') $ lines c :: [[Int]]
      t = map judge i
      (o0,o1) = foldr (\ (a,b) (a0,b0) -> (a+a0,b+b0)) (0,0) t
  print o0
  print o1
  
  
