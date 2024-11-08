import Data.List

cmp (a1,a2) (b1,b2) =
    let c1 = compare a1 b1
        c2 = compare a2 b2
    in
        if c2 /= EQ then c2 else c1

ans i =
    let z = zip [1..] i
        s = sortBy (\a b -> cmp a b) z
    in
        head s

main = do
    _ <- getLine
    l <- getLine
    let i = map read $ words l :: [Int]
        o = ans i
    print $ fst o
