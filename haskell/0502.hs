move :: String -> [Int] -> [Int]
move cmd (a:b:c:d:e:f:_) =
  case cmd of
    "North" -> [f,b,e,d,a,c]
    "East" ->  [d,a,b,c,e,f]
    "West" ->  [b,c,d,a,e,f]
    "South" -> [e,b,f,d,c,a]
    "Right" -> [a,e,c,f,d,b]
    "Left"  -> [a,f,c,e,b,d]
move _ _ = []

ans' :: Int -> [Int] -> [String] -> Int
ans' s _ [] = s
ans' s d (c:cs) =
  let d' = move c d
      s' = head d'
  in
    ans' (s+s') d' cs

ans :: [String] -> [Int]
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
  let i = map head $ map words $ lines c
      o = ans i
  mapM_ print o

