ans o =
  length $ [(a,b,c,d) | a <- [0..9],b <- [0..9], c <- [0..9], d <- [0..9], a + b + c + d == o ]

main = do
  is <- map read <$> lines <$> getContents :: IO [Int]
  let o = map ans is
  mapM_ print o
