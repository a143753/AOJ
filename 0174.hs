ans str =
  let na = length $ filter (== 'A') $ drop 1 str
      nb = length $ filter (== 'B') $ drop 1 str
  in
    if na > nb
    then [na+1,nb]
    else [na,nb+1]

main = do
  c <- getContents
  let i = takeWhile (/= "0") $ lines c
      o = map ans i
  mapM_ putStrLn $ map unwords $ map (map show) o
