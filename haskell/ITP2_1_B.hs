import Data.Sequence as S

ans _ [] = []

ans v ([0,d,x]:r) = ans v' r      -- pushBack
    where
        v' = case d of
                 1 -> v |> x
                 0 -> x <| v

ans v ([1,p]:r) = (r':ans v r)  -- randomAccess
    where
        r' = v `index` p

ans v ([2,d]:r) = ans v' r        -- popBack
    where
        v' = case d of 
                1 -> case viewr v of
                        EmptyR  -> error "Empty queue"
                        xs :> x -> xs
                0 -> case viewl v of
                        EmptyL  -> error "Empty queue"
                        x :< xs -> xs

main = do
    _ <- getLine
    c <- getContents
    let i = map (map read) $ map words $ lines c :: [[Int]]
        o = ans (S.fromList []) i 
    mapM_ print o
