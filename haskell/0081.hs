splitBy :: Char -> String -> [String]
splitBy _ [] = []
splitBy a x =
  let s = takeWhile (/= a) x
      x'= dropWhile (/= a) x
  in
    if x' == []
    then [s]
    else s:(splitBy a $ drop 1 x')

-- 直線QR    y = -1*(y2-y1)/(x2-x1) (x-xq) + yq
-- 直線P1P2  y = (y2-y1)/(x2-x1) (x-x1) + y1
-- 2つの直線の交点
-- (y2-y1)/(x2-x1) (x-x1) + y1 = -1*(y2-y1)/(x2-x1) (x-xq) + yq
-- 
ans (x1:y1:x2:y2:xq:yq:_)
  = if x1 == x2
  then [xq+2*(x1-xq),yq]
  else
      if y1 == y2
      then [xq,yq+2*(y1-yq)]
      else
        let a  = (y2-y1)/(x2-x1)
            xs = a/(a*a+1) * ( a*x1 - y1 + xq/a + yq)
            ys = -1/a*(xs-xq)+yq
        in
          [xq+2*(xs-xq),yq+2*(ys-yq)]

main = do
  c <- getContents
  let i = map (map read) $ map (splitBy ',') $ lines c :: [[Float]]
      o = map ans i
  mapM_ putStrLn $ map unwords $ map (map show) o 
