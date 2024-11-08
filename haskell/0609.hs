import Data.List

takeIf _ [] = []
takeIf f (a:ax) =
  if f a
  then a:takeIf f ax
  else takeIf f ax

inc 1 v (t:ts) = (t+v):ts
inc i v (t:ts) = t:(inc (i-1) v ts)

inc' _ _ [] t = t
inc' a i (b:bs) t =
  if b == a
  then inc' a (i+1) bs t'
  else inc' a (i+1) bs t
  where
    t' = inc i 1 t

play :: [Int] -> (Int,[Int]) -> [Int]
play t (a,b) =
  let v1 = length $ takeIf (/= a) b
      t1 = inc  a v1 t
      t2 = inc' a 1 b t1
  in
    t2

ans n m a b = 
  let t = replicate n 0
      t'= foldl play t $ zip a b
  in
    t'

main = do
  n <- getLine
  m <- getLine
  a <- getLine
  b <- getContents
  let n' = read n :: Int
      m' = read m :: Int
      a' = map read $ words a :: [Int]
      b' = map (map read) $ map words $ lines b :: [[Int]]
      o  = ans n' m' a' b'
  mapM_ print o
  
