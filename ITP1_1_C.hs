import Text.Printf

main = do
  l <- getLine
  let i = map read $ words l :: [Int]
      a = i!!0
      b = i!!1
  printf "%d %d\n" (a*b) ((a+b)*2)
