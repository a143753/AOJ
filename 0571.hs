cmp [] = []
cmp (s:sx) =
  let n = length $ takeWhile (== s) sx
      r = drop n sx
  in
    (s,n+1):(cmp r)

scn [] = []
scn (('J',nj):('O',no):('I',ni):xs) =
  if nj >= no && ni >= no
  then no:(scn xs)
  else scn xs
scn (x:xs) = scn xs

ans s =
  let c = cmp s
      r = scn c
  in
    if r == []
    then 0
    else maximum r

main = do
  l <- getLine
  let o = ans l
  print o
