-- memory limit exceeded
import Data.List
import Text.Printf

ans' x = maximumBy (\(a,b) (c,d) -> if b /= d
                                    then compare b d
                                    else compare c a ) x

update ((a,b):x) (c,d) =
  if a == c
  then (a,b+d):x
  else (a,b):(update x (c,d))

ans t [] = []
ans t (i:is) =
  let u = update t i
      a = ans' u
  in
    a:(ans u is)
      
main = do
  l <- getLine
  c <- getContents
  let [n,q] = map read $ words l :: [Int]
      i = map (\[a,b] -> (a,b)) $ map (map read) $ map words $ lines c :: [(Int,Int)]
      o = ans (zip [1..n] $ repeat 0 ) i
  mapM_ (\ (a,b) -> printf "%d %d\n" a b) o

