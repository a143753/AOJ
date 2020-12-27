name = "E869120"

ans x = if x == name then 1 else 0

main = do
    _ <- getLine
    c <- getContents
    let i = lines c
        o = sum $ map ans i
    print o
    
