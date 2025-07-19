import qualified Data.Vector.Mutable as M
import qualified Data.Vector as V
import Control.Monad (forM_, when)
import Control.Monad.ST (runST)

main :: IO ()
main = do
  n <- readLn :: IO Int
  _q <- getLine
  contents <- getContents
  let numbers = map read (lines contents) :: [Int]
  let histogram = runST $ do
        vec <- M.replicate n (0::Int)
        forM_ numbers $ \num -> do
          M.modify vec (+1) num  -- numの値をインクリメント
        V.freeze vec
  mapM_ print (V.toList histogram)

-- localではcompileに通って期待通りに動作したが,submitするとcompile errorになる。
-- Data.Vector.Mutableがimportできない。
