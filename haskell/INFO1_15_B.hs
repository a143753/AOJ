import Control.Monad (forM_, when)
import Control.Monad.ST (runST,ST)
import Data.Array.ST (STArray, newArray, readArray, writeArray, freeze)
import Data.Array (Array, elems)

l2a xs = do
  let n = length xs
  arr <- newArray (0, n-1) 0 :: ST s (STArray s Int Int)
  forM_ (zip [0..] xs) $ \(i, x) -> do
    writeArray arr i x
  return arr
  
main :: IO ()
main = do
  n <- readLn :: IO Int
  a <- map read <$> words <$> getLine
  [i1,i2] <- map read <$> words <$> getLine :: IO [Int]
  let histogram = runST $ do
        arr <- l2a a
        t1 <- readArray arr i1
        t2 <- readArray arr i2
        writeArray arr i1 t2
        writeArray arr i2 t1
        freeze arr
  putStrLn $ unwords $ map show $ (elems histogram)
  
