import Data.List

ans' q x = 
    let dt = sortBy c $ map (\e -> (head e, length e) ) $ group $ sort $ concat $ map tail x
        (d,n) = head dt
    in
        if dt == []
        then 0
        else if n >= q then d else 0
    where
        c (d0,n0) (d1,n1) =
            let cd = compare d0 d1
                cn = compare n1 n0
            in
                if cn /= EQ then cn else cd

ans ([0,0]:_) = []
ans ([n,q]:x) =
    let d = take n x
        r = drop n x
        a = ans' q d
    in
        a:(ans r)

main = do
    c <- getContents
    let i = map (map read) $ map words $ lines c :: [[Int]]
        o = ans i
    mapM_ print o

