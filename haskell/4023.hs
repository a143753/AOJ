ans n = l
  where
    l1 = take (n*2+1) $ cycle ".#"
    l2 = take (n*2+1) $ repeat '#'
    l  = take (n*2+1) $ cycle [l1,l2]
      
main = do
  n <- read <$> getLine :: IO Int
  let o = ans n
  mapM_ putStrLn o
