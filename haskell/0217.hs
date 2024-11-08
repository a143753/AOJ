import Data.List

ans ([0]:_) = []
ans ([n]:x) =
  let d = take n x
      r = drop n x
      m = maximumBy (\ [p1,d1] [p2,d2] -> compare d1 d2 ) $ map (\ [p,d1,d2] -> [p,d1+d2] ) d
  in
    m:ans r

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ putStrLn $ map unwords $ map (map show) o
