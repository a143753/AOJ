ans' [] = [0]
ans' (0:xs) = ans' xs
ans' x@(1:xs) =
  let n = length $ takeWhile (== 1) x
      r = dropWhile (== 1) x
  in
    n:(ans' r)

ans i = 1 + (maximum $ ans' i)

main = do
  _ <- getLine
  l <- getLine
  let i = map read $ words l :: [Int]
      o = ans i
  print o
