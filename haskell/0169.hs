ans' cnst ones =
  let d = 21 - cnst - ones
      p = min ones (d `div` 10)
  in
    if cnst + ones > 21
    then 0
    else cnst + ones + p * 10

ans x =
  let ones = length $ filter (== 1) x
      othr = filter (/= 1) x
      cnst = sum $ map (\v -> if v >= 10 then 10 else v) othr
  in
    ans' cnst ones

main = do
  c <- getContents
  let i = takeWhile (/= [0]) $ map (map read) $ map words $ lines c
      o = map ans i
  mapM_ print o
