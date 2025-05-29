main = do
  n <- read <$> getLine :: IO Int
  c <- getContents
  let i = map ((map read) . words) $ take n $ lines c :: [[Int]]
  let o = map (\(i,a) -> map (\j -> i+j) a) $ zip [1..] i
  mapM_ (putStrLn . unwords . map show) o
  
