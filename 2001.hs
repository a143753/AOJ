import Data.List

f a [] = a
f a ([_,x,y]:ls) = if a == x
                   then y
                   else if a == y
                        then x
                        else f a ls

ans a [] = a
ans a l =
  let h = head $ head l
      b = f a $ filter (\e -> h == (e!!0)) l
      r = filter (\e -> h /= (e!!0)) l
  in
    ans b r

ans' ([0,0,0]:_) = []
ans' ([n,m,a]:ls) =
  let d = sortBy (\a b -> compare (head b) (head a)) $ take m ls
      r = drop m ls
  in
    (ans a d):(ans' r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans' i
  mapM_ print o
