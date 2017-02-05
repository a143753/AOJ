mdlp = [31,29,31,30,31,30,31,31,30,31,30,31]
mdnm = [31,28,31,30,31,30,31,31,30,31,30,31]

isLeapYear :: Int -> Bool
isLeapYear y =
  if y `mod` 4 == 0
  then
    if y `mod` 400 == 0
    then True
    else
      if y `mod` 100 == 0
      then False
      else True
  else False

y2d :: Int -> Int
y2d y =
  if isLeapYear y
  then 366
  else 365

ans :: [Int] -> Int
ans (y1:m1:d1:y2:m2:d2:_) =
  let a1 = if y2 - y1 >= 1
           then sum $ map y2d [y1..y2-1]
           else 0
      a2 = if isLeapYear y1
           then d1 + (sum $ take (m1-1) mdlp)
           else d1 + (sum $ take (m1-1) mdnm)
      a3 = if isLeapYear y2
           then d2 + (sum $ take (m2-1) mdlp)
           else d2 + (sum $ take (m2-1) mdnm)
  in
    a1 - a2 + a3

main = do
  c <- getContents
  let i' = map (map read) $ map words $ lines c :: [[Int]]
      i  = takeWhile (/= [-1,-1,-1,-1,-1,-1]) i'
      o  = map ans i
--  print i
  mapM_ print o
  
