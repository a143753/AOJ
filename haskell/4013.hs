ans (d:x:y:_) =
  if d >= (abs x) + (abs y) then "Yes" else "No"

main = do
  l <- getLine
  let i = map read $ words l :: [Int]
      o = ans i
  putStrLn o
