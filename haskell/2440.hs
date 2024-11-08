import Data.Set (fromList,member)

data St = Open | Close deriving(Eq)

ans' _ _ [] = []
ans' s u (t0:ts) =
        a:(ans' s' u ts)
    where
        (s',a) = if member t0 u
                 then if s == Open
                      then (Close, "Closed by " ++ t0)
                      else (Open,  "Opened by " ++ t0)
                 else (s, "Unknown " ++ t0)

ans i =
    let n = read $ head i :: Int
        u = fromList $ take n $ drop 1 i 
        m = read $ head $ drop (n+1) i :: Int
        t = take m $ drop (n+2) i
    in
        ans' Close u t

main = do
    c <- getContents
    let i = lines c
        o = ans i
    mapM_ putStrLn o
