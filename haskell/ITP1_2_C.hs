import Text.Printf
import Data.List

ans :: [Int] -> [Int]
ans l = sort l

main = do
  l <- getLine
  let i = map read $ words l
      a = ans i
  printf "%d %d %d\n" (a!!0) (a!!1) (a!!2)
