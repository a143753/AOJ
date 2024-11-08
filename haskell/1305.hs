import Data.List

splitBy _ [] = []
splitBy a x =
  let s = takeWhile (/= a) x
      x'= dropWhile (/= a) x
  in
    if x' == []
    then [s]
    else s:(splitBy a $ drop 1 x')

mktbl l = 
    let k = takeWhile (/= ':') l
        d = splitBy ',' $ init $ tail $ dropWhile (/= ':') l
    in
        (k,d)

look _ [] = []
look t (v:vs) = 
    let f = concat $ map (\ (k,l) -> if k == v then l else []) t
    in
        if f == []
        then v:(look t vs)
        else look t (nub $ f++vs)

ans' d = 
    let t = map mktbl d 
        (k,v) = t!!0
        a = look t v
    in
        a

ans ("0":_) = []
ans (n:x) =
    let n' = read n :: Int
        d  = take n' x
        r  = drop n' x
        a  = length $ nub $ ans' d
    in
       a:(ans r) 

main = do
    c <- getContents
    let i = lines c
        o = ans i
    mapM_ print o

