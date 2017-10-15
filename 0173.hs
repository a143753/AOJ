ans [c,a,b] =
  let a' = read a :: Int
      b' = read b :: Int
      n  = show (a'+b')
      m  = show (200*a'+300*b')
  in
    [c, n, m]

main = do
  c <- getContents
  let i = map words $ lines c
      o = map ans i
  mapM_ (putStrLn . unwords)  o
