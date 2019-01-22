import Data.List

pair [] _ = []
pair (a:as) b =
    let x = map (\y -> (a, y) ) b
    in
        x ++ (pair as b)

cmp (a,b) (c,d) = compare (a+b) (c+d)

search _ [] = []
search dif ((a,b):r) = 
    if dif == (a - b) * 2
    then (a,b):(search dif r)
    else (search dif r)

ans' a b = 
    let ma = last a
        mb = last b
        df = (sum a) - (sum b)
        s0 = search df $ pair (nub a) (nub b)
        s1 = head $ sortBy cmp s0
    in
        if s0 == []
        then "-1"
        else unwords $ map show [ fst s1, snd s1 ]

ans ([0,0]:_) = []
ans ([n,m]:x) =
    let a = sort $ concat $ take n x
        b = sort $ concat $ take m $ drop n x
        r = drop (n+m) x
        s = ans' a b
    in
       s:(ans r)

main = do
    c <- getContents
    let i = map (map read) $ map words $ lines c :: [[Int]]
        o = ans i
    mapM_ putStrLn o

