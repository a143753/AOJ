import Data.List
import Text.Printf

split :: String -> [String]
split text =
  let i = lookup ',' $ zip text [0..]
  in
    case i of
      Just j  -> (take j text):(split $ drop (j+1) text)
      Nothing -> [text]

keys :: [[Int]] -> [Int]
keys [] = []
keys ((a:b:_):xs) = a:(keys xs)

find' :: Int -> [[Int]] -> Int
find' _ [] = 0
find' n ((a:b:_):xs) = if n == a
                      then 1 + (find' n xs)
                      else find' n xs

ans :: [[Int]] -> [[Int]] -> [(Int,Int)]
ans l1 l2 =
  let k1 = nub $ keys l1
      k2 = nub $ keys l2
      k  = sort $ intersect k1 k2
      n  = map (\i -> (i, find' i (l1++l2) ) ) k
  in
    n

main = do
  c <- getContents
  let l = lines c
      l1 = map (map read) $ map split $ takeWhile (/= "") l :: [[Int]]
      l2 = map (map read) $ map split $ drop 1 $ dropWhile (/= "") l :: [[Int]]
      o  = ans l1 l2
  mapM_ (\(a,b) -> printf "%d %d\n" a b) o
  
