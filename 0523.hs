import Data.List

choice n d =
  let c = dropWhile (<= n) d
  in
    if c == []
    then (0,d)
    else
      let n'= head c
          d'= filter (/= n') d
      in
        (n',d')

play ta n a b = 
  let (n',a') = choice n a
  in
    if a' == []
    then if ta
         then [length b, 0]
         else [0, length b]
    else play (not ta) n' b a'

ans' n a =
  let b = [1..2*n] \\ a
  in
    play True 0 a b

ans (0:_) = []
ans (n:x) =
  let a = (sort . take n) x
      r = drop n x
  in
    (ans' n a):(ans r)

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = concat $ ans i
  mapM_ print o
