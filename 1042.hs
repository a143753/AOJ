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

ans s = map intToDigit $ map length $ splitBy ' ' s

main = do
  c <- getContents
  let i = takeWhile (/= "END OF INPUT") $ lines c
      o = map ans i
  mapM_ putStrLn o
  
