import Data.List (sort)

search np q = if elem q np then 1 else 0

ans c =
  let [x,y,z] = head c
      np = head $ head $ tail c
      p  = sort $ take np $ drop 2 c
      nq = head $ head $ drop (np + 2) c
      q  = take nq $ drop (np + 3) c
  in
    map (search p) q

main = do
  c <- map (map read) <$> map words <$> lines <$> getContents :: IO [[Int]]
  let o = ans c
  mapM_ print o
