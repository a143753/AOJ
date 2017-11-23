import Data.List

pack [] = []
pack str@(s:_) =
  let n = length $ filter (== s) str
      r = filter (/= s) str
  in
    (s,n):(pack r)

ans ("0":_) = []
ans (n:x) =
  let n' = read n :: Int
      s  = pack $ concat $ map words $ take n' x
      s' = sortBy (\ (w0,n0) (w1,n1) -> let c = compare n1 n0
                                        in if c /= EQ
                                           then c
                                           else compare w0 w1 ) s
                                              
      c  = head $ head $ drop n' x
      r  = drop (n'+1) x
      a  = map fst $ take 5 $ filter (\(w,n) -> c == (head w)) s'
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
