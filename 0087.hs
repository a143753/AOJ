op :: (Double -> Double -> Double) -> [String] -> [String]
op e (s0:s1:ss) =
  let s0' = read s0 :: Double
      s1' = read s1 :: Double
      re  = e s1' s0'
      r'  = show re
  in
    r':ss

ans s [] = head s
ans s (x:xs) =
  let s' = case x of
             "+" -> op (+) s
             "*" -> op (*) s
             "-" -> op (-) s
             "/" -> op (/) s
             otherwise -> (x:s)
  in
    ans s' xs

main = do
  c <- getContents
  let i = map words $ lines c
      o = map (ans []) i
  mapM_ putStrLn o
