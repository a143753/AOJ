-- play _ _ (x:[]) = x
-- play m i (th:ts) =
--   if m == i
--   then play m 1 ts
--   else play m (i+1) (ts++[th])

-- ans [n,m] =
--   let t = [1..n]
--   in
--     play m 1 t

get ([v,n]:xs) =
  if n == 1
  then v
  else get xs

play 1 _ _ x = get x
play n m i (th@[v,n]:ts) =
  if m == i
  then play (n-1) m 1 [v,0]:ts
  else play n m (i+1) (ts++[th])

ans [n,m] =
  let t = zip [1..n] $ repeat 1
  in
    play m 1 t

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      i'= takeWhile (/= [0,0]) i
      o = map ans i'
  mapM_ print o
