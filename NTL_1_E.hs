f (a,0) = (a,1,0)
f (a,b) = 
    let (d,y',x') = f (b, (a`mod`b))
    in
        (d,x',y'-(a`div`b)*x')


ans [a,b] = 
    let (d,x,y) = f (a,b)
    in
        (d,x,y)


main = do
    l <- getLine
    let i = map read $ words l :: [Int]
        (g,x,y) = ans i
    putStrLn $ unwords $ map show [x,y]

-- extended Euclid Algorithm
