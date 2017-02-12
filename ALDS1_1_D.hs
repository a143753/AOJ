import Data.List

max' Nothing  Nothing  = Nothing
max' (Just a) Nothing  = Just a
max' Nothing  (Just b) = Just b
max' (Just a) (Just b) = Just $ max a b

  -- max: 現時点の最大値, s:小さい順に並んだlist, r:大きい順に並んだlist
search :: Int -> [(Int,Int)] -> [(Int,Int)] -> Maybe Int
search _ _ [] = Nothing
search _ [] _ = Nothing
search cur_max s r =
  let (ln,lv) = head s
      (hn,hv) = head r
      val     = hv - lv
  in
    if val < cur_max
    then Nothing -- finish
    else
      let new_max = if ln < hn
                    then max cur_max val
                    else cur_max
          s1 = tail s
          r1 = tail r
          x0 = search new_max s r1
          x1 = search new_max s1 r
      in 
        if ln < hn
        then max' (Just val) $ max' x0 x1
        else max' x0 x1
ans x = 
    let (x0:x1:_) = x
        init_max  = x1 - x0
        s = sortBy (\(na,va) (nb,vb) -> compare va vb) $ zip [1..] x
        r = reverse s
        v = max' (Just init_max) (search init_max s r)
    in
      v

main = do
    n <- getLine
    c <- getContents
    let i = map read $ lines c :: [Int]
        (Just o) = ans i
    print o
