import Data.List
import Data.Maybe

c [i1,u1,a1,p1] [i2,u2,a2,p2] = 
    if ca /= EQ
    then ca
    else if cp /= EQ
         then cp
         else ci 
    where
        ca = compare a2 a1
        cp = compare p1 p2
        ci = compare i1 i2

r1 h@[i,u,a,p] t =
    if l < 3 then (h:t) else t
    where  
        l = length $ filter (\[_,uu,_,_] -> uu == u) t
r2 h@[i,u,a,p] t =
    if l < 2 then (h:t) else t
    where  
        l = length $ filter (\[_,uu,_,_] -> uu == u) t

r3 h@[i,u,a,p] t =
    if l < 1 then (h:t) else t
    where  
        l = length $ filter (\[_,uu,_,_] -> uu == u) t

chk [] t = t
chk a@(h:r) t
    | l < 10    = chk r t1
    | l < 20    = chk r t2
    | l < 26    = chk r t3
    | otherwise = t
    where
        l = length t
        t1= r1 h t
        t2= r2 h t
        t3= r3 h t

ans' d =
    let s = sortBy c d 
        a = map head $ reverse $ chk s []
    in
        a

ans ([0]:_) = []
ans ([n]:x) =
    let d = take n x
        r = drop n x
    in
        (ans' d):(ans r)

main = do
    c <- getContents
    let i = map (map read) $ map words $ lines c :: [[Int]]
        o = ans i
    mapM_ print $ concat o
