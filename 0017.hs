import Data.Char
key = ["the", "this", "that"]

f n a =
  if a == '.' || a == ' '
  then a
  else 
    let i = (ord a) - (ord 'a')
        o = (n + i) `mod` 26
    in
      chr (o + ord 'a')

try w =
  filter(\(n,w) -> w=="the" || w=="this" || w=="that") $ map (\n -> (n,map (f n) w)) [0..25]

ans s =
  let c = filter (\x->length(x)==3 || length(x)==4 ) s
      r = map try c
      (n,_) = head $ concat r
  in
    map (map (f n)) s


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

main = do
  c <- getContents
  let i = map spt $ lines c
      o = map ans i
  mapM_ putStrLn $ map concat o
