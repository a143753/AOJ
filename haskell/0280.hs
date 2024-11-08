ans' t n c h ("M":ss)
ans' t n c h ("S":ss)
ans' t n c h ("L":ss)
  
  

ans n s =
  ans' 0 n c h s
  where
    c = take n $ repeat []
    h = []

main = do
  n <- getLine
  s <- getLine
  let n' = read n :: Int
      o  = ans n' s
  print o
  
