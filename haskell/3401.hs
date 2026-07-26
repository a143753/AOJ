import Data.List (sortBy)

ans :: [[Int]] -> Int
ans [[n,m,k],a,c] = sm
  where
    cs = filter (\(n,v) -> not $ (n `elem` a) ) $ zip [1..] c
    cs'= sortBy (\(_,v1) (_,v2) -> compare v1 v2) cs
    sm = sum $ take (m-k) $ map snd cs'

main = do
  c <- map (map read) <$> map words <$> lines <$> getContents :: IO [[Int]]
  let o = ans c
  print o
