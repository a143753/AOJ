import Text.Printf

pat1 :: Int->(Int->Int->Int)->Int->(Int->Int->Int)->Int->(Int->Int->Int)->Int->Int
pat1 a op1 b op2 c op3 d = a `op1` (b `op2` (c `op3` d))
pat2 a op1 b op2 c op3 d = a `op1` ((b `op2` c) `op3` d)
pat3 a op1 b op2 c op3 d = ((a `op1` b) `op2` c) `op3` d
pat4 a op1 b op2 c op3 d = (a `op1` (b `op2` c)) `op3` d
pat5 a op1 b op2 c op3 d = (a `op1` b) `op2` (c `op3` d)

pat :: [Int->(Int->Int->Int)->Int->(Int->Int->Int)->Int->(Int->Int->Int)->Int->Int]
pat = [ pat1, pat2, pat3, pat4 ]

ots :: (Int->Int->Int) -> String
ots (*) = "*"
ots (+) = "+"
ots (-) = "-"

p1tos a op1 b op2 c op3 d = printf "%d %s (%d %s (%d %s %d))" a (ots op1) b (ots op2) c (ots op3) d
p2tos a op1 b op2 c op3 d = printf "%d %s ((%d %s %d) %s %d)" a (ots op1) b (ots op2) c (ots op3) d
p3tos a op1 b op2 c op3 d = printf "((%d %s %d) %s %d) %s %d" a (ots op1) b (ots op2) c (ots op3) d
p4tos a op1 b op2 c op3 d = printf "(%d %s (%d %s %d)) %s %d" a (ots op1) b (ots op2) c (ots op3) d
p5tos a op1 b op2 c op3 d = printf "(%d %s %d) %s (%d %s %d)" a (ots op1) b (ots op2) c (ots op3) d



chk [] = []
chk (s:sx) =
  let (a,op1,b,op2,c,op3,d) = s
      r1 = pat1 a op1 b op2 c op3 d
      r2 = pat2 a op1 b op2 c op3 d
      r3 = pat3 a op1 b op2 c op3 d
      r4 = pat4 a op1 b op2 c op3 d
      r5 = pat5 a op1 b op2 c op3 d
  in
    if r1 == 10
    then "pat1 " ++ show(a) ++ show(b) ++ show(c) ++ show(d)
    else if r2 == 10
         then "pat2 " ++ show(a) ++ show(b) ++ show(c) ++ show(d)
         else if r3 == 10
              then "pat3 " ++ show(a) ++ show(b) ++ show(c) ++ show(d)
              else if r4 == 10
                   then "pat4 " ++ show(a) ++ show(b) ++ show(c) ++ show(d)
                   else if r5 == 10
                        then "pat5 " ++ show(a) ++ show(b) ++ show(d) ++ show(d)
                        else chk sx

ops = [(+),(-),(*)]

ans :: [Int] -> String
ans ns =
  let s = [(a,op1,b,op2,c,op3,d) | a<-ns,b<-ns,c<-ns,d<-ns,op1<-ops,op2<-ops,op3<-ops]
      o = chk s
  in
    o

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = map ans i

  print $ ots (*)
  print $ ots (+)
  print $ ots (-)
  print o
