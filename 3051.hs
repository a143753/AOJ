import Data.List

ans i =
  let j = zip i ['A'..]
      s = maximumBy (\(i,_) (j,_) -> compare i j) j
  in
    snd s

main = do
  l <- getLine
  let i = map read $ words l :: [Int]
      o = ans i
  putStrLn [o]
