main = do
  l <- getLine
  mapM_ (\ c -> putStrLn [c] ) l
