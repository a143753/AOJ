import Control.Monad

ans :: Int -> [Int] -> Int
ans n x =
  let d = take n x
      t = head $ drop n x
      ans' m a = 
        let (b,e) = a
            i = (b+e) `div` 2
            c = d!!i
        in
          if c == t 
          then m
          else if b == e
               then m
               else 
                 if t < c
                 then ans' (m+1) (b,i-1)
                 else ans' (m+1) (i+1,e)
  in
    (ans' 1 (0,n-1))

solve = do
  n <- readLn
  if n == 0
    then return()
    else do
      i <- replicateM (n+1) readLn
      print $ ans n i
      solve

main = do
  solve
