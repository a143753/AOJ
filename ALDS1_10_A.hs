fib 0 a b = b
fib n a b = fib (n-1) (a+b) a

ans n = fib n 1 1

main = do
  n' <- getLine
  let n = read n' :: Int
      o = ans n
  print o
