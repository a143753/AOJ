import Data.Char
import Data.List

pack [] = []
pack (x:xs) = 
    let n = length $ takeWhile (== x) xs
        r = dropWhile (== x) xs
    in
       (x,n+1):(pack r)

fil = filter (\(k,v) -> v /= 0)

chk1 _ ((k,v):r)
    | v >= 2    = chk' True $ fil ((k,v-2):r)
    | otherwise = False

chk2 b ((k,v):r)
    | v >= 3    = chk' b $ fil ((k,v-3):r)
    | otherwise = False

chk3 b ((k1,v1):(k2,v2):(k3,v3):r)
    | [k1,k2,k3] == [k1,k1+1,k1+2] = chk' b $ fil ((k1,v1-1):(k2,v2-1):(k3,v3-1):r)
    | otherwise                    = False

chk3 _ _ = False

chk' _ [] = True
chk' b x =
    let c1 = chk1 b x
        c2 = chk2 b x
        c3 = chk3 b x
    in
        if b then (c2||c3) else (c1||c2||c3)

chk a =
    let f = filter (\ (_,v) -> v > 4) a
    in
        if f == [] then (chk' False a) else False

ans x = 
    let r = map (chk . pack . sort) $ map (\n -> (n:x)) [1..9]
        a = map fst $ filter snd $ zip [1..] r

    in
        a

main = do
  c <- getContents
  let xs = Prelude.map (Prelude.map digitToInt) $ lines c :: [[Int]]
      ys = Prelude.map ans xs
      s  = map (\a -> if a == []
                       then "0"
                       else unwords $ map show a) ys
  mapM_ putStrLn s
