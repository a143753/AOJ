import Data.Char (toUpper)

ans x [] = reverse x
ans [] (s:sr) = ans [s] sr
ans (x:xr) (s:sr) = if x == s then ans (xx:xx:xr) sr else ans (s:x:xr) sr
  where
    xx = toUpper x

main = do
  _ <- getLine
  s <- getLine
  let o = ans [] s
  putStrLn o
