ans (n:alr) = take (r-l+1) $ drop l a
  where
    a = take n alr
    [l,r] = drop n alr

main = do
  c <- map read <$> lines <$> getContents :: IO [Int]
  let a = ans c
  mapM_ print a
