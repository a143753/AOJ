df (a:[]) = []
df (a:b:s) = (b-a):(df (b:s))

ans [] = []
ans (_:d:r) =
  let a = df d
      mx= maximum a
      mn= minimum a
      mx'= if mx < 0 then 0 else  mx
      mn'= if mn > 0 then 0 else -mn
  in
    [mx',mn']:(ans r)
  
main = do
  _ <- getLine
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ putStrLn $ map unwords $ map (map show) o
