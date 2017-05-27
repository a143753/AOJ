import Data.List

hit [] [] = 0
hit (a0:as) (b0:bs) =
  let s = if a0 == b0
          then 1
          else 0
  in
    s + (hit as bs)

blow :: [Int] -> [Int] -> Int
blow x y =
  let b = sum $ map (\e -> if elem e y then 1 else 0) x
      h = hit x y
  in
    b-h

play :: [[Int]] -> [[Int]]
play [] = []
play (x:y:xs) =
  let h = hit  x y
      b = blow x y
      r = play xs
  in
    [h,b]:r

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = play i
  mapM_ putStrLn $ map unwords $ map (map show) o
