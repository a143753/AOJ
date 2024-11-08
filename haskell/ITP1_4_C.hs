import Text.Printf

trunc :: [[String]] -> [[String]]
trunc [] = []
trunc (x@(a:op:b:_):s)
  | op == "?" = []
  | otherwise = x:(trunc s)

ans :: [String] -> String
ans (a:op:b:_)
  | op == "+" = show $ (read a) + (read b)
  | op == "-" = show $ (read a) - (read b)
  | op == "*" = show $ (read a) * (read b)
  | op == "/" = show $ (read a) `div` (read b)
  | op == "?" = []

main = do
  c <- getContents
  let i = map words $ lines c
      j = trunc i
      a = map ans j
  mapM_ (putStrLn) a
