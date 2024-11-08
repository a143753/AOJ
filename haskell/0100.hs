import Data.List

f :: [[Int]] -> [(Int,Int)]
f [] = []
f ((e:p:q:_):xs) = (e,p*q):(f xs)

g :: [(Int,Int)] -> [(Int,Int)]
g [] = []
g ((e,v):[]) = [(e,v)]
g ((e0,v0):(e1,v1):xs)
  | e0 == e1  = g ((e0,v0+v1):xs)
  | otherwise = ((e0,v0):(g ((e1,v1):xs)))

g' :: [(Int,Int)] -> [(Int,Int)]
g' [] = []
g' ((e,v):[]) = [(e,v)]
g' x@((e0,v0):xs) =
  let v = sum $ map snd $ filter (\(e,v) -> e0 == e) x
      y = filter (\(e,v) -> e0 /= e) xs
  in
    ((e0,v):(g' xs))

h :: [(Int,Int)] -> [Int]
h [] = []
h ((e,v):xs)
  | v >= 1000000 = (e:(h xs))
  | otherwise    = h xs

p [] = []
p ([]:xs) = ["NA"] ++ (p xs)
p (x:xs)  = (map show x) ++ (p xs)

ans ([0]:_) = []
ans (n:ns) =
  let d = take (n!!0) ns
      r = drop (n!!0) ns
      a = h $ g' $ f d
  in
    a:(ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = unlines $ p $ ans i
  putStr o
