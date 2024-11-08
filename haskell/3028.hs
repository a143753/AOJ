import Data.List

cnv l = sortBy (\[i0,v0] [i1,v1] -> let cv = compare v1 v0
                                        ci = compare i0 i1
                                    in
                                      if ci /= EQ
                                      then ci
                                      else cv ) l

ans' _ [] _ = []
ans' n (l:ls) c =
  let a = take l $ takeWhile (\[i,_] -> i == n) c
      c'= dropWhile (\[i,_] -> i == n) c
  in
    a ++ (ans' (n+1) ls c')

ans m l c =
  let c'= cnv c
      a = ans' 1 l c'
      t = take m $ sortBy (\[_,v0] [_,v1] -> compare v1 v0) a
      s = sum $ map (\[_,v] -> v) t
  in
    s

main = do
  [_,m,_] <- fmap (map read . words) getLine :: IO [Int]
  l <- fmap (map read . words) getLine :: IO [Int]
  c <- fmap (map (map read) . map words . lines) getContents :: IO [[Int]]
  let o = ans m l c
  print o
