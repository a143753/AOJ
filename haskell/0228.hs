import Data.List

p 0 = [0,1,1,1,1,1,1]
p 1 = [0,0,0,0,1,1,0]
p 2 = [1,0,1,1,0,1,1]
p 3 = [1,0,0,1,1,1,1]
p 4 = [1,1,0,0,1,1,0]
p 5 = [1,1,0,1,1,0,1]
p 6 = [1,1,1,1,1,0,1]
p 7 = [0,1,0,0,1,1,1]
p 8 = [1,1,1,1,1,1,1]
p 9 = [1,1,0,1,1,1,1]

uniq [] = []
uniq (a:[]) = [a]
uniq (a:b:xs) =
  if a == b
  then uniq (a:xs)
  else a:uniq (b:xs)

xor [] [] = []
xor (a:as) (b:bs) = ((a+b)`mod`2):xor as bs

ans _ [] = []
ans st (i:is) =
  let c = xor st $ p i
  in
    c:ans (p i) is

play [] = []
play i = 
  let n = i!!0
      j = take n $ drop 1 i
      r = drop (n+1) i
  in
    (ans [0,0,0,0,0,0,0] j) ++ (play r)

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      i'= takeWhile (/= -1) i
      o = play i'
  mapM_ putStrLn $ map (intercalate "") $ map (map show) o
  
