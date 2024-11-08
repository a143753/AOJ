import Text.Printf

ans ([n,t]:xx) =
  let n' = ceiling n :: Int
      g = maximum $ map (\[x,h] -> t * h / x) $ take n' xx
  in
    g
    
main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Double]]
      o = ans i
  printf "%.6f\n" o
