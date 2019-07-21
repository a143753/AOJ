data Num = Odd | Even deriving Eq
flip n = if n == Odd then Even else Odd

f oe [] _ = if oe == Odd then True else False

f oe (d:ds) n =
  if n `mod` d == 0
  then if oe == Odd
       then True
       else False
  else f (Main.flip oe) ds n

ans' l r d =
  length $ filter (\x -> x) $ map (f Odd d) [l .. r]


ans ([0,0,0]:_) = []
ans ([n,l,r]:x) =
  let y = concat $ take n x
      z = drop n x
  in
    (ans' l r y):(ans z)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o
