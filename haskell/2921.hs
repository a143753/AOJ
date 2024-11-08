import Data.Maybe
f n _ [] = Just n
f n s (a:as) =
  if s' < 0 then Nothing else f n s' as
  where
    s' = s + a - n

ans a@(h:_) = fromJust $ head $ filter (/= Nothing ) $ map (\n -> f n 0 a) $ reverse [1..h]

main = do
  _ <- getLine
  l <- getLine
  let i = map read $ words l
      o = ans i
  print o
