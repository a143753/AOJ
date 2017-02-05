import Text.Printf
import Data.Char

ans :: [Char] -> String -> [Int]
ans [] _ = []
ans (c:cs) text =
  (length $ filter (==c) text):(ans cs text)

main = do
  c <- getContents
  let a = ['a'..'z']
      o = ans a $ map toLower c
      t = zip a o
  mapM_ (\(a,b) -> printf "%c : %d\n" a b) t

