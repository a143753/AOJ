import Data.List

cnv _ [] = []
cnv m (n:t:r) = (m, n',t):(cnv (m+1) r)
    where
        n' = read n :: Int

srt :: (Int,Int,String) -> [(Int,Int,String)] -> [String]
srt d@(m,n,s) ds =
    let cs= filter (\ (_,n1,_) -> m == n1) ds
        o = filter (\ (_,n1,_) -> m /= n1) ds
        a = map (\ c -> srt c o) cs
        r = map (\ ss -> ('.':ss)) $ concat a
    in
        (s:r)

cmp (m1,n1,s1) (m2,n2,s2) = if cn /= EQ then cn else cm
    where
        cn = compare n1 n2
        cm = compare m1 m2

ans c =
    let l = lines c
        (d:ds) = sortBy cmp $ cnv 1 l
        s = srt d ds
    in
        s

main = do
    _ <- getLine
    c <- getContents
    let o = ans c
    mapM_ putStrLn o 
