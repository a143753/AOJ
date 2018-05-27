ans'' i (h0,w0) (h1,w1) =
  let d = minimum [abs(h1-h0),abs(w1-w0)]
  in
    d * ((i!!(h1-1))!!(w1-1))

ans' i (h,w) (h0,w0) =
  let p = concat $ map (\h0 -> map (\w0 -> (h0,w0)) [1..w]) [1..h]
  in
    sum $ map (ans'' i (h0,w0)) p

ans h w i =
  let p = concat $ map (\h0 -> map (\w0 -> (h0,w0)) [1..w]) [1..h]
  in
    minimum $ map (ans' i (h,w)) p
    
main = do
  l <- getLine
  c <- getContents
  let [h,w] = map read $ words l :: [Int]
      i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans h w i
  print o
