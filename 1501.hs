import Data.List

kai 0 = 1
kai 1 = 1
kai n = n * kai (n-1)

dist m s d =
  let d1 = abs $ s - d
      d2 = m - d1
      mn = minimum [d1,d2]
      c  = if d1 == d2 then 2 else 1
  in
    (mn,c)

ans [mx,my,sx,sy,dx,dy] =
  let (x,cx) = dist mx sx dx
      (y,cy) = dist my sy dy
      a = kai (x+y)
      b = kai x
      c = kai y
  in
     ( a `div` b `div` c * cx * cy ) `mod` 100000007

main = do
  l <- getLine
  let i = map read $ words l :: [Integer]
      o = ans i
  print o
