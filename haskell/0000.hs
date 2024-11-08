-- QQ
-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0000

f :: (Int,Int) -> String
f (a,b) = show(a) ++ "x" ++ show(b) ++ "=" ++ show(a*b)

main = do
  let i = [ (x,y) | x <- [1..9], y <- [1..9] ]
      j = map f i
  mapM_ putStrLn j

