import Data.Fixed

toBin' :: Int -> Int -> String
toBin' (-1) _ = []
toBin' n v =
  if (v`mod`2) == 1
  then (toBin' (n-1) (v `div` 2)) ++ "1"
  else (toBin' (n-1) (v `div` 2)) ++ "0"

toBin a =
  let s = toBin' 11 a
  in
    (take 8 s) ++ "." ++ (drop 8 s)

ans :: Float -> String
ans i = 
  let m = i * 16
  in
    if (m `mod'` 1.0) == 0.0 && m < 2**12 
    then toBin (round m)
    else "NA"

main = do
  c <- getContents
  let i = map read $ lines c :: [Float]
      i'= takeWhile (>=0) i
      o = map ans i'
  mapM_ putStrLn o
