data Dir = N | E | W | S

mn x y = if x > y then y else x
mx x y = if x > y then x else y

play b (d,x,y) [] = (x,y)
play b@(xx,yy) (d,x,y) (["FORWARD",k]:ls) =
  case d of
    N -> play b (d,x,(mn yy (y+k'))) ls
    E -> play b (d,(mn xx (x+k')),y) ls
    W -> play b (d,(mx 1 (x-k')),y) ls
    S -> play b (d,x,(mx 1 (y-k'))) ls
  where
    k' = read k :: Int

play b@(xx,yy) (d,x,y) (["BACKWARD",k]:ls) =
  case d of
    N -> play b (d,x,(mx 1 (y-k'))) ls
    E -> play b (d,(mx 1 (x-k')),y) ls
    W -> play b (d,(mn xx (x+k')),y) ls
    S -> play b (d,x,(mn yy (y+k'))) ls
  where
    k' = read k :: Int

play b (d,x,y) (["RIGHT"]:ls) =
  case d of
    N -> play b (E,x,y) ls
    E -> play b (S,x,y) ls
    W -> play b (N,x,y) ls
    S -> play b (W,x,y) ls
play b (d,x,y) (["LEFT"]:ls) =
  case d of
    N -> play b (W,x,y) ls
    E -> play b (N,x,y) ls
    W -> play b (S,x,y) ls
    S -> play b (E,x,y) ls

ans [] = []
ans (["0","0"]:_) = []
ans (l:ls) =
  let [x,y] = map read l :: [Int]
      d = takeWhile (\x -> "STOP" /= head x) ls
      r = drop 1 $ dropWhile (\x -> "STOP" /= head x) ls
      a = play (x,y) (N,1,1) d
  in
    a:(ans r)

main = do
  c <- getContents
  let i = map words $ lines c
      o = ans i
  mapM_ putStrLn $ map (\(x,y) -> unwords $ map show [x,y] ) o
  
