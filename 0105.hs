import Data.List

cmp [] = []
cmp x@((w1,p1):xs) = 
  let c = takeWhile (\ (w,p) -> w == w1) x
      r = dropWhile (\ (w,p) -> w == w1) x
      p = map snd c
  in
    (w1,p):cmp r

ans i =
  let s = sortBy (\ (w1,p1) (w2,p2) -> if w1 /= w2
                                       then compare w1 w2
                                       else compare p1 p2 ) i
      c = cmp s
  in
    c

pr (w,p) = do
  putStrLn w
  putStrLn $ unwords $ map show p

main = do
  c <- getContents
  let i = map (\ (w:p:_) -> (w,read(p)) ) $ map words $ lines c :: [(String,Int)]
      o = ans i
  mapM_ pr o
