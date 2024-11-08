ans :: [Int] -> Int
ans (m:n:_) =
  length $ [ (a,b,c) | a <- [1..m], b <- [1..m], c <- [1..m], a < b, b < c, a + b + c == n ]

main = do
  l <- getContents
  let i  = map (map read) $ map words $ lines l :: [[Int]]
      i' = takeWhile (/= [0,0]) i
      o  = map ans i'
  mapM_ print o
  
