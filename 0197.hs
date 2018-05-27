import Text.Printf

ans' n x 0 = (n,x)
ans' n x y = ans' (n+1) y (x`mod`y)

ans :: [Int] -> (Int,Int)
ans (x:y:_) =
  if x > y
  then ans' 0 x y
  else ans' 0 y x

main = do
  c <- getContents
  let i = takeWhile (/= [0,0]) $ map (map read) $ map words $ lines c :: [[Int]]
      o = map ans i
  mapM_ (\(v,n) -> printf "%d %d\n" n v) o
