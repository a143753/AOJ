import Data.List

sumup [] = []
sumup x@(a:[]) = x

sumup x@(a:xs) =
  let l = length $ takeWhile (== a) x
      l'= l `div` 2
      y = dropWhile (== a) x
  in
    if (l `mod` 2) == 0
    then   sumup ( (replicate l' (a+1)) ++ y )
    else a:sumup ( (replicate l' (a+1)) ++ y )

ans i =
  let s = sort $ map (\ (a:b:_) -> a+b) i
      r = sumup s
  in
    r

main = do
  _ <- getLine
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ putStrLn $ map (\ x -> (show x) ++ " 0") o
  
