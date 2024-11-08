import Data.Char

c s = (tail s) ++ [head s]
j s = (last s):(init s)
e s =
  let l = length s
      n = l `div` 2
      h = take n s
      t = drop (l-n) s
  in
    if odd l
    then t ++ (s!!n):h
    else t ++ h
      
a = reverse
p [] = []
p (s:r) =
  let s' = if isDigit s
           then intToDigit $ (\x -> mod (x-1) 10) $ digitToInt s
           else s
  in
    s':(p r)

m [] = []
m (s:r) =
  let s' = if isDigit s
           then intToDigit $ (\x -> mod (x+1) 10 ) $ digitToInt s
           else s
  in
    s':(m r)

c2f [] = []
c2f (x:y) = f:(c2f y)
  where 
    f = case x of
      'J' -> j
      'C' -> c
      'E' -> e
      'A' -> a
      'P' -> p
      'M' -> m

exe s [] = s
exe s (f:fs) = exe (f s) fs

ans' c s =
  let f = c2f $ reverse c
  in
    exe s f

ans [] = []
ans (c:s:r) =
  let a = ans' c s
  in
    a:(ans r)

main = do
  _ <- getLine
  c <- getContents
  let i = lines c
      o = ans i
  mapM_ putStrLn o
