ans (b:r:g:c:s:t:_) =
  let n = t - (b+r+g+c+s) - (s) - (b*5) - (r*3)
  in
    100 - (3*(b+r+g+c+s+n)) - (2*(b*5+r*3)) + (15*(b*5+r*3)) + (15*b) + (15*r) + (7*g) + (2*c)

main = do
  c <- getContents
  let i = takeWhile (/= [0,0,0,0,0,0]) $ map (map read) $ map words $ lines c :: [[Int]]
      o = map ans i
  mapM_ print o

