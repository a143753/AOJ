import Data.List

ans :: [[Int]] -> [String]
ans ([0,0,0]:_) = []
ans (s@[d,w,h]:[n]:x) =
  let d = take n x
      r = drop n x
      [a,b] = take 2 $ sort s
      o = map (\[r] -> if (2*r)^2 > a*a + b*b
                       then "OK"
                       else "NA" ) d
  in
    o++(ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ putStrLn o
