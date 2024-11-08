import Data.List
import Text.Printf

f (a,b) (c,d) = if a /= b
                then compare a c
                else compare b d
cnv x = sortBy f $ map (\[a,b] -> (a,b) ) x

srch _ [] = (0,0)
srch t@((tx,ty):tgt) ((sx,sy):str) =
  let dx = sx-tx
      dy = sy-ty
      rr = map (\e -> elem e str) $ map (\(x,y)->(x+dx,y+dy)) tgt
  in
    if foldr (&&) True rr
    then (dx,dy)
    else srch t str

ans ([0]:_) = []
ans ([n]:xs) =
  let tgt = cnv $ take n xs
      m   = head $ head $ drop n xs
      str = cnv $ take m $ drop (n+1) xs
      a   = srch tgt str
      res = drop (n+1+m) xs
  in
    a:ans res

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ (\(a,b) -> printf "%d %d\n" a b) o
  
