scr s1 ss s n
  = s1 * n + ss * (n `div` s)

ans (l1:l2:l3:_) =
  let [h1,h2] = l1
      [k1,k2] = l2
      [a,b,c,d] = l3
      h = (scr a c 10 h1) + (scr b d 20 h2)
      k = (scr a c 10 k1) + (scr b d 20 k2)
  in
    if h == k
    then "even"
    else if h > k
         then "hiroshi"
         else "kenjiro"

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  putStrLn o
