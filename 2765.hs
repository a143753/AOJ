ans xw =
  let t = foldr (\[x,w] a -> a + x * w) 0 xw
      i = if t > 0 then -1 else 1
      r = (abs t) `mod` 30
      m = (abs t) `div` 30
      n'= if r == 0 then m else m+1
      xw'= (take m $ repeat [i,30]) ++ (take (n'-m) [[i,r]])
  in
    ([n']:xw')

main = do
  _ <- getLine
  _ <- getLine
  c <- getContents
  let i = map (map read) $ map words $ lines c
      o = ans i
  mapM_ putStrLn $ map unwords $ map (map show) o
