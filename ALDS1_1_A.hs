-- insertion sort

is k [] = [k]
is k (x:xs)
  | k <= x    = (k:x:xs)
  | otherwise = x:(is k xs)

ans n i x
  | n == i    = []
  | otherwise =
    let k = x!!i
        t = drop (i+1) x
        h = is k $ take i x
        r = h ++ t
    in
      (r:ans n (i+1) r)

main = do
  n <- getLine
  i <- getLine
  let n' = read n :: Int
      i' = map read $ words i :: [Int]
      o  = ans n' 0 i'
  mapM_ putStrLn $ map unwords $ map (map show) o
