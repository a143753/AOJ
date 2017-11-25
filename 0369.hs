-- wrong answer
ans ([n,t]:x) =
  let g = maximum $ map (\[x,h] -> h / x) x
  in
    t * g
    
main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Float]]
      o = ans i
  print o
