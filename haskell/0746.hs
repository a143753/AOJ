import Data.List (sortBy)

ans a =
  let t1 = zip a [1..]
      t2 = sortBy (\(x1,y1) (x2,y2) -> compare x1 x2) t1
      t3 = map (\(x,y) -> (snd x, y, fst x) ) $ zip t2 [1..]
      t4 = sortBy (\(x1,y1,z1) (x2,y2,z2) -> compare x1 x2) t3
  in
    t4

    -- 同タイムの人を同じ順位にする処理が必要。

main = do
  _ <- getLine
  a <- map read <$> words <$> getLine :: IO [Int]
  let o = ans a
  print o
