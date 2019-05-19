ans [h,w,x,y] = if c then "No" else "Yes" 
  where
    c = (odd (h*w)) && (odd (x+y))

main = do
  l <- getLine
  let i = map read $ words l :: [Int]
      o = ans i
  putStrLn o
