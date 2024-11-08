import Data.List
import Data.Char

arrow i n =
  replicate i ' ' ++ replicate (n-i) '^'

f a b s =
  let i = (a*10) `div` b
      o = (a*10) `mod` b
  in
    if o == 0
    then (i,o):s
    else if elem (i,o) s
         then (i,o):s
         else f o b ((i,o):s)

ans (a:b:_) =
  let l@(h:t) = f a b []
  in
    if (snd h) == 0
    then
      map (intToDigit . fst) $ reverse l
    else
      let r = reverse t
          Just i = elemIndex h r
          n = length r
      in
        map (intToDigit . fst) r ++ "\n" ++ (arrow i n)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c
      o = map ans i
  mapM_ putStrLn o

