import Data.List

ans'' _ [] = []
ans'' _ (x:[]) = [x]
ans'' t ((f,w,s):xs) =
  if s >= (t-w)
  then (f,w,s):(ans'' (t-w) xs)
  else
    let b1 = takeWhile (\ (f1,w1,s1) -> s1 < t-w1) xs
        b2 = dropWhile (\ (f1,w1,s1) -> s1 < t-w1) xs
        (f2,w2,s2) = head b2
        y  = (f,w,s):(b1 ++ (drop 1 b2))
    in
      (f2,w2,s2):(ans'' (t-w2) y)

ans' x =
  let s = sortBy (\ (f1,w1,s1) (f2,w2,s2) -> compare w2 w1) x
      t = foldr (\ (f1,w1,s1) a -> w1+a) 0 x
  in
    ans'' t s

ans (["0"]:_) = []
ans ([n]:x) = 
  let n' = read n :: Int
      d  = map (\[f,w,s] -> (f,(read w), (read s)) ) $ take n' x :: [(String,Int,Int)]
      r  = drop n' x
      a  = ans' d
  in
    a  ++ (ans r)

main = do
  c <- getContents
  let i = map words $ lines c
      o = ans i
  mapM_ putStrLn $ map (\(f,w,s) -> f) o
