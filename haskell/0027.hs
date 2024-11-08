--        1   2   3   4   5   6   7   8   9  10  11  12
days = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
week = [ "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" ]

ans :: [Int] -> String
ans (m:d:_) =
  let md = sum $ take (m-1) days
      dd = md + d - 1 + 3
      wd = dd `mod` 7
  in
    week!!wd
      

main = do
  c <- getContents
  let i' = map (map read) $ map words $ lines c :: [[Int]]
      i  = takeWhile (/= [0, 0]) i'
      o  = map ans i
  mapM_ putStrLn o
  
