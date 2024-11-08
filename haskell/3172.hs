import Data.Char

ans i = (filter isUpper i) ++ "UPC"

main = do
    _ <- getLine
    c <- getContents
    let i = concat $ lines c
        o = ans i
    putStrLn o
