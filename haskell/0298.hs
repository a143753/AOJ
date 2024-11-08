import Data.List
import Text.Printf

mins [] = []
mins (h:m:r) = (h*60+m):(mins r)

str m =
  let sh = m `div` 60
      sm = m `mod` 60
  in
    printf "%d:%02d" sh sm

ans :: [[Int]] -> [String]
ans d = map str $ nub $ sort $ concat $ map mins $ map tail d

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  putStrLn $ unwords o
