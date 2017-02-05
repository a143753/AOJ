ans :: [Int] -> [String]
ans (x:y:xs) = 
  replicate x $ replicate y '#'

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
      o = map ans i
  printRec o

