ans [[a,b],[p,q,r]] =
    let l = (b*p) - (q*(b-a))
        t = l / (r+q)
    in
        b + t

main = do
    c <- getContents
    let i = map (map read) $ map words $ lines c :: [[Double]]
        o = ans i
    print o
