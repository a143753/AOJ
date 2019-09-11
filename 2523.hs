splitBy :: Char -> String -> [String]
splitBy _ [] = []
splitBy a x =
  let s = takeWhile (/= a) x
      x'= dropWhile (/= a) x
  in
    if x' == []
    then [s]
    else s:(splitBy a $ drop 1 x')

f :: Integer -> String -> Integer
f n ('n':'^':s) =
  let m = read s :: Integer
  in
    n ^ m

ans n t s =
  let a = splitBy '+' s
      v = (* t) $ sum $ map (f n) a
  in
    if v <= 1000000000 then show(v) else "TLE"

main = do
  nt <- getLine
  s  <- getLine
  let [n,t] = map read $ words nt :: [Integer]
      o     = ans n t s
  putStrLn o
