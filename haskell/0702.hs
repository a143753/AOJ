import Data.Char

f c = if isUpper c then toLower c else toUpper c

ans k n = h ++ (map f t)
  where
    h = take (k-1) n
    t = drop (k-1) n

main = do
  [_,k] <- map read <$> words <$> getLine :: IO [Int]
  a <- getLine
  let o = ans k a
  putStrLn o
  
