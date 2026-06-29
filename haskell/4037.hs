ans w c n = (yn,num)
  where
    yn = if c * n >= w then "Yes" else "No"
    num = if w `mod` c == 0 then w `div` c else (w `div` c) + 1

main = do
  n <- readLn :: IO Int
  [c,w] <- map read . words <$> getLine :: IO [Int]
  let (yn,num) = ans w c n
  putStrLn yn
  if yn == "Yes" then print num else return ()
  
