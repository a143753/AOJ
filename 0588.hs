ans :: [String] -> Int
ans (a:"=":_) = read a :: Int
ans (a:"+":b:xs) =
  let a' = read a :: Int
      b' = read b :: Int
  in
    ans ((show (a'+b')):xs)

ans (a:"-":b:xs) =
  let a' = read a :: Int
      b' = read b :: Int
  in
    ans ((show (a'-b')):xs)

ans (a:"*":b:xs) =
  let a' = read a :: Int
      b' = read b :: Int
  in
    ans ((show (a'*b')):xs)

ans (a:"/":b:xs) =
  let a' = read a :: Int
      b' = read b :: Int
  in
    ans ((show (a' `div` b')):xs)

main = do
  c <- getContents
  let i = lines c
      o = ans i
  print o
