split _ [] = []
split n x = (take n x):(split n $ drop n x)

ans ([n,m]:as) =
  let g = lcm n m
      s = split m $ concat $ take (g`div`n) $ cycle as
      r = sum $ map (\x -> (maximum x) - (minimum x)) s
  in
    r

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c
      o = ans i
  print o
