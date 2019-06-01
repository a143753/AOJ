f x a = a * (x `div` a)

ans [[h,w],[a,b]] = h * w - h' * w'
  where
    h' = f h a
    w' = f w b

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  print o
