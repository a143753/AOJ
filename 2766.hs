import Data.Char

rep 0 _ x = x
rep n a ((f,d):ds) =
  if f == 0 && a /= d
  then (1,a):(rep (n-1) a ds)
  else (0,d):(rep n a ds)

ans b d =
  let zd = zip (repeat 0) b
      nz = length $ filter (== 0) b
      no = length $ filter (== 1) b
      rz = if nz > d then d else nz
      ro = if (d-rz) == 0 then 0 else d-rz
      sq = reverse $ rep ro 0 $ reverse $ rep rz 1 zd
  in
    map (intToDigit . snd) sq

main = do
  _ <- getLine
  b <- getLine
  d <- getLine
  let b' = map digitToInt b :: [Int]
      d' = read d :: Int
      o  = ans b' d'
  putStrLn o
