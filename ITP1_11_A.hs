mov :: (Int,Int,Int,Int,Int,Int) -> Char -> (Int,Int,Int,Int,Int,Int)
mov (p1,p2,p3,p4,p5,p6) 'N' = (p2,p6,p3,p4,p1,p5)
mov (p1,p2,p3,p4,p5,p6) 'S' = (p5,p1,p3,p4,p6,p2)
mov (p1,p2,p3,p4,p5,p6) 'W' = (p3,p2,p6,p1,p5,p4)
mov (p1,p2,p3,p4,p5,p6) 'E' = (p4,p2,p1,p6,p5,p3)

ini :: [Int] -> (Int,Int,Int,Int,Int,Int)
ini (a:b:c:d:e:f:_) = (a,b,c,d,e,f)

ans state [] = state
ans state (a:as) =
  let next = mov state a
  in
    ans next as

main = do
  d <- getLine
  m <- getLine
  let a = ini $ map read $ words d :: (Int,Int,Int,Int,Int,Int)
      p@(p1,p2,p3,p4,p5,p6) = ans a m
  print p1
