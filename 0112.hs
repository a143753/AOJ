import Data.List

ans :: [Int] -> Int
ans t =
  let s = reverse $ sort t
      z = zip [0..] s
      o = foldl (\s (a,b) -> s + a*b) 0 z
  in
    o

play :: [Int] -> [Int]
play [] = []
play (0:_) = []
play (n:x) =
  let i' = take n x
      xs = drop n x
      o  = ans i'
  in
    (o:play xs)

main = do
  c <- getContents
  let i  = map read $ lines c :: [Int]
      o  = play i
  mapM_ print o
