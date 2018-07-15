ans' d =
  let s = map sum d
      mx= maximum s
      mn= minimum s
  in
    [mx,mn]

ans ([0]:_) = []
ans ([n]:x) = 
  let d = take n x
      r = drop n x
      a = ans' d
  in
    a:(ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c
      o = ans i
  mapM_ putStrLn $ map unwords $ map (map show) o
