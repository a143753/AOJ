import Data.Set

o = 10

c2d 'A' = 1 
c2d 'C' = 2
c2d 'G' = 3
c2d 'T' = 4

-- |
-- >>> w2d "AAA"
-- 111
-- >>> w2d "AAC"
-- 211
-- >>> w2d "AGA"
-- 131
-- >>> w2d "AGG"
-- 331
-- >>> w2d "TTT"
-- 444
-- >>> w2d "CCC"
-- 222
-- >>> w2d "CC"
-- 22

w2d :: String -> Int
w2d (c:[]) = a
    where
        a = c2d c
w2d (c:s)  = a + r*o
    where
        a = c2d c
        r = w2d s


ans _ [] = []

ans s (["insert",d]:r) = ans s' r
    where
       d' = w2d d
       s' = insert d' s

ans s (["find",d]:r) = a:(ans s r)
    where
        d'= w2d d
        a = if member d' s then "yes" else "no"

main = do
    _ <- getLine
    c <- getContents
    let i = Prelude.map words $ lines c
        o = ans empty i
    mapM_ putStrLn o

-- Time Limit Exceeded
