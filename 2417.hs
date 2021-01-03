import Data.Char

s n = [ "w", "", "k", "s", "t", "n", "h", "m", "y", "r" ]!!n

b 'T' = "a"
b 'L' = "i"
b 'U' = "u"  
b 'R' = "e"  
b 'D' = "o"
-- |
-- >>> ans1 "0U"
-- ["n","n"]
ans1 [] = []
ans1 ('0':'U':ls) = "n":"n":(ans1 ls)
ans1 (l:ls) =
  let n = digitToInt l :: Int
  in
    (s n):(ans2 ls)

ans2 (l:ls) = (b l):(ans1 ls)

main = do
  l <- getLine
  let o = concat $ ans1 l
  putStrLn o
