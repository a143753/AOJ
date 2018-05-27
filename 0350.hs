--     d = 0.(3)
--   10d = 3.(3)
--    9d = 3

--     d =    5.2(143)
-- 1000d = 5214.3(143)

ans l =
  let a = takeWhile (/= '(') l
      b = takeWhile (/= ')') $ drop 1 $ dropWhile (/= '(') l
      s = length b
      p = length $ drop 1 $ dropWhile (/= '.') a
      a'= read $ filter (/= '.') a
      b'= read $ filter (/= '.') (a++b)
      n = if a' == b'
          then a'
          else b' - a'
      d = if a' == b'
          then 10^p
          else 10^(s+p) - 10^p
      g = gcd n d
  in
    (n `div` g, d `div` g)

main = do
  l <- getLine
  let (n,d) = ans l
  putStrLn $ (show n)++"/"++(show d)
