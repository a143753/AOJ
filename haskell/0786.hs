import Data.List (sort)

ans _ [] = "Yes"
ans d (a1:a2:as) = if (a2 - a1) <= d then ans d as else "No"

main = do
  [_,d] <- map read . words <$> getLine :: IO [Int]
  a <- map read . words <$> getLine :: IO [Int]
  let o = ans d $ sort a
  putStrLn o
