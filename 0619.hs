import Data.List

ans x =
  let a = sum $ take 3 $ reverse $ sort $ take 4 x
      b = sum $ take 1 $ reverse $ sort $ drop 4 x
  in
    a + b

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = ans i
  print o
      
