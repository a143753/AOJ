import Data.List
import System.IO

f :: (Int,Int) -> Int -> (Int,Int)
f (m,a) x =
  let m' = min m x
      a' = max a (x-m)
  in
    (m',a')

exec :: (Int,Int) -> IO (Int,Int)
exec (m,a)= do
  l <- getLine
  let i = read l :: Int
      o = (m,a) `seq` i `seq` f (m,a) i
  eof <- isEOF
  if eof
  then return o
  else exec o

main = do
  n <- getLine
  (_,o) <- exec (2000000000,-2000000000)
  print o
