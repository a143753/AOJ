ans [r,t] 
  | mr == 0 && mt == 0 = [dr + 5*dt]
  | mr == 0 && mt /= 0 = [dr + 5*dt, dr + 5*(dt+1)]
  | mr /= 0 && mt == 0 = [dr + 5*dt, (dr+1) + 5*dt]
  | mr /= 0 && mt /= 0 = [dr + 5*dt, (dr+1) + 5*dt, dr + 5*(dt+1), dr+1 + 5*(dt+1)]
  | otherwise          = [0]
  where
    mr = r `mod` 100
    dr = r `div` 100
    mt = t `mod` 30
    dt = t `div` 30
        
main = do
  _ <- getLine
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = map ans i
  mapM_ putStrLn $ map unwords $ map (map show) o
