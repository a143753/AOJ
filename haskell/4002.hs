ans w =
  sub w 15
  where
    sub w x =
      if (x-30) * 2 * x * 6 * x > (w+50)*1000
      then x
      else sub w (x+1)

main = do
  w <- getLine
  let a = ans $ read w :: Int
  putStrLn $ unwords $ map show [6*a, 2*a, a]
