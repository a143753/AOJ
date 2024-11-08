import Data.List

ans :: String -> Int
ans x =
  let max = read $ reverse $ sort x :: Int
      min = read $ sort x :: Int
  in
    max - min

main = do
  n' <- getLine
  let n = read n' :: Int
  c  <- getContents
  let i = take n $ lines c
      o = map ans i
  mapM_ print o
  
