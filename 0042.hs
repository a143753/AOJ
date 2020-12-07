import Data.List
import Data.IntMap

splitBy :: Char -> String -> [String]
splitBy _ [] = []
splitBy a x =
  let s = takeWhile (/= a) x
      x'= dropWhile (/= a) x
  in
    if x' == []
    then [s]
    else s:(splitBy a $ drop 1 x')

mkmap _ [] m = m
mkmap l ([v,w]:r) m = 
    let m' = mapKeys (+ w) $ Data.IntMap.map (+ v) m
        u  = filterWithKey (\k _ -> k <= l) $ unionWith max m m'
    in
        mkmap l r u

cmp a b =
    if s == EQ
    then f
    else s
    where
        f = compare (fst a) (fst b)
        s = compare (snd b) (snd a)

ans' r d =
    let m = mkmap r d $ fromList [(0,0)]
        l = sortBy (\a b -> cmp a b) $ toList m 
    in
        head l
    
ans ["0"] = []
ans (w:n:r) =
        let w' = read w :: Int
            n' = read n :: Int
            t  = take n' r
            d  = sortBy (\a b -> compare (a!!1) (b!!1)) $ Prelude.map (Prelude.map read) $ Prelude.map (splitBy ',') $ take n' r :: [[Int]]
            d' = drop n' r
            a  = ans' w' d
        in
            a:(ans d')

p [] = ""
p ((n,(a,b)):r) =
        let s = "Case " ++ (show n) ++ ":\n" ++ (show b) ++ "\n" ++ (show a) ++ "\n"
        in  
            s ++ (p r)

main = do
        c <- getContents
        let i = lines c
            o = ans i
            s = p $ zip [1..] o
        putStr s
