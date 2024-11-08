ans :: String -> String
ans [] = []
ans ('@':l:c:xs) =
  let len = read [l] :: Int
  in
    (take len $ repeat c) ++ ans(xs)
ans (x:xs) = x:ans(xs)

main = do
  c <- getContents
  let i = lines c
      o = map ans i
  mapM_ putStrLn o
