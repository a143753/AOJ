v = [1, 5, 10, 50, 100, 500 ]

acm [] [] = 0
acm (a:as) (b:bs) = (a*b) + acm as bs

ans i v =
  let a = acm i v
  in
    if a >= 1000
    then 1
    else 0

main = do
  l <- getLine
  let i = map read $ words l :: [Int]
      o = ans i v
  print o
      
