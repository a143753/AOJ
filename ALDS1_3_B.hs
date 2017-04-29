import Text.Printf

ans :: Int -> Int -> [(String,Int)] -> [(String,Int)] -> IO()
ans q t [] [] = return ()
ans q t [] tq = ans q t (reverse tq) []
ans q t iq@(i:is) tq =
  let (n,t') = i
  in
    if t' > q
    then ans q (t+q) is ((n,t'-q):tq)
    else do
      printf"%s %d\n" n (t+t')
      ans q (t+t') is tq

main = do
  l <- getLine
  c <- getContents
  let [n,q] = map read $ words l :: [Int]
      i = map (\[n, t] -> (n, read t)) $ map words $ lines c :: [(String,Int)]
  ans q 0 i []
