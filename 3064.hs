f [t1, t2, r1, r2] = 
        if r1 == -1 || r2 == -1
        then compare t1 t2
        else compare r2 r1

ans i = case j of
            LT -> "Alice"
            EQ -> "Draw"
            GT -> "Bob"
        where
            j = f i

main = do
        l <- getLine
        let i = map read $ words l :: [Int]
            o = ans i
        putStrLn o


