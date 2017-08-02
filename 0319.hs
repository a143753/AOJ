import Data.List

chk _ [] = []
chk n (x:xs) = 
  (min x n):( chk (n-1) xs )

ans x =
  let s = sort x
      l = length x
  in
    maximum $ chk l s

main = do
  _ <- getLine
  l <- getLine
  let i = map read $ words l :: [Int]
      o = ans i
  print o
  
