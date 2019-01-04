kupc = "KUPC"

ans s = minimum $ map (\ c -> length $ filter (== c) s) kupc

main = do
    l <- getLine
    let o = ans l
    print o
