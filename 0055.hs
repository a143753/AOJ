seqe a =
  let b = 2*a
  in
    b : seqo b

seqo a =
  let b = a/3
  in
    b : seqe b

seq' :: Double -> [Double]
seq' a = (a : seqe a)

ans x = sum $ take 10 $ seq' x

main = do
  c <- getContents
  let i = map read $ lines c :: [Double]
      o = map ans i
  mapM_ print o
