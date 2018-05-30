t = [ ('m',1000), ('c',100), ('x',10), ('i',1) ]
s = map fst t

str2dec [] = 0
str2dec str =
  let n = takeWhile (\c -> not $ elem c s) str
      r = dropWhile (\c -> not $ elem c s) str
      h = head r
      h'= snd $ head $ filter (\ e -> h == fst e) t
      n'= if n == [] then 1 else (read n)
      r'= tail r
  in
    n'*h' + (str2dec r')

dec2str' _ [] = []
dec2str' 0 _ = []
dec2str' dec ((s,v):ts) =
  let n = dec `div` v
      r = dec `mod` v
      c = case n of
            0 -> ""
            1 -> [s]
            otherwise -> (show n) ++ [s]
  in
    c ++ (dec2str' r ts)

dec2str dec = dec2str' dec t

ans i =
  dec2str $ sum $ map str2dec i

main = do
  _ <- getLine
  c <- getContents
  let i = map words $ lines c
      o = map ans i
  mapM_ putStrLn o
        
