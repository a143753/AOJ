import Data.Char

row [] = []
row (_:[]) = []
row (a:b:xs) =
  let
    n = (a + b) `mod` 10
  in
    n:(row (b:xs))

ans (x:[]) = x
ans x = ans $ row x

main = do
  c <- getContents
  let i = map (map digitToInt) $ lines c :: [[Int]]
      o = map ans i
  mapM_ print o
  
