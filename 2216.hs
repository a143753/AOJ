ans [a,b] =
    let c = b - a
        x = div c 1000
        y = div (mod c 1000) 500 
        z = div (mod c  500) 100
    in
        unwords $ map show $ [z,y,x]

main = do
    c <- getContents
    let i = takeWhile (/= [0,0]) $ map (map read) $ map words $ lines c :: [[Int]]
        o = map ans i
    mapM_ putStrLn o
