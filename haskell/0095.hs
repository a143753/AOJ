import Data.List
import Text.Printf

ans x = maximumBy (\(a,b) (c,d) -> if b /= d
                                   then compare b d
                                   else compare c a ) x

main = do
  _ <- getLine
  c <- getContents
  let i = map (\[a,b] -> (a,b)) $ map (map read) $ map words $ lines c :: [(Int,Int)]
      (a,b) = ans i
  printf "%d %d\n" a b
