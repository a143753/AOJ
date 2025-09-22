import Data.List (sortBy)

main = do
  i <- map read <$> words <$> getLine :: IO [Int]
  let o = sortBy (flip compare) i
  putStrLn $ unwords $ map show o
