import Data.Char
f a b r =
  if r == ' '
  then r
  else 
    let i = (ord r) - (ord 'a')
        o = (a * i + b) `mod` 26
    in
      chr (o + ord 'a')

try w =
  concat $ map (\ww -> [(a,b) | a <- [0..25], b <- [0..25], (map (f a b) w)==ww ]) ["this","that"]

spt :: String -> [String]
spt [] = []
spt s@(sh:ss)
  | sh == ' ' || sh == '.' = let ss = takeWhile (== sh) s
                                 rr = dropWhile (== sh) s
                             in
                               ss:(spt rr)
spt s@(sh:ss) =
  let ss = takeWhile (\c -> c /= ' ' && c /= '.') s
      rr = dropWhile (\c -> c /= ' ' && c /= '.') s
  in
    ss:(spt rr)

ans s =
  let w = filter (\x -> length(x) == 4) s
      (a,b) = head $ concat $ map try w
  in
    concat $ map (map (f a b)) s

main = do
  _ <- getLine
  c <- getContents
  let i = map spt $ lines c
      o = map ans i
  mapM_ putStrLn o
