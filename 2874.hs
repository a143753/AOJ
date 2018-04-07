import Data.List

ans' n a0 [] = Nothing
ans' n a0 (a1:as) =
  if (a1 - a0) `mod` n == 0
  then Just [a0,a1]
  else ans' n a0 as

ans n [] = []
ans n (a0:as) =
  let a = ans' n a0 as
  in
    case a of
      Just x  -> x
      Nothing -> ans n as

main = do
  n <- getLine
  a <- getLine
  let n' = (read n) - 1 :: Int
      a' = sort $ map read $ words a :: [Int]
      o  = ans n' a'
  putStrLn $ unwords $ map show o
