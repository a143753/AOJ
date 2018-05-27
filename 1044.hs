import Data.Char

splitBy :: Char -> String -> [String]
splitBy _ [] = []
splitBy a x =
  let s = takeWhile (/= a) x
      x'= dropWhile (/= a) x
  in
    if x' == []
    then [s]
    else s:(splitBy a $ drop 1 x')

splitC [] = []
splitC (x:xs) =
  let s = takeWhile (\a -> ord(a) >= ord('a') && ord(a) <= ord('z')) xs
      r = dropWhile (\a -> ord(a) >= ord('a') && ord(a) <= ord('z')) xs
      x'= toLower x
  in
    (x':s):(splitC r)

split' s = 
  let s1 = splitBy '_' s
      s2 = concat $ map splitC s1
  in
    s2

camel (s:sx) = ( toUpper s):sx

cnv 'X' _ = []
cnv 'U' [] = []
cnv 'U' (x:xs) = (camel x) ++ cnv 'U' xs
cnv 'L' [] = []
cnv 'L' (x:xs) = x ++ cnv 'U' xs
cnv 'D' (x:[]) = x
cnv 'D' (x:xs) = x ++ "_" ++ cnv 'D' xs

ans [t,c] = cnv (c!!0) $ split' t

main = do
  c <- getContents
  let i = filter(\[a,b] -> b /= "X") $ map words $ lines c
      o = map ans i
  mapM_ putStrLn o
