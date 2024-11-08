import Data.List
f _ [] = 0
f l (d:ds) = (l*d) + (f (l-1) ds)

ans [] = []
ans (_:d:ds) = 
    let s = sort d
        l = length d
        a = f l s
    in
        a:(ans ds)

main = do
    c <- getContents
    let i = map (map read) $ map words $ lines c :: [[Int]]
        o = ans i
    mapM_ print o
