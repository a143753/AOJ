ans (xa1:ya1:xa2:ya2:xb1:yb1:xb2:yb2:_) =
  if (yb1 > ya2 || yb2 < ya1) || (xb2 < xa1 || xb1 > xa2)
  then "NO"
  else "YES"

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Double]]
      o = map ans i
  mapM_ putStrLn o
  
