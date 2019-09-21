import Data.List

dist (_:[]) = []
dist (a:b:r) = (b-a):(dist (b:r))

ans' w m =
    let d = reverse $ sort $ dist m
        d'= drop (w-1) $ d
    in
        sum d'

ans [] = []
ans ([_,w]:m:r) = (ans' w m):(ans r)

main = do
  _ <- getLine
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o
