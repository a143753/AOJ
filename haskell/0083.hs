table = [([1989, 1, 8], "heisei"),
         ([1926,12,25], "showa"),
         ([1912, 7,30], "taisho"),
         ([1868, 9, 8], "meiji")]
         
cmp [y1,m1,d1] [y2,m2,d2] =
  if y1 > y2
  then True
  else if y1 == y2
       then if m1 > m2
            then True
            else if m1 == m2
                 then if d1 >= d2
                      then True
                      else False
                 else False
       else False

ans' :: [Int] -> [([Int],String)] -> String
ans' _ [] = "pre-meiji"
ans' [y,m,d] (([yy,mm,dd],str):ls) =
  if cmp [y,m,d] [yy,mm,dd]
  then unwords (str:(map show [y-yy+1,m,d]))
  else ans' [y,m,d] ls
  
ans date@[y,m,d] =
  ans' date table

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = map ans i
  mapM_ putStrLn o
