tenchi ([]:_) = []
tenchi x =
  let c = map head x
      x'= map (drop 1) x
  in
    c:tenchi x'

sum' [] _ = []
sum' _ [] = []
sum' (a:as) (b:bs) = (a+b):(sum' as bs)

play [] = repeat 0
play (i:is) =
  let n = map (\e -> length $ filter (== e) i) i
      s = map (\(n,e) -> if n == 1
                         then e
                         else 0) $ zip n i
  in
    sum' s (play is)

ans i =
  let i' = tenchi i
  in
    play i'

main = do
  _ <- getLine
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o
