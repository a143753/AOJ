import Data.Array.IArray
import Data.Array.Unboxed

-- listを使ってTLEになったのでArrayに変更したがやはりTLEになる

binary_search a k = f 0 (length a)
  where
    f l r = (l,r):s
      where
        m = (l + r) `div` 2
        s = if (a!m) == k
            then []
            else if (a!m) < k
                 then f (m + 1) r
                 else f l m

main = do
  n <- read <$> getLine :: IO Int
  t <-  map read <$> words <$> getLine :: IO [Int]
  let a = array (0,n-1) $ zip [0..] t :: Array Int Int
  k <- read <$> getLine :: IO Int
  let o = binary_search a k
  mapM_ putStrLn $ map (\a -> "[" ++ (show $ fst a) ++ ", " ++ (show $ snd a) ++ ")" ) o  
