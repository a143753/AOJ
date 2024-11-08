import Data.List

ans :: Int -> Int -> [[Int]]
ans 0 _ = [[]]
ans 1 _ = [[1]]
ans num max =
  let is = reverse $ [1 .. (minimum [num,max]) ]
      i = map (\i -> map (i:) (ans (num-i) i) ) is
      j = concat i
  in
    j

to_str :: [Int] -> String
to_str [] = []
to_str (x:[]) = show x
to_str (x:xs) =
  (show x)++(' ':(to_str xs))

main = do
  l <- getContents
  let n  = map read $ lines l :: [Int]
      n' = takeWhile (/=0) n
      o  = map (\x -> map to_str $ ans x x) n'
  mapM_ (mapM_ putStrLn) o

