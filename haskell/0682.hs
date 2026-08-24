import Data.List

ans i =
  let [_,b,_] = sort i
  in
    b

main = do
  i <- map read <$> words <$> getLine :: IO [Int]
  let o = ans i
  print o
