main = do
  c <- takeWhile (\x -> x /= 0) <$> map read <$> lines <$> getContents
  mapM_ (putStrLn . show) $ filter (\x -> x > 0) c
