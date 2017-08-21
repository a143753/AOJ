chk _ _ _ [] = "NA"
chk t s i (x:xs) =
  if (s+x) >= t
  then show(i)
  else chk t (s+x) (i+1) xs

ans ([0]:_) = []
ans ([n]:x) =
  let d = take 12 x
      r = drop 12 x
      a = chk n 0 1 $ map (\ [a,b] -> a - b) d
  in
    a:(ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c
      o = ans i
  mapM_ putStrLn o
