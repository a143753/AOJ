splitBy :: Char -> String -> [String]
splitBy _ [] = []
splitBy a x =
  let s = takeWhile (/= a) x
      x'= dropWhile (/= a) x
  in
    if x' == []
    then [s]
    else s:(splitBy a $ drop 1 x')

int x =
  if x >= 0
  then floor x
  else ceiling x

ans _ (x,y) [] = (x,y)
ans ang (x,y) ([d,r]:xs) =
  let y' = y + d * (cos (pi*ang/180))
      x' = x + d * (sin (pi*ang/180))
      a' = ang + r
  in
    ans a' (x',y') xs

main = do
  c <- getContents
  let i = map (map read) $ map (splitBy ',') $ lines c :: [[Float]]
      o = ans 0 (0,0) i
      x = int $ fst o
      y = int $ snd o
  print x
  print y
