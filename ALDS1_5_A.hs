import Data.List

cons a as = Just (a:as)

ans' _ [] = Nothing
ans' m (a:as) =
   if m < a
   then Nothing
   else if m == a
        then Just [a]
        else if a' /= Nothing
             then a' >>= (cons a)
             else b'
   where
        a' = ans' (m-a) as
        b' = ans' m as

ans m a =
   let o = ans' m a
   in
        case o of
            Nothing -> "no"
            Just _  -> "yes"

main = do
    _ <- getLine
    a <- getLine
    _ <- getLine
    m <- getLine
    let a' = sort $ map read $ words a :: [Int]
        m' = map read $ words m :: [Int]
        o  = map (\ m -> ans m a') m'
--    print o
    mapM_ putStrLn o
