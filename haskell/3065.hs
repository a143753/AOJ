ans :: (Integer,Integer) -> [[Int]] -> (Integer,Integer)
ans (a,b) [] = (a,b)
ans (a,b) ([q,v]:r) =
    case q of
        1 -> ans (a*v',b*v') r
        2 -> ans (a,b+v')   r
        3 -> ans (a,b-v')   r
    where
        v' = fromIntegral v :: Integer

main = do
    _ <- getLine
    c <- getContents
    let i = map (map read) $ map words $ lines c :: [[Int]]
        (a,b) = ans (1,0) i
    putStrLn $ unwords $ map show $ [-b, a]
