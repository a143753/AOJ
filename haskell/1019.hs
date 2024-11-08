sumup' [] [] = []
sumup' (x:xs) (y:ys) = (x+y):(sumup' xs ys)

sumup (x:[]) = x
sumup (x0:x1:xs) = sumup ((sumup' x0 x1):xs)

comp [] [] = True
comp (x:xs) (y:ys) =
  if x >= y
  then comp xs ys
  else False

ans' s d =
  let r = sumup d
      c = comp s r
  in
    if c
    then "Yes"
    else "No"

ans ([0,0]:_) = []
ans ([n,k]:s:x) =
  let d = take n x
      r = drop n x
  in
    (ans' s d):(ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c
      o = ans i
  mapM_ putStrLn o
