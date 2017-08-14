import Data.List
cal :: Int -> [Int] -> (Int,Float)
cal y (b:r:1:_) =
  let r' = fromIntegral r
      y' = fromIntegral y
  in
    ( b, (1.0 + y' * r'/ 100.0) )
cal y (b:r:2:_) =
  let r' = fromIntegral r
      y' = fromIntegral y
  in
    ( b, (1.0 + r'/ 100) ** y' )

ans ([0]:_) = []
ans ([n]:[y]:l) = 
  let d = take n l
      r = drop n l
      a = map (cal y) d
      m = maximumBy (\ (k1,v1) (k2,v2) -> compare v1 v2) a
  in
    m:ans r

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ (\ (a,b) -> print a) o
