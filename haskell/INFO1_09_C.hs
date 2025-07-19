import Control.Monad (forM_, when)
import Control.Monad.ST (runST,ST)
import Data.Array.ST (STArray, newArray, readArray, writeArray, freeze)
import Data.Array (Array, elems)

main :: IO ()
main = do
  n <- readLn :: IO Int
  _q <- getLine
  contents <- getContents
  let numbers = map read (lines contents) :: [Int]
  let histogram = runST $ do
        arr <- newArray (0, n-1) 0 :: ST s (STArray s Int Int)
        forM_ numbers $ \num -> do
          when (num >= 0 && num < n) $ do
            count <- readArray arr num
            writeArray arr num (count + 1)
        freeze arr
  mapM_ print (elems histogram)
  
