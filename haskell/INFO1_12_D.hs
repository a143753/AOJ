import Control.Monad (forM_, when)
import Control.Monad.ST (runST,ST)
import Data.Array.ST (STArray, newArray, readArray, writeArray, freeze)
import Data.Array (Array, elems)

core :: Int -> Int -> [[Int]] -> Array Int Int
core n m q = runST $ do
  arr <- newArray (0, n*m-1)0 :: ST s (STArray s Int Int)
  forM_ q $ \[i1,j1,i2,j2] -> do
    forM_ [i1..i2] $ \i -> do
      forM_ [j1..j2] $ \j -> do
        count <- readArray arr (j + i*m)
        writeArray arr (j + i*m) (count + 1)
  freeze arr

ans n m q = mat m ar
  where
    ar = elems $ core n m q
    mat m a
      | a == []   = []
      | otherwise = r:x
        where
          r = take m a
          x = mat m(drop m a)

main = do
  [n,m,nq] <- map read . words <$> getLine :: IO [Int]
  q <- map (map read) <$> map words <$> take nq <$> lines <$> getContents :: IO [[Int]]
  let ar = ans n m q
  mapM_ putStrLn $ map (unwords . map show) ar
