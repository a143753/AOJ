main = do
  l <- getLine
  let [a,b,c] = map read $ words l :: [Int]
  print $ length $ [ x | x <- [a..b], c `mod` x == 0 ]
