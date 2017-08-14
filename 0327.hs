import Data.List

sel i l =
  if (l!!i) == -1
  then [1..9] \\ l
  else [(l!!i)]

takeTrue [] = []
takeTrue (x:xs) =
  if x
  then x:(takeTrue xs)
  else takeTrue xs

ans x =
  let as = sel 0 x
      bs = sel 1 x
      cs = sel 2 x
      ds = sel 3 x
      es = sel 4 x
      fs = sel 5 x
      gs = sel 6 x
      hs = sel 7 x
      is = sel 8 x
      r = [ [a,b,c,d,e,f,g,h,i] | a<-as,b<-bs,c<-cs,d<-ds,e<-es,f<-fs,g<-gs,h<-hs,i<-is, (g==(d+1)), (a+(10*b+c) + (100*d+10*e+f)) == (100*g+10*h+i), ([1..9] == (sort [a,b,c,d,e,f,g,h,i])) ]
  in
    length $ r

main = do
  l <- getLine
  let i = map read $ words l :: [Int]
      o = ans i
  print o
