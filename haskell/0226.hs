import Data.List

hit [] [] = 0
hit (x:xs) (y:ys) =
  if x == y
  then 1 + hit xs ys
  else hit xs ys

blow' [] _ = 0
blow' _ [] = 0

blow' (x:xs) (y:ys) =
  if x == y
  then 1 + blow' xs ys
  else if x < y
       then blow' xs (y:ys)
       else blow' (x:xs) ys

blow x y = 
  let x' = sort x
      y' = sort y
  in
    blow' x' y'

chk x y =
  let h = hit  x y
      b = blow x y
  in
    [h, b-h]

ans (["0","0"]:_) = []
ans ([x,y]:s) =
  (chk x y):(ans s)

main = do
  c <- getContents
  let i = map words $ lines c
      o = ans i
  mapM_ putStrLn $ map unwords $ map (map show) o
