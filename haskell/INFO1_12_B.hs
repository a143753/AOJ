ans a [[i1,j1],[i2,j2]] =
  let t0 = take (i2-i1+1) $ drop i1 a
      t1 = map (\l -> take (j2-j1+1) $ drop j1 l) t0
  in
    t1

main = do
  [n,m] <- map read . words <$> getLine :: IO [Int]
  aq <- map (map read) <$> map words <$> lines <$> getContents :: IO [[Int]]
  let a = take n aq
      q = drop n aq
  let o = ans a q
  mapM_ (putStrLn . unwords . map show) o
