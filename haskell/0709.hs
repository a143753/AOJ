import Data.List

pack [] = []
pack(x:xs) = (x, 1 + (length $ takeWhile (== x) xs)) : pack (dropWhile (== x) xs)

ans s = if l >= 3 then "Yes" else "No"
  where
    l = length $ pack $ sort $ s

main = do
  n <- read <$> getLine :: IO Int
  s <- getLine
  let o = ans $ take n s
  putStrLn o
