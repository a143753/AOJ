import Data.Char

transpose ([]:_) = []
transpose matrix =
  let row  = map (head) matrix
      rows = transpose $ map (drop 1) matrix
  in
    row:rows

concat' :: [String] -> String
concat' (x:[]) = x
concat' (x0:x1:xs) = concat' ((x0++"\n"++x1):xs)

line :: Int -> String
line n = 
  let n5 = n `div` 5
      n1 = n `mod` 5
      c5 = if n5 == 1 then " *=" else "* ="
      c1 = (replicate n1 '*') ++ " " ++ (replicate (4-n1) '*')
  in
    c5++c1

ans d =
  let n = map digitToInt d :: [Int]
      l = length(n)
      n'= (replicate (5-l) 0) ++ n
      c = map line n'
  in
    transpose c

main = do
  c <- getContents
  let i = lines c
      o = map ans i
  putStr $ concat' $ map unlines o

