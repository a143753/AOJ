v = [ 10000, 5000, 1000, 500 ]

ans _ [] = 0
ans i (v:vs) =
  let d = i `div` v
      r = i `mod` v
  in
    (d * v) + (ans r vs)

main = do
  l <- getLine
  let i = read l :: Int
      o = ans i v
  print o
