import Text.Printf
import Data.List

merge :: [[Int]] -> [[Int]]
merge [] = []
merge ((x0:x1:x2:x3:_):[]) = [(x0:x1:x2:x3:[])]
merge ((x0:x1:x2:x3:_):((y0:y1:y2:y3:_):xs))
  | x0==y0 && x1==y1 && x2==y2 = merge ((x0:x1:x2:x3+y3:[]):xs)
  | otherwise                  = (x0:x1:x2:x3:[]):(merge ((y0:y1:y2:y3:[]):xs))

look :: [[Int]] -> (Int, Int, Int) -> Int
look [] (_,_,_) = 0
look ((x:y:z:v:_):xs) (b,f,r)
  | (x-1)==b && (y-1)==f && (z-1)==r  = v
  | otherwise             = look xs (b,f,r)

line = ["####################\n"]

ans3 :: [[Int]] -> (Int, Int, Int) -> Int -> String
ans3 table (b,f,r) k
  | k == r    = "\n"
  | otherwise = let c = look table (b,f,k)
                    s = printf " %d" c :: String
                in
                  s ++ (ans3 table (b,f,r) (k+1))

ans2 :: [[Int]] -> (Int, Int, Int) -> Int -> [String]
ans2 table (b,f,r) j
  | j == f     = []
  | otherwise  = (ans3 table (b,j,r) 0):(ans2 table (b,f,r) (j+1))

ans1 :: [[Int]] -> (Int, Int, Int) -> Int -> [String]
ans1 table (b,f,r) i
  | i == b - 1 = (ans2 table (i,f,r) 0)
  | otherwise  = (ans2 table (i,f,r) 0) ++ line ++ (ans1 table (b,f,r) (i+1))

main = do
  c <- getContents
  let l = map (map read) $ map words $ lines c :: [[Int]]
      i = drop 1 l
      i' = merge $ sort i
      o = ans1 i' (4,3,10) 0
  mapM_ putStr o
