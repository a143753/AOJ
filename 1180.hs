import Data.List
-- |
-- >>> d2a 6 083268
-- [0,8,3,2,6,8]
d2a n d = reverse $ d2a' n d
  where
    d2a' 0 _ = []
    d2a' n d = (d `mod` 10):(d2a' (n-1) (d`div`10))
-- |
-- >>> a2d 6 [0,8,3,2,6,8]
-- 83268
a2d :: Int -> [Int] -> Int
a2d 0 _ = 0
a2d n (a:as)= a * 10^(n-1) + (a2d (n-1) as)

-- |
-- >>> f 6 83268
-- 862632
-- >>> f 6 862632
-- 642654
f :: Int -> Int -> Int
f n a = max-min
  where
    ary = sort $ d2a n a
    max = a2d n $ reverse $ ary
    min = a2d n $ ary

as n a = a:(as n (f n a))

ans' s (a:as) =
  case i of
    Just i' -> [(length s) - i', a, i']
    Nothing -> ans' (a:s) as
  where
    i = lookup a $ zip s [1..]

ans ([0,0]:_) = []
ans ([a,n]:r) = (ans' [] (as n a)):(ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ putStrLn $ map unwords $ map (map show) o
