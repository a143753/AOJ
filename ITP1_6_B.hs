import Data.List
import Text.Printf

card = zip ['S','H','C','D'] [1..]

cmp (a,b) (c,d) =
  let c0 = compare (lookup a card) (lookup c card)
      c1 = compare b d
  in
    if c0 == EQ
    then c1
    else c0

icnv :: [String] -> (Char,Int)
icnv (a:b:_) =
  let a' = a!!0
      b' = read b
  in
    (a', b')

ans :: [(Char,Int)] -> [(Char,Int)] -> [(Char,Int)]
ans [] t = t
ans ii@(i:is) tt@(t:ts)
  | cmp i t == EQ  = ans is ts
  | cmp i t == GT  = t:(ans ii ts)


main = do
  n <- getLine
  let n' = read n :: Int
  c <- getContents
  let i  = map icnv $ map words $ lines c :: [(Char,Int)]
      i' = sortBy cmp i

      t  = sortBy cmp [ (a,b) | a <- ['C','D','H','S'], b <- [1..13] ]
      o  = ans i' t

  mapM_ (\(a,b) -> printf "%c %d\n" a b) o
