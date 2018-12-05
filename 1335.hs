ans' 1 s p =
  if elem s p then Just [[s]] else Nothing

ans' _ _ [] = Nothing

ans' k s (p:ps) =
  let a1 = ans' k s ps
      a2 = ans' (k-1) (s-p) ps
      a1'= case a1 of
             Just a -> a
             Nothing -> []
      a2'= case a2 of
             Just a -> map (\aa -> (p:aa) ) a
             Nothing -> []
  in
    Just (a1'++a2')

ans [n,k,s] =
  let p = [1..n]
      a = ans' k s p
  in
    case a of
      Just aa -> length aa
      Nothing -> 0

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = map ans $ takeWhile (\x -> x /= [0,0,0]) i
  mapM_ print o
  
