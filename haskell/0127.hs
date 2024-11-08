import Data.Char

ary = ["abcde","fghij","klmno","pqrst","uvwxy","z.?! "]

ans [] = Just []
ans (a:[])  = Nothing
ans (a:b:s) =
  let c = if (a <= 0 || a > 6) || (b <= 0 || b > 5)
          then Nothing
          else Just ((ary!!(a-1))!!(b-1))
      r = ans s
  in
    if c == Nothing || r == Nothing
    then Nothing
    else
      let Just c' = c
          Just r' = r
      in
        Just (c':r')

ans' x =
  let r = ans x
  in
    if r == Nothing
    then "NA"
    else
      let Just v = r
      in
        v

main = do
  c <- getContents
  let i = map (map digitToInt) $ lines c :: [[Int]]
      o = map ans' i
  mapM_ putStrLn o
