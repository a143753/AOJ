ans n k s =
  let r = length $ filter (== 'R') s
  in
    if k == r then "W" else "R"

main = do
  n <- readLn :: IO Int
  k <- readLn :: IO Int
  s <- getLine
  let o = ans n k s
  putStrLn o
