import Data.List

ans l =
  let w = sum $ take 3 $ reverse $ sort $ take 10 l
      k = sum $ take 3 $ reverse $ sort $ drop 10 l
  in
    [w,k]

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = ans i
  putStrLn $ unwords $ map show o
