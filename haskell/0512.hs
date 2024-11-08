import Data.Char

ans = map chr . map (\x -> if x >= (ord 'D')
                           then x - 3
                           else x - (ord 'A') + (ord 'X') ) . map ord
main = do
  l <- getLine
  let o = ans l
  putStrLn o
