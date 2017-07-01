rank (m:e:j:_) 
  | (m==100) || (e==100) || (j==100) = 'A'
  | m+e >= 180                 = 'A'
  | m+e+j >= 240               = 'A'
  | m+e+j >= 210               = 'B'
  |(m+e+j >= 150) &&((m>=80) || (e>=80)) = 'B'
  | otherwise                  = 'C'

ans ([0]:_) = []
ans (n:x) =
  let n'= (n!!0)
      o = map rank $ take n' x
      x'= drop n' x
  in
    o++(ans x')

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ putStrLn $ map (\c->[c]) o
