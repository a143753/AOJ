ans (n:ak) = a !! k
  where
    a = take n ak
    k = head $ drop n ak

main = do
  c <- map read <$> lines <$> getContents :: IO [Int]
  let a = ans c
  print a
