import Control.Monad (forM_, when)
import Control.Monad.ST (runST,ST)
import Data.Array.ST (STArray, newArray, readArray, writeArray, freeze)
import Data.Array (Array, elems)

mat _ [] = []
mat m a =
  let r = take m a
      x = mat m(drop m a)
  in
    r:x

ans :: Int -> Int -> [[Int]] -> Array Int Int
ans n m q = runST $ do
  arr <- newArray (0, n*m-1)0 :: ST s (STArray s Int Int)
  forM_ q $ \[i,j] -> do
    count <- readArray arr (j + i*m)
    writeArray arr (j + i*m) ( (count + 1) `mod` 2)
  freeze arr

main = do
  [n,m,nq] <- map read . words <$> getLine :: IO [Int]
  q <- map (map read) <$> map words <$> take nq <$> lines <$> getContents :: IO [[Int]]
  let ar = ans n m q
  let o2 = mat m $ elems ar
  mapM_ putStrLn $ map (unwords . map show) o2
