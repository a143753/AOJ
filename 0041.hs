import Text.Printf
import Data.List

pt1 :: [Int] -> [(Int->Int->Int)] -> Int
pt1 [a,b,c,d] [op1,op2,op3] = a `op1` (b `op2` (c `op3` d))
pt2 [a,b,c,d] [op1,op2,op3] = a `op1` ((b `op2` c) `op3` d)
pt3 [a,b,c,d] [op1,op2,op3] = ((a `op1` b) `op2` c) `op3` d
pt4 [a,b,c,d] [op1,op2,op3] = (a `op1` (b `op2` c)) `op3` d
pt5 [a,b,c,d] [op1,op2,op3] = (a `op1` b) `op2` (c `op3` d)

pts = [(pt1, "%d %s (%d %s (%d %s %d))"),
       (pt2, "%d %s ((%d %s %d) %s %d)"),
       (pt3, "((%d %s %d) %s %d) %s %d"),
       (pt4, "(%d %s (%d %s %d)) %s %d"),
       (pt5, "(%d %s %d) %s (%d %s %d)")]

ops :: [((Int->Int->Int),String)]
ops = [((+),"+"),((-),"-"),((*),"*")]

fmt p [a,b,c,d] [o1,o2,o3] = printf p a o1 b o2 c o3 d :: String

chk'' _ _ [] = Nothing
chk'' p o (n:ns) =
    if cc /= 10
    then chk'' p o ns
    else Just ss
    where
        oo = map fst o
        pp = fst p
        cc = pp n oo
        ss = fmt (snd p) n (map snd o)

chk' _ [] _ = Nothing
chk' p (o:or) n =
    case a of
        Nothing -> chk' p or n
        Just _  -> a
    where
        a = chk'' p o n

chk [] _ _ = Nothing
chk (p:pr) o n = 
    case a of
        Nothing -> chk pr o n
        Just _  -> a
    where
        a = chk' p o n

ans ns =
  let n = nub $ permutations ns
      o = [[op1,op2,op3] | op1<-ops,op2<-ops,op3<-ops]
      a = chk pts o n
  in
      case a of
          Nothing -> "0"
          Just s  -> s

main = do
  c <- getContents
  let i = takeWhile (/= [0,0,0,0]) $ map (map read) $ map words $ lines c :: [[Int]]
      o = map ans i
  mapM_ putStrLn o
