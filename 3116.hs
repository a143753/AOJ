import Data.List
import Data.IntMap

v a n =
    case n of 
        Nothing -> a
        Just (_,b) -> b

ans' _ _ [] = []

ans' n s ([l,r]:qr) = 
    let ll = v 0 $ lookupLT l s
        rr = v n $ lookupLE r s
    in
        (rr-ll):(ans' n s qr)

ans ([n,_]:s:q) =
    let s' = fromList $ zip (sort s) [1..]
    in
        ans' n s' q

main = do
    c <- getContents
    let i = Prelude.map (Prelude.map read) $ Prelude.map words $ lines c :: [[Int]]
        o = ans i
    mapM_ print o
