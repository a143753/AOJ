import Data.List

cmp n0 n1 =
  let l0 = length n0
      l1 = length n1
  in
    if l0 /= l1
    then compare l0 l1
    else compare n0 n1

sumup :: [(String,Int)] -> [(String,Int)]
sumup [] = []
sumup ((n,v):[]) = [(n,v)]
sumup ((n0,v0):(n1,v1):xs) =
  if n0 == n1
  then sumup ( (n0,v0+v1):xs )
  else (n0,v0):(sumup ((n1,v1):xs))
    

main = do
  _ <- getLine
  c <- getContents
  let i = map (\(a:b:_) -> (a,read b) ) $ map words $ lines c :: [(String,Int)]
      o = sumup $ sortBy (\ (n0,v0) (n1,v1) -> cmp n0 n1) i
  mapM_ putStrLn $ map (\(n,v) -> n ++ " " ++ (show(v))) o
  
