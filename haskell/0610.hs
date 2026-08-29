ans _ [] = []
ans t (c:sr) =
  if c == 'c'
  then 0:(ans 0 sr)
  else if t == -1
       then -1:(ans (-1) sr)
       else (t+1):(ans (t+1) sr)

main = do
  _ <- getLine
  c <- lines <$> getContents :: IO [String]
  let o = map (ans (-1)) c
  mapM_ (putStrLn . unwords . map show) o
