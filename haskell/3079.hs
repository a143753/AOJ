mul a@(a11,a12,a13,a21,a22,a23,a31,a32,a33) b@(b11,b12,b13,b21,b22,b23,b31,b32,b33) = 
  ( (a11*b11 + a12*b21 + a13*b31) `mod` 1000000007
  , (a11*b12 + a12*b22 + a13*b32) `mod` 1000000007
  , (a11*b13 + a12*b23 + a13*b33) `mod` 1000000007
  , (a21*b11 + a22*b21 + a23*b31) `mod` 1000000007
  , (a21*b12 + a22*b22 + a23*b32) `mod` 1000000007
  , (a21*b13 + a22*b23 + a23*b33) `mod` 1000000007
  , (a31*b11 + a32*b21 + a33*b31) `mod` 1000000007
  , (a31*b12 + a32*b22 + a33*b32) `mod` 1000000007
  , (a31*b13 + a32*b23 + a33*b33) `mod` 1000000007 )

mul' a@(a11,a12,a13,a21,a22,a23,a31,a32,a33) b@(b1,b2,b3) =
  ( (a11*b1 + a12*b2 + a13*b3) `mod` 1000000007
  , (a21*b1 + a22*b2 + a23*b3) `mod` 1000000007
  , (a31*b1 + a32*b2 + a33*b3) `mod` 1000000007 )

ans n a s =
  if n == 0
  then let (x,_,_) = mul' s (1, 1, 0) in x
  else if n `mod` 2 == 0
       then ans (n `div` 2) (mul a a) s
       else ans (n `div` 2) (mul a a) (mul a s)
        
main = do
  n <- readLn :: IO Int
  let a = ans (n-3) (0,1,1,1,0,0,0,1,0) (1,0,0,0,1,0,0,0,1) 
  print a
