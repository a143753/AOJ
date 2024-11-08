import Text.Printf

ans i =
  let d = ( (i-1) `mod` 39 ) + 1
  in
    printf "3C%02d" d

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = map ans i
  mapM_ putStrLn o
