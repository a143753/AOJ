ans' i = maximum $ f i
  where
    f (x1:x2:[]) = []
    f (x1:x2:x3:xs) = (x1+x2+x3):(f (x2:x3:xs))

ans ([0]:_) = []
ans ([n]:i:s) = (ans' i):(ans s)

main = do
  i <- map (map read) <$> map words <$> lines <$> getContents :: IO [[Int]]
  let o = ans i
  mapM_ print o
