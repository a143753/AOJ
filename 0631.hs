import Data.List

scan _ [] = []
scan n (s:sx) =
  let v = if s >= n
          then 0
          else (n-s)
  in
    v:scan n sx

ans n m i =
  let s = take (m-1) $ reverse $ sort i
      r = sum $ scan n s
  in
    r

main = do
  h <- getLine
  c <- getContents
  let (n:m:_) = map read $ words h :: [Int]
      i = map (\ (a:b:_) -> a ) $ map (map read) $ map words $ lines c :: [Int]
      o = ans n m i
  print o
 
