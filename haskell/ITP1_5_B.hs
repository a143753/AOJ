import Data.List

ans [h,w] = (tb:ot') ++ [tb,"\n"]
  where
    tb = (take w $ repeat '#') ++ "\n"
    ot = "#" ++ take (w-2) (repeat '.') ++ "#\n"
    ot'= take (h-2) (repeat ot)
    
main = do
  c <- map (map read) <$> map words <$> lines <$> getContents :: IO [[Int]]
  let i = takeWhile (\[x,y]-> x /= 0 || y /= 0) c
      o = map ans i
  mapM_ (mapM_ putStr) o
