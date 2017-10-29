ans' n t [] = 0
ans' n t (x:xs) =
  let
    a = ans (n-1) (t-x)
  in
    a + (ans' n t xs)

ans 2 t =
  if t > 2000
  then 0
  else if t > 1000
       then 2001 - t
       else t + 1

ans n t =
 if t > n * 1000
 then 0
 else
   let m = min t 1000
   in
--     sum $ map (\x -> ans (n-1) (t-x) ) $ reverse [0..m]
     ans' n t [0..m]
--     ans' n t $ reverse [0..m]
--     ans' n t $ reverse [0..1000]

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = map (ans 4) i
  mapM_ print o
