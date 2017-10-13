-- (a,b,c,d,e,f)
--  e
--  a b c d
--  f
--  5
--  1 3 6 4
--  2

m cmd [a,b,c,d,e,f] =
  case cmd of
    "North" -> [f,b,e,d,a,c]
    "East" ->  [d,a,b,c,e,f]
    "West" ->  [b,c,d,a,e,f]
    "South" -> [e,b,f,d,c,a]
    "Right" -> [a,e,c,f,d,b]
    "Left"  -> [a,f,c,e,b,d]

ans' s _ [] = s
ans' s d (c:cs) =
  let d' = m c d
      s' = head d'
  in
    ans' (s+s') d' cs

ans [] = []
ans ("0":_) = []
ans (n:x) =
  let n' = read n :: Int
      d  = take n' x
      r  = drop n' x
  in
    (ans' 1 [1,3,6,4,5,2] d):(ans r)

main = do
  c <- getContents
  let i = lines c
      o = ans i
  mapM_ print o

-- runtime errorになる。原因不明。
