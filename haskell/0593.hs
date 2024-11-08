import Data.List

judge _ [] = []
judge t (j:js) =
  let r = head $ dropWhile (\(i,v) -> v > j) t
  in
    r:(judge t js)

hist [] = []
hist x@(xh:xs) =
  let l = length $ takeWhile (== xh) x
      r = dropWhile (== xh) x
  in
    (xh,l):(hist r)

ans n m i =
  let t = zip [1..] $ take n i
      j = drop n i
      r = judge t j
      h = hist $ sort $ map fst r
      a = fst $ maximumBy (\ (v0,n0) (v1,n1) -> compare n0 n1) h 
  in
    a

main = do
  l <- getLine
  c <- getContents
  let [n,m] = map read $ words l :: [Int]
      i = map read $ lines c :: [Int]
      o = ans n m i
  print o
