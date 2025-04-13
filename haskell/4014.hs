ans 1 = [1]
ans n = (n: ans (n `div` 2))

main = do
  l <- getLine
  let i = read l :: Int
      o = ans i
  mapM_ (putStrLn . show) o
