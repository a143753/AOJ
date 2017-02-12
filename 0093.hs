isLeap year
  | year `mod` 400 == 0 = True
  | year `mod` 100 == 0 = False
  | year `mod`   4 == 0 = True
  | otherwise           = False

takeIf :: (Int -> Bool) -> [Int] -> [Int]
takeIf _ [] = []
takeIf f (x:xs) =
  if f x
  then x:(takeIf f xs)
  else takeIf f xs

ans (from:to:_) =
  takeIf isLeap [from..to]

toStr :: [[Int]] -> String
toStr ([]:xs) = "NA\n\n" ++ toStr xs
toStr (x:[])  = (unlines $ map show x)
toStr (x:xs)  = (unlines $ map show x)++"\n"++(toStr xs)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      i'= takeWhile (/= [0,0]) i
      o = map ans i'
  print o
  print [2001..2010]
  putStr $ toStr o
