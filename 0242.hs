import Data.List

ans ("0":_) = []
ans (n:x) =
  let n' = read n :: Int
      s  = nub $ concat $ map words $ take n' x
      c  = head $ head $ drop n' x
      r  = drop (n'+1) x
      a  = take 5 $ sort $ filter (\x -> c == (head x)) s
      t  = ans r
  in
    if a == []
    then "NA":t
    else (unwords a):t

main = do
  c <- getContents
  let i = lines c
      o = ans i
  mapM_ putStrLn o
