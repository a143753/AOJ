import Data.List (sortBy)

rnk :: Int -> [(Int,Int)] -> [(Int,Int,Int)]
rnk _ [] = []
rnk r x@((t,n):_) =
  let y = takeWhile (\(t',n') -> t' == t) x
      l = length y
      z = dropWhile (\(t',n') -> t' == t) x
  in (map (\(t',n') -> (t',n',r)) y) ++ rnk (r+l) z

ans a =
  let t1 = zip a [1..]
      t2 = sortBy (\(x1,y1) (x2,y2) -> compare x1 x2) t1
      t3 = rnk 1 t2
      t4 = sortBy (\(t1,n1,r1) (t2,n2,r2) -> compare n1 n2) t3
  in
    map (\(t,n,r) -> r) t4

main = do
  _ <- getLine
  a <- map read <$> words <$> getLine :: IO [Int]
  let o = ans a
  mapM_ print o
