import Data.List

ans' _ _ [] = []
ans' n [] b =
  let v = head b
  in
    v:(ans' n [head b,0] (tail b))

ans' n a b =
  let ad = n - (head a)
      bd = head b
      v  = minimum [ad*2+bd, ad+bd*2]
  in
    v:(ans' n ((head b):a) (tail b))

ans p n d =
  let d1 = sort $ map (\i -> (i+n-p) `mod` n) d
      d2 = if 0 == (head d1) then d1 else (0:d1)
      d3 = reverse d2
  in
    100 * (minimum $ ans' n [] d3)

main = do
  l <- getLine
  c <- getContents
  let [n,m,p] = map read $ words l :: [Int]
      d = map read $ lines c :: [Int]
      o = ans p n d
  print o
