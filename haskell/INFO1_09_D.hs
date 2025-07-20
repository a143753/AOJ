import Control.Monad (forM_, when)
import Control.Monad.ST (runST,ST)
import Data.Array.ST (STArray, newArray, readArray, writeArray, freeze)
import Data.Array (Array, elems)

pack [] = []
pack (a:b:xs) = (a, b) : pack xs

main :: IO ()
main = do
  n <- readLn :: IO Int
  _q <- getLine
  pairs <- pack <$> map read <$> lines <$> getContents :: IO [(Int, Int)]
  let histogram = runST $ do
        arr <- newArray (0, n-1) 0 :: ST s (STArray s Int Int)
        forM_ pairs $ \(a,b) -> do
          forM_ [a..b] $ \num -> do
            count <- readArray arr num
            writeArray arr num (count + 1)
        freeze arr
  mapM_ print (elems histogram)
  
