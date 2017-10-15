import Data.List

bmi (p:h:w:_) =
  let h' = (fromIntegral h) / 100 :: Float
      w' = fromIntegral w :: Float
      bmi= w' / (h'*h')
  in
    (p, bmi)

ans' x =
  let b = map bmi x
      d = map (\ (i,b) -> (i,abs(b-22)) ) b
      s = sortBy (\ (i0,d0) (i1,d1) -> if d0 == d1
                                       then compare i0 i1
                                       else compare d0 d1 ) d
  in
    fst $ head s

ans ([0]:_) = []
ans ([n]:x) =
  let d = take n x
      r = drop n x
  in
    (ans' d):(ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o
