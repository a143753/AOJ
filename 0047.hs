act (a,b,c) "A,B" = (b,a,c)
act (a,b,c) "A,C" = (c,b,a)
act (a,b,c) "B,A" = (b,a,c)
act (a,b,c) "B,C" = (a,c,b)
act (a,b,c) "C,A" = (c,b,a)
act (a,b,c) "C,B" = (a,c,b)

chk (1,0,0) = "A"
chk (0,1,0) = "B"
chk (0,0,1) = "C"

main = do
  c <- getContents
  let i = lines c
      o = chk $ foldl (\s i -> act s i) (1,0,0) i
  putStrLn o
