import Text.Printf

turn:: (Int,Int) -> (Int,Int)
turn (a,b)
        | a >  b = (a+b,0)
        | a == b = (a,b)
        | a <  b = (0,a+b)
        
acm:: [(Int,Int)] -> (Int,Int)
acm [] = (0,0)
acm ((a,b):xs) =
        let (c,d) = acm xs
        in
                (a+c,b+d)

play:: [[Int]] -> [(Int,Int)]
play ([0]:ns) = []
play (n:ns) =
    let i = take (n!!0) ns
        o = acm $ map turn $ map (\(x0:x1:xs) -> (x0,x1)) i
        os= play $ drop (n!!0) ns
    in
        (o:os)

main = do
    c <- getContents
    let t0= map words $ lines c
        t1= map (map read) t0 :: [[Int]]
        o = play t1
    mapM_ (\(a,b)-> printf "%d %d\n" a b) o
