-- bubble sort
iter :: [Int] -> (Bool,Int,[Int])
iter []     = (False,0,[])
iter (x:[]) = (False,0,(x:[]))
iter (x0:x1:xs) =
  let (f,n,x) = if x0 > x1
                then iter (x0:xs)
                else iter (x1:xs)
  in
    if x0 > x1
    then (True,n+1,x1:x)
    else (f,   n  ,x0:x)

ans n x = 
  let (f,n',x') = iter x
  in 
    if f
    then ans (n'+n) x'
    else (n'+n,x')

ans' (0:_) = []
ans' (n:x) =
  let d = take n x
      r = drop n x
  in
    (ans 0 d):(ans' r)

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = ans' i
  mapM_ (\(n,_) -> print n) o
