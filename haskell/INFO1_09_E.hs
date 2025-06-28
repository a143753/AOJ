ans a b [] = zip(reverse a) (reverse b)
ans a b (x:xs) =
  if x < 0
  then ans (x:a) b xs
  else ans a (x:b) xs

main = do
   c <- map read <$> lines <$> getContents :: IO [Int]
   let a = ans [] [] $ tail c
   mapM_ (\(x,y) -> putStrLn $ show x ++ " " ++ show y) a
