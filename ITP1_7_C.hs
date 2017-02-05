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

to_str :: [[Int]] -> String
to_str [] = ""
to_str (line:lines) =
  let sl = unwords $ map show line
      ss = to_str lines
  in
    (sl++"\n"++ss)

main = do
  c <- getContents
  let l = map (map read) $ map words $ lines c :: [[Int]]
      o = ans $ drop 1 l
  putStr $ to_str o
