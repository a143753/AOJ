ans :: [Int] -> [String]
ans x = 
  let z = zip [1..] x
  in
    map (\(a,b) -> "Case " ++ show(a) ++ ": " ++ show(b)) z
    
main = do
  c <- getContents
  let l = map read $ lines c :: [Int]
      i = takeWhile (/=0) l
      o = ans i

  mapM_ putStrLn o
