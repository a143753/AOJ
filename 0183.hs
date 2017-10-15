transpose ([]:_) = []
transpose matrix =
  let row  = map (head) matrix
      rows = transpose $ map (drop 1) matrix
  in
    row:rows

chk b s =
  let t = transpose b 
      e = replicate 3 s
  in
    if (b!!0) == e || (b!!1) == e || (b!!2) == e
    then True
    else if (t!!0) == e || (t!!1) == e || (t!!2) == e
         then True
         else if ((t!!0)!!0) == s && ((t!!1)!!1) == s && ((t!!2)!!2) == s
              then True
              else if ((t!!0)!!2) == s && ((t!!1)!!1) == s && ((t!!2)!!0) == s
                   then True
                   else False

ans' b =
  let c = map (chk b) ['b','w']
  in
    case c of
      [True,False] -> "b"
      [False,True] -> "w"
      otherwise    -> "NA"

ans ("0":_) = []
ans x =
  let d = take 3 x
      r = drop 3 x
  in
    (ans' d):(ans r)

main = do
  c <- getContents
  let i = lines c
      o = ans i
  mapM_ putStrLn o
  
