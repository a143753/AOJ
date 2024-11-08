mul [] = 1
mul (a:as) = a * (mul as)

takeSub r = map tail $ takeWhile (\ a -> '.' == (head a)) r
dropSub r = dropWhile (\ a -> '.' == (head a)) r

func op r = op $ calc2 $ takeSub r

calc2 [] = []
calc2 ("+":r) = (func sum r):(calc2 $ dropSub r)
calc2 ("*":r) = (func mul r):(calc2 $ dropSub r)
calc2 (n:r) = (read n):(calc2 r)

calc1 ("+":r) = func sum r
calc1 ("*":r) = func mul r

calc1 (n:_) = read n :: Int

ans ("0":_) = []
ans (n:ns) =
  let n'= read n :: Int
      d = take n' ns
      r = drop n' ns
      a = calc1 d
  in
    a:(ans r)

main = do
  c <- getContents
  let i = lines c
      o = ans i
  mapM_ print o
