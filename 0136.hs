import Data.List
import Text.Printf

mktbl :: Float -> Int -> [Float] -> [Int]
mktbl _ n [] = [n]
mktbl r n (v:vs) =
  if v < r
  then mktbl r (n+1) vs
  else
    if v < (r+5)
    then (n:(mktbl (r+5) 1 vs))
    else (n:(mktbl (r+5) 0 (v:vs)))

plot' :: [Int] -> [Int] -> [String]
plot' [] [] = []
plot' (i:is) [] =
  ( ((show i) ++ ":"):(plot' is [] ) )
plot' (i:is) (t:ts) =
  ( ( (show i) ++ ":" ++ (take t $ repeat '*') ):(plot' is ts) )

plot t = 
  let i = [1..6]
  in
    plot' i t 

ans i = 
  let s = sort i
      t = mktbl 165 0 s
  in
    plot t

main = do
  _ <- getLine -- n
  c <- getContents
  let i = map read $ lines c :: [Float]
      o = ans i
  mapM_ putStrLn o
