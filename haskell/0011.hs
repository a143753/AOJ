splitOn :: Char -> String -> [String]
splitOn c s =
  let e = takeWhile (/= c) s
      r = dropWhile (/= c) s
  in
    if r == []
    then [e]
    else e:(splitOn c $ drop 1 r)

swap [] l = l
swap ([x,y]:xs) l
  | x <  y =
      let b = take (x-1) l
          m = drop x $ take (y-1) l
          e = drop y l
      in
        swap xs (b ++ [(l!!(y-1))] ++ m ++ [(l!!(x-1))] ++ e)
  | x == y = l
  | x >  y = swap ([y,x]:xs) l

ans w c = swap c [1..w]

main = do
  w <- getLine
  _ <- getLine
  c <- getContents
  let w' = read w :: Int
      c' = map (map read) $ map (splitOn ',') $ lines c :: [[Int]]
      o  = ans w' c'
  mapM_ print o
  
