ans' h [] = h
ans' h ([p,c]:cs) =
  let x = take c $ drop (p-1) h
      y = take (p-1) h
      z = drop (p-1+c) h
  in
    ans' (x++y++z) cs
  
ans ([0,0]:_) = []
ans ([n,r]:xs) =
  let c = take r xs
      y = drop r xs
      h = reverse [1..n]
      a = head $ ans' h c
  in
    a:(ans y)
    
main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o
