line = ('#':'.':line)

ans :: String -> [Int] -> [String]
ans _ (0:_) = []
ans l (x:y:xs) = 
  ( (take y l) : ans (drop 1 l) (x-1:y:xs) )

printRec :: [[String]] -> IO()
printRec [] = return ()
printRec (s:sx) = do
  mapM_ putStrLn s
  putStrLn ""
  printRec sx

main = do
  c <- getContents
  let t = map (map read) $ map words $ lines c :: [[Int]]
      i = takeWhile (/= [0,0]) t
      o = map (ans line) i
  printRec o
