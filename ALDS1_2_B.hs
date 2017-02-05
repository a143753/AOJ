ans :: (Int,[Int]) -> (Int,[Int])
ans (n,[]) = (n,[])
ans (n,x@(xh:[])) = (n,x)
ans (n,x@(xh:xs)) = 
  let m = minimum xs
      h = takeWhile (> m) xs
      r = drop 1 $ dropWhile (> m) xs
  in
    if xh <= m -- no exchange
    then
      let (tn,tx) = ans (n,xs)
      in (tn,(xh:tx))
    else
      let el = h ++ (xh:r)
          (tn,tx) = ans (n, el)
      in (tn+1,(m:tx))

main = do
  n <- getLine
  i <- getLine
  let n' = read n :: Int
      i' = map read $ words i :: [Int]
      (on,ol)  = ans (0,i')
  putStrLn $ unwords $ map show ol
  print on
