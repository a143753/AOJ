ans _ [] _ = []
ans i t w =
  let l = length w
      w'= take l t
      r = ans (i+1) (drop 1 t) w
  in
    if w == w'
    then i:r
    else r

main = do
  t <- getLine
  w <- getLine
  let o = ans 0 t w
  mapM_ print o
