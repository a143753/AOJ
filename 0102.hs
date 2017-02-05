import Text.Printf

add :: [Int] -> [Int] -> [Int]
add [] _ = []
add _ [] = []
add (x:xs) (y:ys) = (x+y):(add xs ys)

acm :: [[Int]] -> [Int]
acm (x1:[]) = x1
acm (x1:xs) =
  add x1 $ acm xs
  
ans :: [[Int]] -> [[Int]]
ans lst =
  let s1 = map (\r -> r ++ [sum r]) lst
      s2 = acm s1
  in
    s1 ++ [s2]

play :: [[Int]] -> [[Int]]
play ([0]:_) = []
play (n:xs) =
  let n' = n!!0
      a = ans  $ take n' xs
      b = play $ drop n' xs
  in
    a ++ b

to_str :: [[Int]] -> String
to_str [] = ""
to_str (line:lines) =
  let sl = concat $ map (printf "%5d") line
      ss = to_str lines
  in
    (sl++"\n"++ss)

main = do
  c <- getContents
  let l = map (map read) $ map words $ lines c :: [[Int]]
      o = play l
  putStr $ to_str o
