import Data.Int
import Data.List
import Data.Array.Unboxed

type Mod = Int64

-- powMod, combのmodで使う素数
p :: Mod
p = 998244353

-- べき乗計算(mod p)
powMod :: Mod -> Mod -> Mod
powMod x n = go x n 1
  where
    go _ 0 acc = acc
    go a b acc
      | odd b     = go (a * a `mod` p) (b `div` 2) (acc * a `mod` p)
      | otherwise = go (a * a `mod` p) (b `div` 2) acc

ans :: Int -> [Mod] -> Mod
ans n a =
  foldl'
  (\acc (i, ai) ->
     let
       x = ai * (powMod ( 1 + ai) i) `mod` p
       y = x * (powMod 2 ((fromIntegral n) - i - 1)) `mod`p
     in
       (acc + y) `mod` p
  )
  0
  (zip [0..] a)
  
main = do
  n <- read <$> getLine :: IO Int
  a <- map read <$> words <$> getLine :: IO [Mod]
  let o = ans n a
  print o
