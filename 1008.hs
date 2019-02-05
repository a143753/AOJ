import Data.List

pack [] = []
pack x@(h:_) = 
    let n = length $ takeWhile (== h) x
        r = dropWhile (== h) x
    in
        (h,n):(pack r)

a' n l = 
    let p = pack $ sort l
        s = filter (\ (v, m) -> m > (n `div` 2) ) p
        v = map fst s
    in
        if v == []
        then "NO COLOR"
        else unwords $ map show v

ans ([0]:_) = []
ans ([n]:l:xs) = 
    (a' n l):(ans xs)
    
main = do
    c <- getContents
    let i = map (map read) $ map words $ lines c :: [[Int]]
        o = ans i
    mapM_ putStrLn o
