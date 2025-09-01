import Data.Sequence as S

ans _ [] = []
ans v ([0,c2]:r) = ans v' r      -- pushBack
    where
        v' = v |> c2
ans v ([1,c2]:r) = (r':ans v r)  -- randomAccess
    where
        r' = v `index` c2
ans v ([2]:r) = ans v' r        -- popBack
    where
        v' = case viewr v of
                 EmptyR  -> error "Empty queue"
                 xs :> x -> xs

main = do
    _ <- getLine
    c <- getContents
    let i = map (map read) $ map words $ lines c :: [[Int]]
        o = ans (S.fromList []) i 
    mapM_ print o
