import Text.Printf

main = do
  l <- getLine
  let i = map read $ words l :: [Int]
      a = (i!!0) `div` (i!!1)
      b = (i!!0) `mod` (i!!1)
      c = (fromIntegral (i!!0)) / (fromIntegral (i!!1)) :: Double
  printf "%d %d %.5f\n" a b c

  
