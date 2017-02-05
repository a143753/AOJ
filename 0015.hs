ans :: [Integer] -> [ Maybe Integer ]
ans [] = []
ans (x1:x2:xs) =
  let t = x1 + x2
      s = if t < (10 ^ 80)
          then Just t
          else Nothing
  in
    (s:ans xs)

toStr :: (Maybe Integer) -> String
toStr Nothing = "overflow"
toStr (Just a)  = show(a)

main = do
  c <- getContents
  let i = map read $ lines c :: [Integer]
      o = ans $ drop 1 i
  mapM_ (putStrLn . toStr) o
