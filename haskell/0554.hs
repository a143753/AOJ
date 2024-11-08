ans i =
  let t = sum i
      x = t `div` 60
      y = t `mod` 60
  in
    [x,y]

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = ans i
  mapM_ print o
