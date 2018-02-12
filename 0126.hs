import Data.List

g n = [n, n+1, n+2,n+9,n+10,n+11,n+18,n+19,n+20]
h n = map (\i -> i * 9 + n) [0..8]

gp = [ [ 0.. 8], [ 9..17], [18..26], [27..35], [36..44], [45..53], [54..62], [63..71], [72..80],
       (g 0), (g 3), (g 6), (g 27), (g 30), (g 33), (g 54), (g 57), (g 60),
       (h 0), (h 1), (h 2), (h 3), (h 4), (h 5), (h 6), (h 7), (h 8)]

chk g =
  let m = concat $ filter (\f -> length(f) > 1) $ map (\ n -> filter (\(i,v) -> v == n) g) [1..9]
  in
    m

to_s' :: [Int] -> (Int,Int) -> String
to_s' p (i,v) =
  if elem i p
  then '*':(show v)
  else ' ':(show v)

to_s :: [Int] -> [(Int,Int)] -> String
to_s _ [] = []
to_s p x =
  let d = concat $ map (to_s' p) $ take 9 x
      r = drop 9 x
  in
    d ++ "\n" ++ (to_s p r)

ans' x =
  let z  = zip [0..] x
      gs = map (\g -> filter (\(i,v) -> elem i g) z ) gp
      gr = map fst $ concat $ map chk gs
  in
    to_s gr z

ans [] = []
ans x =
  let i = concat $ take 9 x
      r = drop 9 x
  in
    (ans' i):(ans r)

pr (l:[]) = do
  putStr l
pr (l:ls) = do
  putStrLn l
  pr ls

main = do
  _ <- getLine
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  pr o
