{-# LANGUAGE BangPatterns #-}
import Control.Monad (forM_, when)
import Control.Monad.ST (ST, runST)
import Data.Array.ST (newArray, readArray, writeArray, STUArray)

ans :: Int -> [Int] -> Int
ans n cs = runST $ do
  let big = n + 1                          -- 到達不能の番兵
  arr <- newArray (0, n) big :: ST s (STUArray s Int Int)
  writeArray arr 0 0
  forM_ cs $ \c -> do
    forM_ [c .. n] $ \i -> do
      a <- readArray arr (i - c)
      b <- readArray arr i
      let !cand = if a >= big then big else a + 1
      when (cand < b) $ writeArray arr i cand
  readArray arr n

main :: IO ()
main = do
  [n,_] <- map read . words <$> getLine :: IO [Int]
  cs    <- map read . words <$> getLine
  print $ ans n cs
  
