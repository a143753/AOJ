import Control.Monad (forM_, when)
import Control.Monad.ST
import Data.Array.ST 
import Data.Array (Array)
import Data.STRef (newSTRef, readSTRef, writeSTRef,modifySTRef')
import Debug.Trace (traceShow)

srch :: STUArray s Int Int -> ST s (Int, Int)
srch arr = do
  (l, r) <- getBounds arr
  v0 <- readArray arr l
  ci <- newSTRef l
  cv <- newSTRef v0
  forM_ [l+1..r] $ \ i -> do
    v <- readArray arr i
    mv <- readSTRef cv
    when (v > mv) $ writeSTRef ci i >> writeSTRef cv v
  (,) <$> readSTRef ci <*> readSTRef cv
    
--updateMax :: Int -> Int -> Int -> Int -> Array Int Int -> (Int, Int)
new_max newidx newval curidx curval newarr
  | newidx == curidx && newval > curval = pure (newidx, newval)
  | newidx == curidx                    = srch newarr
  | curval > newval                     = pure (curidx, curval)
  | curval == newval                    = pure $ if curidx < newidx then (curidx, curval) else (newidx, newval)
  | otherwise                           = pure (newidx, newval)

ans :: Int -> [[Int]] -> [(Int, Int)]
ans n c = runST $ do
  arr  <- newArray (1, n) 0 :: ST s (STUArray s Int Int)
  curidx <- newSTRef 0
  curval <- newSTRef 0
  curlog <- newSTRef []
  
  forM_ c $ \ [i,v] -> do
    x <- readArray arr i
    
    let newval = x + v
    let newidx = i
    writeArray arr newidx newval
    
    curidx' <- readSTRef curidx
    curval' <- readSTRef curval
    
    (tmpidx,tmpval) <- new_max newidx newval curidx' curval' arr

    writeSTRef curidx tmpidx
    writeSTRef curval tmpval
    
    modifySTRef' curlog ((tmpidx, tmpval):)
    
  reverse <$> readSTRef curlog
      
main = do
  [n,_] <- map read <$> words <$> getLine :: IO [Int]
  c <- map ((map read) . words) <$> lines <$> getContents :: IO [[Int]]
  let o = ans n c
  mapM_ (\e -> putStrLn $ unwords $ map show [fst e, snd e] ) o
