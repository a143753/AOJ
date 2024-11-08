import Data.List
import Text.Printf

ans i =
  let g1 = take 2 $ sortBy (\ (a,b) (c,d) -> compare b d) $ take 8 i
      g2 = take 2 $ sortBy (\ (a,b) (c,d) -> compare b d) $ drop 8 $ take 16 i
      g3 = take 2 $ sortBy (\ (a,b) (c,d) -> compare b d) $ drop 16 i
      r1 = i \\ g1
      r2 = r1 \\ g2
      r3 = r2 \\ g3
      rr = take 2 $ sortBy (\ (a,b) (c,d) -> compare b d) $ r3
  in
    g1 ++ g2 ++ g3 ++ rr
    
main = do 
  c <- getContents
  let i = map (\ [a,b] -> (read a, read b) ) $ map words $ lines c :: [(Int,Float)]
      o = ans i
  mapM_ (\(a,b) -> printf "%d %.02f\n" a b) o
