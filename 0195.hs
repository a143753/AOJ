import Data.List
import Text.Printf

ans ([0,0]:_) = []
ans x =
  let d = take 5 x
      r = drop 5 x
      a = maximumBy (\(a,b) (c,d)-> compare b d) $ zip ['A','B'..] $ map (\[x,y] -> x + y) d
  in
    a:(ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ (\(a,b) -> printf "%c %d\n" a b) o
