ans [a,b] = 
    if a == 1
    then if even (b-a) then "EVEN" else "ODD"
    else if odd (b-a)  then "EVEN" else "ODD"

main = do
    l <- getLine
    let i = map read $ words l :: [Int]
        o = ans i
    putStrLn o

