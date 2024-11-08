split :: String -> (Int,String)
split text =
        let Just i = lookup ',' $ zip text [0..]
            a = read $ take i text
            b = drop (i+1) text
        in
          (a,b)

takeIf :: (a -> Bool) -> [a] -> [a]
takeIf _ [] = []
takeIf c (x:xs) =
  if c x
  then x:(takeIf c xs)
  else (takeIf c xs)

main = do
  c <- getContents
  let i = map snd $ map split $ lines c
      o = map (\b -> length $ takeIf (==b) i ) ["A","B","AB","O"]
  mapM_ print o
