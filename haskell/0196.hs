import Data.List

ans' x =
  let v = map (\ (n:v) -> (n,map read v) ) x :: [(String,[Int])]
      s = map (\ (n,v) -> let x = map (\x -> length $ filter (==x) v ) [0,1,2]
                          in
                            (n,x) ) v
      r = sortBy (\ (a,[s1,s2,s3]) (b,[t1,t2,t3]) -> let c = compare t1 s1
                                                     in
                                                       if c /= EQ
                                                       then c
                                                       else compare s2 t2 ) s

  in
    map fst r

ans ("0":_) = []
ans (x:xs) =
  let n = read x :: Int
      d = map words $ take n xs
      r = drop n xs
  in
    (ans' d) ++ (ans r)

main = do
  c <- getContents
  let i = lines c
      o = ans i
  mapM_ putStrLn o
