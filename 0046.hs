import Data.List

main = do
  c <- getContents
  let i = map read $ lines c :: [Double]
      max = maximum i
      min = minimum i
  print (max-min)
