aizu q1 b c1 q2 =
  let q = min q1 q2
      g = if b >= q2 * c1
          then q2
          else b `div` c1
  in
    g
norm b c2 = b `div` c2

ans' q1 b c1 c2 a =
  if a <= 0
  then "NA"
  else
    let n = norm (b-a*c1) c2
    in
      if a + n >= q1
      then (show a) ++ " " ++ (show n)
      else ans' q1 b c1 c2 (a-1)

ans (q1:b:c1:c2:q2:_) =
  let a = aizu q1 b c1 q2
  in
    ans' q1 b c1 c2 a

main = do
  c <- getContents
  let i = takeWhile (/= [0]) $ map (map read) $ map words $ lines c :: [[Int]]
      o = map ans i
  mapM_ putStrLn o
