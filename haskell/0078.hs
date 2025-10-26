import Text.Printf (printf)
import Data.List (sortBy)
ans n = sub1 1 x y []
  where
    x = n `div` 2
    y = x + 1
    sub1 i x y t = if i >= n*n
                  then (x,y):t
                  else sub1 (i+1) x' y' t'
      where
        t' = (x, y) : t
        (x', y') = sub2 ((x+1) `mod` n) ((y+1) `mod` n) t'
    sub2 x y t =
      if elem (x, y) t
      then sub2 ((x - 1 + n) `mod` n) ((y + 1) `mod` n) t
      else (x, y)

fmt2 :: [[Int]] -> [String]
fmt2 s =
  map concat $ map (map (\i -> printf "%4d" i)) s 
  
fmt t = s''
  where
    t' = zip [1..] $ reverse t
    s  = sortBy (\(_,(x1,y1)) (_,(x2,y2)) -> compare (y1,x1) (y2,x2)) t'
    s' = sub3 s
    s''= fmt2 s'
    sub3 [] = []
    sub3 xx@((i,(x,y)):xs) = p:sub3 r
      where p = map fst $ takeWhile (\(j,(_,y')) -> y' == y) xx
            r = drop (length p) xx
main = do
  l <- takeWhile (/= 0) <$> map read <$> lines <$> getContents :: IO [Int]
  let a = map (fmt . ans)  l
  mapM_ (mapM_ putStrLn)  a

