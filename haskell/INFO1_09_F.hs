import Data.List

ans x = f [] $ sort x
  where
        f a [] = a
        f [] (x:xs) = f [x] xs
        f (a:as) (x:xs) = if a == x then f (a:as) xs else f (x:a:as) xs

main = do
  c <- map read <$> lines <$> getContents :: IO [Int]
  let a = ans $ tail c
  mapM_ print a
  
-- nubだとTLE
