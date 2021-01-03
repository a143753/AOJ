ans :: [[Int]] -> [Int]
ans ([0]:_) = []
ans ([k]:l:xs) =
  let d = k - 1
      a = sum l
  in
    (a`div`d):ans xs

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o
                                                  
