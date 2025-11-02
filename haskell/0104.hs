solve x y m p =
  let p' = (x,y):p
      c  = (m!!y)!!x
      x' = if c == '<' then x-1 else if c == '>' then x+1 else x
      y' = if c == '^' then y-1 else if c == 'v' then y+1 else y
  in
    if (x,y) `elem` p
    then Nothing
    else if x' == x && y' == y
         then Just (x,y)
         else solve x' y' m p'

ans (x:xr) =
  let [h,w] = map read $ words x :: [Int]
      m = take h xr
      a = solve 0 0 m []

  in
      if [h,w] == [0,0] then [] else a:(ans $ drop h xr)

main = do
  c <- lines <$> getContents
  let o = ans c
  mapM_ (\e -> case e of
                 Just (x,y) -> putStrLn $ unwords $ map show [x,y]
                 Nothing    -> putStrLn "LOOP" ) o
