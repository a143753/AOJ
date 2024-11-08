chk [a,b,c,d] [] = [a,b,c,d]
chk [a,b,c,d] (x:xs)
  | x >= 1.1 = chk [a+1,b,c,d] xs
  | x >= 0.6 = chk [a,b+1,c,d] xs
  | x >= 0.2 = chk [a,b,c+1,d] xs
  | otherwise= chk [a,b,c,d+1] xs

ans i =
  let l  = map (\ [l,r] -> l) i
      r  = map (\ [l,r] -> r) i
      tl = chk [0,0,0,0] l
      tr = chk [0,0,0,0] r
  in
    zip tl tr

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Float]]
      o = ans i
  mapM_ putStrLn $ map unwords $ map (\ (a,b) -> [(show a),(show b)] ) o
