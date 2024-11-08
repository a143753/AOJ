ans' [a,b,c,d] =
    sum $ map (\b' -> (b'*a*2 + b'*(c - a) ) * (c - a + 1) `div` 2 ) [b..d]

ans ([0]:_) = []
ans (_:c:r) =
    let a = ans' c
        a'= a `mod` (1000000007)
    in
        a':(ans r)

main = do
    c <- getContents
    let i = map (map read) $ map words $ lines c :: [[Integer]]
        o = ans i 
    mapM_ print o
    
