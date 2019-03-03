ans 2 t =
  if t > 2000
  then 0
  else if t > 1000
       then 2001 - t
       else t + 1

ans 4 t =
    sum $ map (\i -> let a = ans 2 i
                         b = ans 2 (t-i)
                     in
                         a * b ) [0..t]

main = do
  c <- getContents
  let i = map read $ lines c :: [Integer]
      o = map (ans 4) i
  mapM_ print o
