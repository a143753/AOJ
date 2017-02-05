import Data.List

conv :: [Int] -> [(Int,Int)]
conv [] = []
conv lst@(l:ls) = 
  let n = length $ takeWhile (==l) lst
  in
    (l,n):(conv $ drop n lst)

--ans :: [Int] -> [Int]
ans :: [Int] -> [(Int,Int)]
ans list =
  let sort0 = sort list
      conv0 = conv sort0
      sort1 = sortBy (\(v1,n1) (v2,n2) -> compare n2 n1) conv0
      ans   = takeWhile (\(f,s) -> s >= snd (sort1!!0)) sort1
  in
    ans

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = ans i
  mapM_ (putStrLn . show . fst) o
