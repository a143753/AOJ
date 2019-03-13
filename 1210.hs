ini = [1,2,3] -- t,n,w

cmd "north" [t,n,w] = [7-n,t,w]
cmd "east"  [t,n,w] = [w,n,7-t]
cmd "south" [t,n,w] = [n,7-t,w]
cmd "west"  [t,n,w] = [7-w,n,t]

f i [] = i
f i (c:cs) = f (cmd c i) cs

ans' d = head $ f ini d

ans (n:x) = 
    let n' = read n :: Int
        d  = ans' $ take n' x
        r  = ans  $ drop n' x
    in
        if n' == 0 then [] else d:r

main = do 
    c <- getContents
    let i = lines c
        o = ans i
    mapM_ print o

