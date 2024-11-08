import Data.IntMap 

pack t [] = t
pack t (n:ns) =
    let t' = if (member n t)
             then update (\v -> Just(v+1)) n t
             else insert n 1 t
    in
        pack t' ns

depack 10 _ = []
depack n t =
    let v = if (member n t)
            then t ! n
            else 0
    in
        v:(depack (n+1) t)

dec 0 = []
dec n = 
    let a = n `div` 10
        b = n `mod` 10
    in
        b:(dec a)

ans' x y =
    let p = Prelude.map (\xx -> Prelude.map (\yy-> yy*xx) y) x
        d = concat $ Prelude.map dec $ concat p
        s = pack empty d
        a = depack 0 s
    in
        a

ans ([0,0]:_) = []
ans (_:x:y:r) =
    let a = ans' x y
    in
        a:(ans r)

main = do
    c <- getContents
    let i = Prelude.map (Prelude.map read) $ Prelude.map words $ lines c :: [[Int]]
        o = ans i
    mapM_ putStrLn $ Prelude.map unwords $ Prelude.map (Prelude.map show) o
