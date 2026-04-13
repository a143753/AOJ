ans s a b =
  let d = (s - a) `div` b
      m = (s - a) `mod` b
  in if s <= a
     then 250
     else if m == 0 then d * 100 + 250 else (d + 1) * 100 + 250 

main = do
  [s,a,b] <- map read <$> lines <$> getContents :: IO [Int]
  let o = ans s a b
  print o
  
