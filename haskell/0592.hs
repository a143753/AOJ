import Data.List

ans = (`div` 5) . sum . map (\x-> if x < 40; then 40; else x)

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = ans i
  print o
  
