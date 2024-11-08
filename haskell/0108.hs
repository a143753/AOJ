cnv s =
  map (\ss -> length $ filter (== ss) s) s

ans n s =
  let c = cnv s
  in
    if c == s
    then (n,s)
    else ans (n+1) c

ans' ([0]:_) = []
ans' ([n]:s:r) =
  (ans 0 s):(ans' r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans' i
  mapM_ putStrLn $ map (\(n,s) -> (show n) ++ "\n" ++ (unwords $ map show s) ) o
