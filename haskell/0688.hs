ans a b =
  let l = [ a + b, a - b] 
  in
    [ maximum l, minimum l ]

main = do
  [a,b] <- map read . words <$> getLine
  let o = ans a b
  mapM_ print o
