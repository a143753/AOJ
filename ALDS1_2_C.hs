import Data.List
import Text.Printf

rd :: String -> (Char,Int)
rd (c:n) = (c,read(n)) 
sh :: (Char,Int) -> String
sh (c,n) = printf "%c%d" c n

cmp (_,n1) (_,n2) = compare n1 n2
gt (_,n1) (_,n2) = n1 >  n2
lt (_,n1) (_,n2) = n1 <  n2

-- bubble sort
bubble_iter []     = (False,0,[])
bubble_iter (x:[]) = (False,0,(x:[]))
bubble_iter (x0:x1:xs) =
  let (f,n,x) = if x0 `gt` x1
                then bubble_iter (x0:xs)
                else bubble_iter (x1:xs)
  in
    if x0 `gt` x1
    then (True,n+1,x1:x)
    else (f,   n  ,x0:x)

bubble_sort n x = 
  let (f,n',x') = bubble_iter x
  in 
    if f
    then bubble_sort (n'+n) x'
    else (n'+n,x')

select_sort [] = []
select_sort (x:[]) = (x:[])
select_sort (x0:x1:[]) =
  if x1 `lt` x0
  then (x1:x0:[])
  else (x0:x1:[])
select_sort (x0:xs) =
  let m = minimumBy cmp xs
      h = takeWhile (/= m) xs
      t = tail $ dropWhile (/= m) xs
  in
    if m `lt` x0
    then m:(select_sort $ h ++ [x0] ++ t)
    else x0:(select_sort xs)
   
main = do
  n <- getLine
  c <- getLine
  let i = words c
      o = map rd i
      (_,b) = bubble_sort 0 o
      s = select_sort o
  putStrLn $ unwords $ map sh b
  putStrLn "Stable"
  putStrLn $ unwords $ map sh s
  let r = if b == s
          then "Stable"
          else "Not stable"
  putStrLn r
