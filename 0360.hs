ans [a,b] i =
  let f = filter(\ [s,f] -> (a <= s && s <  b) ||
                            (a <  f && f <= b) ||
                            (s <= a && b <= f) ) i
  in
    if f == []
    then 0
    else 1

main = do
  ab <- getLine
  _  <- getLine
  c  <- getContents
  let [a,b] = map read $ words ab :: [Int]
      i     = map (map read) $ map words $ lines c :: [[Int]]
      o     = ans [a,b] i
  print o
  
