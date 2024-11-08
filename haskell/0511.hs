import Data.List

ans x = sort $ [1..30] \\ x

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = ans i
  mapM_ print o
