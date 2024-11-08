cmp [] [] = True
cmp [] _  = False
cmp (s:ss) (b:bs) = if b == '_' || s == b then cmp ss bs else False


ans' _ _ [] = "No"
ans' l b a@(_:as) = if c then "Yes" else (ans' l b as)
    where
        s = take l a
        c = cmp s b

ans [a,b] = 
    let l = length b
    in
        ans' l b a

main = do
    c <- getContents
    let i = lines c
        o = ans i
    putStrLn o

