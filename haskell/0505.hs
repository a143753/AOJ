import Data.List

sum' [] [] = []
sum' (x:xs) (y:ys) = (x+y):(sum' xs ys)

sumup' s [] = s
sumup' s (x:xs) = sumup' (sum' s x) xs

sumup (x:xs) = sumup' x xs

ans' :: [[Int]] -> [Int]
ans' x =
  let s = sumup x
      z = zip [1..] s
      s'= sortBy (\(a,b) (c,d) -> compare d b) z
  in
    map fst s'

ans [] = []
ans ([0,0]:_) = []
ans ([n,m]:x) = 
  let d = take n x
      r = drop n x
  in
    (ans' d):(ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ putStrLn $ map unwords $ map (map show) o
