ans d l = (d `div` l) + (d `mod` l)

main = do
  i <- getLine
  let [d,l] = map read $ words i :: [Int]
  print $ ans d l
