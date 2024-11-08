import Data.Char

pick :: String -> [Int]
pick [] = []
pick x@(xh:xs)
  | isDigit(xh) =
      let num = read $ takeWhile isDigit x
          res = dropWhile (isDigit) x
      in
        num:(pick res)
  | otherwise = pick xs

ans x = sum $ pick x

main = do
  c <- getContents
  let o = ans c
  print o
