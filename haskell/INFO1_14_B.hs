ans :: [Int] -> Int -> Int
ans a k = if tmp == [] then -1 else snd $ head tmp
  where
    tmp = dropWhile (\(ai,i) -> k /= ai) $ zip a [0..]

main = do
  c <- map (map read) <$> map words <$> lines <$> getContents :: IO [[Int]]
  let a = c !! 1
  let k = head $ c !! 2
  let o = ans a k
  print o
  
