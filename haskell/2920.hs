import Data.List
ans d =
  let s = sum d
      o = head $ filter odd $ sort d
  in
    if even s then s `div`2 else (s-o) `div `2

main = do
  _ <- getLine
  l <- getLine
  let i = map read $ words l
      o = ans i
  print o
  
