import Data.List (sort)

divs :: Int -> [Int]
divs n = sort $ _divs 1 n
  where
    _divs i n =
      if a < i
      then []
      else if r == 0
           then (i:a:_divs (i+1) n)
           else _divs (i+1) n 
      where
        a = n `div` i
        r = n `mod` i

chk :: Int -> String -> Bool
chk n s = if l == n
          then True
          else if s1 == s2
               then chk n sr
               else False
  where
    l  = length s
    s1 = take n s
    s2 = take n $ drop n s
    sr = drop n s

ans n s = or $ map (\ d -> chk d s) ds
  where
    ds = init $ divs n

main = do
  n <- readLn :: IO Int
  s <- getLine
  let o = ans n s
  if o
  then putStrLn "Yes"
  else putStrLn "No"
