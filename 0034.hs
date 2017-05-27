splitBy :: Char -> String -> [String]
splitBy _ [] = []
splitBy a x =
  let s = takeWhile (/= a) x
      x'= dropWhile (/= a) x
  in
    if x' == []
    then [s]
    else s:(splitBy a $ drop 1 x')

chk i s r (l:ls) =
  if s + l >= r
  then i
  else chk (i+1) (s+l) r ls

solve i =
  let (v2:v1:l) = reverse i
      s = sum l
      r = s * v1 / (v1+v2)
  in
    chk 1 0 r $ reverse l

main = do
  c <- getContents
  let i = map (map read) $ map (splitBy ',') $ lines c :: [[Float]]
      o = map solve i
  mapM_ print o
