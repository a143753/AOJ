sgn n = if n >= 0 then 1 else -1

ans [a,b] = 
    (a' `div` b') * s
    where
        a' = abs a
        b' = abs b
        s  = (sgn a) * (sgn b)

main = do
    l <- getLine
    let i = map read $ words l :: [Integer]
        o = ans i
    print o
