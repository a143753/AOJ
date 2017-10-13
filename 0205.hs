import Data.List

tr _ [] = []
tr tab (x:xs) = (tab!!x):(tr tab xs)

ans' x =
  let u = sort $ nub x
      r = case u of
            [1,2,3]   -> replicate 5 3
            [1]       -> replicate 5 3
            [2]       -> replicate 5 3
            [3]       -> replicate 5 3
            [1,2]     -> tr [0,1,2,0] x
            [1,3]     -> tr [0,2,0,1] x
            [2,3]     -> tr [0,0,1,2] x
            otherwise -> replicate 5 0
  in
    r

ans [0] = []
ans x =
  let f = ans' $ take 5 x
      b = ans  $ drop 5 x
  in
    f ++ b

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = ans i
  mapM_ print o
