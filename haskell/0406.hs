f i (b0:b1:br)
    | i == b0  = b0
    | i <  b1  = b0
    | otherwise= f i (b1:br)

ans i =
    f i b
    where
        b = map (\ n -> 2^n) [1..20]

main = do
    l <- getLine
    let i = read l :: Int
        o = ans i
    print o


