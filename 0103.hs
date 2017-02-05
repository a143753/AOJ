-- (点数, Outの数, 塁の状態, 各イニングの得点
act :: (Int, Int, [Int], [Int]) -> String -> (Int, Int, [Int], [Int]) 

act (a, out, base, score) "OUT" 
  | out == 2  = (0, 0, [0,0,0], (a:score) ) -- イニングの終わり
  | otherwise = (a, out+1, base, score)
act (a, out, base, score) "HOMERUN"
  = (a + (sum base) + 1, out, [0,0,0], score)
act (a, out, (x1:x2:x3:_), score) "HIT"
  = (a+x3, out, (1:x1:x2:[]), score)

play :: (Int, Int, [Int], [Int]) -> [String] -> [Int]
play (_, _, _, score) [] = score
play state (p:ps) = 
  let next_state = act state p
  in
    play next_state ps

main = do
  c <- getContents
  let l = drop 1 $ lines c
      o = play (0, 0, [0,0,0], []) l
  mapM_ print $ reverse o
