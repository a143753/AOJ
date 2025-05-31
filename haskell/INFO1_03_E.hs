main = do
  i <- reverse <$> concat <$> map words <$> lines <$> getContents
  putStrLn $ unwords $ take 3 i
  putStrLn $ unwords $ drop 3 i
  
