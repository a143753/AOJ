import Data.Char

aa = ord 'a'
az = ord 'z'
aA = ord 'A'
aZ = ord 'Z'

c2i c 
    | oc >= aa && oc <= az = oc - aa
    | oc >= aA && oc <= aZ = oc - aA + 26
    where
        oc = ord c
i2c i
    | i < 26 = chr $ i + aa
    | i < 52 = chr $ i - 26 + aA

ans' [] = []
ans' ((c,k):r) =
    let t = ( (c2i c) - k + 52) `mod` 52
        c'= i2c t
    in
        c':(ans' r)

ans ("0":_) = []
ans (_:k:s:r) =
    let k' = map read $ words k :: [Int]
        z  = zip s $ cycle k'
        a  = ans' z
    in
        a:(ans r)

main = do
    c <- getContents
    let i = lines c
        o = ans i
    mapM_ putStrLn o
