mov (x,y) (dir,len) =
  case dir of
    "N" -> (x,y+len)
    "E" -> (x+len,y)
    "W" -> (x-len,y)
    "S" -> (x,y-len)

inside s d j = ( (s <= j) && (j <= d) ) || ( (d <= j) && (j <= s) )

pick :: (Int,Int) -> (Int,Int) -> [(Int,Int)] -> [(Int,Int)]
pick _ _ [] = []
pick s@(sx,sy) d@(dx,dy) (j@(jx,jy):js) =
  if (inside sx dx jx) && (inside sy dy jy)
  then pick s d js
  else j:(pick s d js)

ans' :: [(Int,Int)] -> (Int,Int) -> [(String,Int)] -> [(Int,Int)]
ans' [] _ _ = []
ans' j s [] = [s]
ans' j s (c:cs) =
  let d = mov s c
      j'= pick s d j
  in
    ans' j' d cs

ans x =
  let n = read $ head $ head x :: Int
      j = map (\[a,b]->(read a,read b)) $ take n $ drop 1 x :: [(Int,Int)]
      m = read $ head $ head $ drop (n+1) x :: Int
      c = map (\[a,b]->(a,read b)) $ take m $ drop (n+2) x :: [(String,Int)]
      r = drop (n+m+2) x
      a = ans' j (10,10) c
      b = if a == [] then "Yes" else "No"
  in
    if n == 0 then [] else (b:(ans r))

main = do
  c <- getContents
  let i = map words $ lines c
      o = ans i
  mapM_ putStrLn o 
