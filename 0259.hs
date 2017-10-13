import Data.Char
import Data.List

conv (d3:d2:d1:d0:_) =
  d3 * 1000 + d2 * 100 + d1 * 10 + d0

next x =
  let d0 =  x             `mod` 10
      d1 = (x `div`   10) `mod` 10
      d2 = (x `div`  100) `mod` 10
      d3 = (x `div` 1000)
      l  = conv $ reverse $ sort [d0,d1,d2,d3]
      s  = conv $ sort [d0,d1,d2,d3]
  in
    l - s

ans n x =
  let y = next x
  in
    if y == 0
    then -1
    else if x == 6174
         then n
         else ans (n+1) $ next x
    
main = do
  c <- getContents
  let i = takeWhile (/= 0) $ map read $ lines c :: [Int]
      o = map (ans 0) i
  mapM_ (\ d -> if d == -1
                then putStrLn "NA"
                else putStrLn $ show d ) o
