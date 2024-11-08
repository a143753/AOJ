import Data.List

concat' :: [String] -> String
concat' (x:[]) = x
concat' (x0:x1:xs) = concat' ((x0++"\n"++x1):xs)

ans' x =
  let w = map words x
      s = map (\(n:w:l:d:_) -> (n, 3*read(w)+1*read(d)) ) w
      z = zip [1..] s
      a = sortBy (\(z0,(n0,s0)) (z1,(n1,s1)) -> let c = compare s1 s0
                                                in if c == EQ
                                                   then compare z0 z1
                                                   else c ) z
  in
    unlines $ map (\(_,(n,s)) -> n++","++show(s)) a

ans (n:x) =
  let n' = read n :: Int
      d  = take n' x
      r  = drop n' x
  in
    if n' == 0
    then []
    else (ans' d):(ans r)

main = do
  c <- getContents
  let i = lines c
      o = ans i
  putStr $ concat' o

