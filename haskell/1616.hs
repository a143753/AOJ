import Data.List

g _ (_:[]) = []
g m (a:b) =
  let x = dropWhile (\i -> (a+i)>m) b
      y = a + (head x)
      z = g m b
  in
    if x /= [] then (y:z) else z

f m d =
  let t = g m $ reverse $ sort d
  in
    if t /= []
    then show $ maximum t
    else "NONE"

ans ([0,0]:_) = []
ans ([_,m]:d:r) = (f m d):(ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ putStrLn o
  
