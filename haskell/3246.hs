import Data.List

pack :: [Int] -> [(Int, Int)]
pack [] = []
pack(x:xs) = (x, 1 + (length $ takeWhile (== x) xs)) : pack (dropWhile (== x) xs)

ans2 d = fst $ head $ s $ pack $ sort d 
  where
    s = sortBy (\(ya,na) (yb,nb) -> if na /= nb then compare nb na else compare ya yb)

                   
ans1 i =
  let i' = map words i
      a1 = ans2 $ map (read . head) $ filter (\[y,g,m] -> m == "Gold") i'
      a2 = ans2 $ map (read . head) i'
  in
    [a1,a2]

ans (n:r) =
  if n' == 0
  then []
  else (ans1 $ take n' r):(ans $ drop n' r)
  where
    n' = read n :: Int

main = do
  c <- getContents
  let i = lines c
      o = ans i
  mapM_ putStrLn $ map (unwords . (map show)) o
