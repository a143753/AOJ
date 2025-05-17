import Data.List

main = do
  c <- map (map read) <$> map words <$> lines <$> getContents :: IO [[Int]]
  let i = takeWhile (\[x,y]-> x /= 0 || y /= 0) c
      o = map (sortBy compare) i
  mapM_ putStrLn $ map unwords $ map (map show) o      
