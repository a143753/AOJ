f = f' 10
  where
    f' n x =
      let a = x `div` n
          b = x `mod` n
      in
        if a == 0
        then []
        else (a*b):(f' (n*10) x)

ans = ans' []
  where
    ans' s n =
      let m = maximum $ f n
      in
        if n < 10
        then length s
        else if elem n s
             then -1
             else ans' (n:s) m

main = do
  _ <- getLine
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = map ans i
  mapM_ print o
