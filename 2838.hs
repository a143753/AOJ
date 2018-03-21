import Data.Char

ans c [] = 0
ans c (x:xs) =
  let s = if x > c then 0 else 1
  in
    s + ans x xs

main = do
  l <- getLine
  let i = map (\c -> ord c - ord 'A')l :: [Int]
      o = ans 0 i
  print o
