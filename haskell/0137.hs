import System.IO

ans' 0 _ = []
ans' n i =
  let j = i*i
      i'= (j `div` 100) `mod` 10000
  in
    i':(ans' (n-1) i')

ans i =
  ans' 10 i

cs i = "Case " ++ show(i) ++ ":"

pr :: (Int,[Int]) -> IO ()
pr (i,o) = do
  let hd = cs i
  putStrLn hd
  mapM_ putStrLn $ map show o

main = do
  n <- getLine
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = map ans i
  mapM_ pr $ zip [1..] o
