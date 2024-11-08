import Control.Monad
 
main :: IO ()
main = do
  n <- readLn
  if n == 0
    then return ()
    else do
      ls <- replicateM n getLine
      let ls' = map (map read . words) ls
      mapM_ putStrLn $ solve ls'
      main
 
solve :: [[Int]] -> [String]
solve = map (format . cross)
  where
    cross :: [Int] -> [Int]
    cross [x1,y1,z1,w1,x2,y2,z2,w2] = [x1 * x2 - y1 * y2 - z1 * z2 - w1 * w2,
                                       x1 * y2 + x2 * y1 + z1 * w2 - z2 * w1,
                                       x1 * z2 + x2 * z1 + w1 * y2 - y1 * w2,
                                       x1 * w2 + x2 * w1 + y1 * z2 - z1 * y2]
    format :: [Int] -> String
    format [x,y,z,w] = (show x) ++ " " ++ (show y) ++ " " ++ (show z) ++ " " ++ (show w)
    
