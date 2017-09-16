ans' [] _ _ = "YES"

ans' (i:is) (a:as) (b:bs)
  | (i>a) && (a>b) = ans' is (i:a:as) (b:bs)
  | (a>i) && (i>b) = ans' is (a:as) (i:b:bs)
  | (a>b) && (b>i) = "NO"
  | otherwise      = ans' (i:is) (b:bs) (a:as)
  
ans i = ans' i [0] [-1] -- a /= b

main = do
  n <- getLine
  c <- getContents
  let n' = read n :: Int -- nを無視したらWrong Answerだった
      i = map (map read) $ map words $ take n' $ lines c :: [[Int]]
      o = map ans i
  mapM_ putStrLn o
  
