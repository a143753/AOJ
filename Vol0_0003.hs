-- Is it a Right Triangle (Ä¾³Ñ»°³Ñ·Á)
-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0003

ans :: (Int,Int,Int) -> String
ans (a,b,c)
    | a*a + b*b == c*c = "YES"
    | a*a + c*c == b*b = "YES"
    | c*c + b*b == a*a = "YES"
    | otherwise        = "NO"

main = do
  c <- getContents
  let i = map (map read . words) $ tail $ lines c
      j = map (\(x0:x1:x2:xs) -> (x0,x1,x2)) i
      o = map ans j
  mapM_ (putStrLn) o
