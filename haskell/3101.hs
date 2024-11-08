import Data.List
import Data.Char

cs = ['A','N','a','n']

cnv c
    | ord('A') <= ord(c) && ord(c) <= ord('M') = 'A'
    | ord('N') <= ord(c) && ord(c) <= ord('Z') = 'N'
    | ord('a') <= ord(c) && ord(c) <= ord('m') = 'a'
    | ord('n') <= ord(c) && ord(c) <= ord('z') = 'n'

pack [] _ = [] 
pack (c:cr) s =
    let l = length $ takeWhile (== c) s
        r = dropWhile (== c) s
    in
        l:(pack cr r)

enc [a,b,c,d] = 
    let ns = if a >= b
             then take (a-b) $ repeat 'A'
             else take (b-a) $ repeat 'N'
        ew = if c >= d
             then take (c-d) $ repeat 'a'
             else take (d-c) $ repeat 'n'
    in
        ns ++ ew

ans i =
    let s = sort i
        c = map cnv s
        p = pack cs c
        a = enc p
    in
        a

main = do
    _ <- getLine
    i <- getLine
    let o = ans i
    print $ length o
    putStrLn o
