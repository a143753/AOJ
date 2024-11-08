import Data.List
mark = ["R", "G", "B"]

f [] = True
f a@(h:t) = (r1 && (f (a \\ [h,h,h]))) || (r2 && (f (a \\ [h,h+1,h+2])))
  where
    nh = length $ filter (== h) a
    r1 = nh >= 3
    r2 = (elem (h+1) a) && (elem (h+2) a)

tst c =
  let n = sort $ map snd c
  in
    f n

ans' c =
  let cc = map (\m -> filter (\cc -> m == (fst cc)) c) mark
      r  = and $ map tst cc
  in
    if r then 1 else 0

ans [] = []
ans (n:m:r) =
  let n' = map read n :: [Int]
      z  = zip m n'
  in
    (ans' z):(ans r)

main = do
  _ <- getLine
  c <- getContents
  let i = map words $ lines c
      o = ans i
  mapM_ print o
  
