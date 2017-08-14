unit = ["", "Man","Oku","Cho","Kei","Gai","Jo","Jou","Ko","Kan","Sei","Sai","Gok","Ggs","Asg","Nyt","Fks","Mts"]

toStr 0 _ = []
toStr _ [] = []

toStr n (u:us) = 
  let m = n `mod` 10000
      n'= n `div` 10000
  in
    if m == 0
    then (toStr n' us)
    else (toStr n' us) ++ show(m) ++ u

ans' :: Integer -> Integer -> String
ans' a b =
  let n = a ^ b
  in
    toStr n unit

ans :: [[Integer]] -> [String]
ans ([0,0]:_) = []
ans ([a,b]:s) =
  (ans' a b):(ans s)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Integer]]
      o = ans i
  mapM_ putStrLn o
