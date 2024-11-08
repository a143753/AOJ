rep :: String -> String
rep x = x ++ (rep x)

play :: [String] -> [String]
play ("-":_) = []
play (c:n:rem) = 
  let num = read n :: Int
      len = length c
      shu = map read $ take num $ rem :: [Int]
      tot = sum shu
      o   = take len $ drop tot (rep c)
  in
    o:(play $ drop num rem)

main = do
  c <- getContents
  let l = lines c
      o = play l
  mapM_ putStrLn o
