{-# LANGUAGE BangPatterns #-}

import Data.Array.IO
import Data.Char (isSpace)
import qualified Data.ByteString.Char8 as BS

readInts :: BS.ByteString -> [Int]
readInts bs =
  case BS.readInt (BS.dropWhile isSpace bs) of
    Nothing        -> []
    Just (x, rest) -> x : readInts rest

solve :: Int -> [Int] -> IO Int
solve n input = do
  history <- newArray (0, n) 0 :: IO (IOUArray Int Int)

  let
    go :: Int -> Int -> [Int] -> IO Int
    go !_ !current [] =
      pure current

    go !k !current (x : y : rest)
      | y == 0 = do
          let !newValue = current + 1
          writeArray history (k + 1) newValue
          go (k + 1) newValue rest

      | y == x + 1 = do
          writeArray history (k + 1) current
          go (k + 1) current rest

      | otherwise = do
          oldValue <- readArray history (k - x)

          let !newValue =
                if y <= current - oldValue
                  then current + 1
                  else current

          writeArray history (k + 1) newValue
          go (k + 1) newValue rest

    -- 入力が不正で最後に整数が1個だけ余った場合
    go !_ !current _ =
      pure current

  writeArray history 0 0
  go 0 0 input

main :: IO ()
main = do
  values <- readInts <$> BS.getContents

  case values of
    [] ->
      pure ()

    n : operations -> do
      answer <- solve n operations
      print answer
