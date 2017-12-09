fs = [ ("A", [(0,0),(1,0),(0,1),(1,1)]),
       ("B", [(0,0),(0,1),(0,2),(0,3)]),
       ("C", [(0,0),(1,0),(2,0),(3,0)]),
       ("D", [(0,0),(-1,1),(0,1),(-1,2)]),
       ("E", [(0,0),(1,0),(1,1),(2,1)]),
       ("F", [(0,0),(0,1),(1,1),(1,2)]),
       ("G", [(0,0),(1,0),(-1,1),(0,1)]) ]

scn' (x,y) [] = []
scn' (x,y) (d:ds) =
  if d == '1'
  then (x,y):r
  else r
  where
    r = scn' (x+1,y) ds

scn :: (Int,Int) -> [String] -> [(Int,Int)]
scn (_,_) [] = []
scn (x,y) (d:ds) =
  let s' = scn' (x,y) d
  in
    s' ++ (scn (x,y+1) ds)

ofs d@((x0,y0):ds) = map (\(xi,yi) -> (xi-x0,yi-y0)) d
  
search s =
  fst $ head $ filter (\ (name, pat) -> s == pat) fs

ans' x = (search . ofs . scn (0,0)) x

ans [] = []
ans ("":xs) = ans xs
ans x =
  let d = take 8 x
      r = drop 8 x
  in
    (ans' d):(ans r)

main = do
  c <- getContents
  let i = lines c
      o = ans i
  mapM_ putStrLn o
       
