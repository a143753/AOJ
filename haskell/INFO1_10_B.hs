import Data.Char (ord)
main = do
  c <- head <$> getLine
  putStrLn $ show $ ord c
