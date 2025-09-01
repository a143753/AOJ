ans (f1,f2,f3,f4) []  = (f1,f2,f3,f4)
ans (f1,f2,f3,f4) [_] = (f1,f2,f3,f4)

ans (f1,f2,f3,f4) (x1:x2:r) = ans (f1',f2',f3',f4') (x2:r)
  where
    f1' = f1 && (x1 < x2)
    f2' = f2 && (x1 <= x2)
    f3' = f3 && (x1 > x2)
    f4' = f4 && (x1 >= x2)

ts (True, _,    _,    _    ) = 2
ts (False,True, _,    False) = 1
ts (_,    _,    True, _    ) = -2
ts (_,    False,False,True ) = -1
ts (_,    True, _,    True ) = 0

main = do
  _ <- getLine
  a <- map read <$> words <$> getLine :: IO [Int]
  let o = ts $ ans (True,True,True,True) a
  print o
