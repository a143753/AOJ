import Data.Maybe (fromMaybe)

ans a b c d t = loop1 0
  where
    loop1 n =
      let aa = a * (c ^ n)
      in
        if (aa+b) > t
        then []
        else if (aa+b) == t
        then [(n,0)]
        else
          let m  = loop2 0 (t-aa)
              m' = fromMaybe 0 m
          in
            if Just m' == m
            then (n,m'):(loop1 (n+1))
            else loop1 (n+1)
    loop2 m t' =
      let bb = b * (d ^ m)
      in
        if bb > t'
        then Nothing
        else if bb == t'
        then Just m
        else loop2 (m+1) t'
      
main = do
  [a,b,c,d,t] <- map read . words <$> getLine :: IO [Int]
  let o = ans a b c d t
      m = minimum $ map (\(n,m) -> (n+m)) o
  if o == []
  then putStrLn "No"
  else putStrLn $ "Yes\n" ++ show m
  
