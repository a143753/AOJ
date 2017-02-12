import Data.List

isLeap year
  | year `mod` 400 == 0 = True
  | year `mod` 100 == 0 = False
  | year `mod`   4 == 0 = True
  | otherwise           = False

ans (from:to:_) =
  filter isLeap [from..to]

toStr :: [Int] -> String
toStr [] = "NA\n"
toStr x = unlines $ map show x

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      i'= takeWhile (/= [0,0]) i
      o = map ans i'
--  print o
--  print [2001..2010]
  putStr $ intercalate "\n" $ map toStr o
