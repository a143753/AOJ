s :: [Int]
s = map (2^) [0..]

bin :: Int -> [Int]
bin 0 = []
bin x = (x `mod` 2):(bin $ x `div` 2)

tak [] = []
tak ((0,s):xs) = tak xs
tak ((1,s):xs) = s:(tak xs)
  
ans x = tak $ zip (bin x) s

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = map ans i
  mapM_ putStrLn $ map unwords $ map (map show) o
