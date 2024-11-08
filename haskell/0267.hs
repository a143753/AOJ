pack [] = []
pack (0:xs) = pack xs
pack (x:xs) = x:(pack xs)

sub [] = []
sub (x:xs) = (x-1):(sub xs)

ans' n x =
  if x == take l [1..]
  then n
  else
    if n > 10000
    then -1
    else ans' (n+1) (y++[l])
  where
    l = length x
    y = pack $ sub x
    
ans ([0]:_) = []
ans ([n]:x:xs) =
  (ans' 0 x):(ans xs)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o
