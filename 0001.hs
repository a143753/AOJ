-- List of Top 3 Hill
-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0001

import Data.List

main = do
  c <- getContents
  let l = map read $ lines c :: [Int]
      a = take 3 $ reverse $ sort l
  mapM_ (putStrLn . show) a
