import Data.List

ans (a':b':c':_) =
  let a = drop 1 a'
      b = drop 1 b'
      c = drop 1 c'
      r = (c \\ a) `union` (b `intersect` c)
  in
    length r

main = do
  _ <- getLine
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  print o
  
