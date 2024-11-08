t = [25, 10, 5, 1] 

ans _ [] = 0
ans n (t:ts) =
   let s = n `div` t 
       r = n `mod` t
   in
       s + (ans r ts)

main = do
    n <- getLine
    let n'= read n :: Int
        o = ans n' t
    print o

