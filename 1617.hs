data T = W | C deriving Show

parse [] = []
parse ('\"':r) =
  let w = takeWhile (/= '\"') r
      r'= dropWhile (/= '\"') r
  in
    (C,w):(parse $ tail r')
parse (a:r) =
  let w = takeWhile (/= '\"') r
      r'= dropWhile (/= '\"') r
  in
    (W,(a:w)):(parse r')

cmp n [] [] = if n == 0 then "IDENTICAL" else "CLOSE"
cmp n _ [] = "DIFFERENT"
cmp n [] _ = "DIFFERENT"
cmp n ((W,w1):d1) ((W,w2):d2) =
  if w1 /= w2
  then "DIFFERENT"
  else cmp n d1 d2
cmp n ((C,w1):d1) ((C,w2):d2) =
  if w1 /= w2
  then if n == 0
       then cmp 1 d1 d2
       else "DIFFERENT"
  else cmp n d1 d2
cmp n ((_,w1):d1) ((_,w2):d2) = "DIFFERENT"

ans' s1 s2 = 
  let t1 = parse s1
      t2 = parse s2
  in
    cmp 0 t1 t2

ans (".":_) = []
ans (s1:s2:ss) = (ans' s1 s2):(ans ss)
main = do
  c <- getContents
  let i = lines c
      o = ans i
  mapM_ putStrLn o
