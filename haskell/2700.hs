import Data.List

a = "aiueo"

enc1 :: String -> String
enc1 [] = []
enc1 (x0:[]) = []
enc1 (x0:x1:xs) =
  if x0 `elem` a
  then x1:enc1 (x1:xs)
  else enc1 (x1:xs)

encode :: Int -> String -> String
encode _ [] = []
encode n x@(x0:xs) =
  let e = x0:(enc1 x)
      e' = if length e <= n
           then e
           else take n e
  in
    e'

judge []     = True
judge (x:[]) = True
judge (x1:x2:xs)
  | x1 == x2  = False
  | otherwise = judge (x2:xs)

try :: Int -> Int -> [String] -> Int
try n m s
  | n > m    = -1
  | otherwise = 
    if judge $ sort $ map (encode n) s
    then n
    else try (n+1) m s

ans :: [String] -> [Int]
ans [] = []
ans ("0":_) = []
ans (n:ss) =
  let n' = read n :: Int
      i  = take n' ss
      m  = maximum $ map length i
      c  = try 0 m i
  in
    c:(ans $ drop n' ss)
      
main = do
  c <- getContents
  let i = lines c
      o = ans i
  mapM_ print o
