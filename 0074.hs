import Text.Printf

icnv :: Int -> [Int]
icnv min =
  let s = min `mod` 60
      h = (min `div` 60) `mod` 60
      t = (min `div` 3600) `mod` 60
  in
    (t:(h:(s:[])))

cnv :: [Int] -> Int
cnv (t:h:s:_) = t * 3600 + h * 60 + s

ans :: [Int] -> [[Int]]
ans x = [ icnv $ (cnv [2,0,0]) - (cnv x),
          icnv $ ( (cnv [2,0,0]) - (cnv x) ) * 3 ]

main = do
  c <- getContents
  let l = map (map read) $ map words $ lines c :: [[Int]]
      i = takeWhile (/= [-1,-1,-1]) l
      o = concat $ map ans i
  mapM_ (\(t:h:s:_) -> printf "%02d:%02d:%02d\n" t h s) o
  
