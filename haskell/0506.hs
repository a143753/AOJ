cnv [] = []
cnv x@(xh:xs) =
  let l = length $ takeWhile (== xh) x
      r = drop l x
  in
    (show l)++[xh]++(cnv r)

ans 0 s = s
ans n s = ans (n-1) $ cnv s

play ("0":_) = []
play (n:s:r) =
  let n' = read n
      a  = ans n' s
  in
    a:(play r)

main = do
  c <- getContents
  let o  = play $ lines c
  mapM_ putStrLn o
