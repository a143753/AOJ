divisors m = [ x | x <- [1..m], m `mod` x == 0 ] 
g x y = y - x

ans l =
  let m = maximum l
      y = divisors m
      d = map (\x -> g x $ head $ dropWhile (< x) y ) l
  in
    sum d

main = do
  _ <- getLine
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = ans i
  print o
  
