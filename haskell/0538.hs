cnt' n ('O':'I':xs) = cnt' (n+1) xs
cnt' n x = n

cnt [] = []
cnt ('I':xs) = 
  let n = cnt' 0 xs
      r = drop (2*n) xs
  in
    n:(cnt r)

cnt ('O':xs) = cnt xs

ans ("0":_) = []
ans (n:_:s:xs) =
  let n' = read n :: Int
      r  = cnt s
      a  = sum $ map (\x -> if x >= n' then (x-n'+1) else 0) r
  in
    a:(ans xs)

main = do
  c <- getContents
  let i = lines c
      o = ans i
  mapM_ print o

