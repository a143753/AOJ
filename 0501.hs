table :: [String] -> [(Char, Char)]
table [] = []
table (x:xs) =
  let n = words x
      e = ( ((n!!0)!!0), ((n!!1)!!0) )
  in
    e:(table xs)

conv :: [(Char,Char)] -> Char -> Char
conv [] c = c
conv (t:ts) c
  | (fst t) == c = (snd t)
  | otherwise    = conv ts c

play:: [String] -> [String]
play [] = []
play ("":_) = []
play ("0":_) = []
play lines =
  let s  = read (lines!!0) :: Int
      l1 = drop 1 lines
      t  = table $ take s l1
      l2 = drop s l1
      n  = read (l2!!0) :: Int
      l3 = drop 1 l2
      i = concat $ take n l3
      o  = map (conv t) i
      l4 = drop n l3
  in
    (o:(play l4))

main = do
  c <- getContents
  let c' = filter (/='\r') c
  let o  = play $ lines c'
  mapM_ (putStrLn) o
