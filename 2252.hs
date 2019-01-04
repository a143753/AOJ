r = "yuiophjklnm"

p (x0:[]) = [x0]
p (x0:x1:xs) = if x0 == x1
               then p (x1:xs)
               else (x0:(p (x1:xs)))

ans s = 
    let l = length $ p $ map (\a -> elem a r) s
    in
        l - 1

main = do
    c <- getContents
    let i = takeWhile (/= "#") $ lines c
        o = map ans i
    mapM_ print o

