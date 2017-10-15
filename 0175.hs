cnv 0 = [0]
cnv i =
  let d = i `mod` 4
      r = i `div` 4
  in
    if r /= 0
    then d:(cnv r)
    else [d]

ans i =
  let a = cnv i
      r = concat $ map show $ reverse a
  in
    r
main = do
  c <- getContents
  let i = takeWhile (/= -1) $ map read $ lines c :: [Int]
      o = map ans i
  mapM_ putStrLn o
  
