import Data.List

ans i =
  let s = map sort i
      t = takeWhile (\[a,b,c] -> a+b > c) s
      n = filter (\[a,b,c] -> a*a+b*b == c*c) t
      e = filter (\[a,b,c] -> a*a+b*b >  c*c) t
      d = filter (\[a,b,c] -> a*a+b*b <  c*c) t
  in
    [length t, length n, length e, length d]

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  putStrLn $ unwords $ map show o
