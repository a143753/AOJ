import Data.List

main = do
  l <- getLine
  let [i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12] = sort $ map read $ words l :: [Int]
      j1 = i1 == i2 && i1 == i3 && i1 == i4
      j2 = i5 == i6 && i5 == i7 && i5 == i8
      j3 = i9 == i10&& i9 == i11&& i9 == i12
      re = if j1 && j2 && j3
           then "yes"
           else "no"
  putStrLn re
