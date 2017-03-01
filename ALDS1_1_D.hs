import Data.List
import System.IO

f (m,a) x =
  let m' = min m x
      a' = max a (x-m)
  in
    (m',a')

ans :: [Int] -> (Int,Int)
ans x = 
  let (x0:y@(x1:xs)) = x
      init_max  = x1 - x0
  in
    foldl' f (x0,init_max) y

exec :: (Int,Int) -> IO (Int,Int)
exec (m,a)= do
  l <- getLine
  let i = read l
      o = f (m,a) i
  eof <- isEOF
  if eof
  then return o
  else exec o

main = do
  n <- getLine
  c <- getContents
  let i = map read $ lines c :: [Int]
      (_,o) = ans i
  print o

