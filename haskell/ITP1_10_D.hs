d1 :: [Double] -> [Double] -> Double
d1 v1 v2 = foldl (\s (a,b) -> s + abs(a-b) ) 0 $ zip v1 v2

d2 :: [Double] -> [Double] -> Double
d2 v1 v2 = sqrt $ foldl (\s (a,b) -> s + (a-b)*(a-b) ) 0 $ zip v1 v2

d3 :: [Double] -> [Double] -> Double
d3 v1 v2 = (** (1.0/3.0)) $ foldl (\s (a,b) -> s + (abs(a-b))*(abs(a-b))*(abs(a-b)) ) 0 $ zip v1 v2

di :: [Double] -> [Double] -> Double
di v1 v2 = maximum $ map (\(a,b) -> abs(a-b)) $ zip v1 v2

ans :: [[Double]] -> [Double]
ans (v1:v2:_) = [
  d1 v1 v2,
  d2 v1 v2,
  d3 v1 v2,
  di v1 v2 ]

main = do
  l <- getLine
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Double]]
      o = ans i
  mapM_ print o
