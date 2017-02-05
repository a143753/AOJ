import Text.Printf

ans :: (Int,Int) -> [String] -> (Int,Int)
ans (n,m) (a:b:_) =
  if a == b
  then (n+1,m+1)
  else
    if a > b
    then (n+3,m)
    else (n,m+3)

main = do
  c <- getContents
  let i = map words $ drop 1 $ lines c
      o = foldl ans (0,0) i
  printf "%d %d\n" (fst o) (snd o)
