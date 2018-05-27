f a b =
  let i = (a*10) `div` b
      o = (a*10) `mod` b
  in
    i:(f o b)

ans (a:b:n:_) =
  sum $ take n $ f (a`mod`b) b

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c
      o = map ans i
  mapM_ print o
