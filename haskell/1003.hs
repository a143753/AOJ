import Data.Char (digitToInt)

key = [ "',.!?",
        "abcABC",
        "defDEF",
        "ghiGHI",
        "jklJKL",
        "mnoMNO",
        "pqrsPQRS",
        "tuvTUV",
        "wxyzWXYZ"
      ]

dec :: (Int, Int) -> String
dec (0, n) = take (n-1) $ repeat ' ' 
dec (k, n) = [ ( cycle $ key !! (k-1) ) !! (n-1) ]

splt :: String -> [(Int, Int)]
splt [] = []
splt x@(xh:_) = (c,l):(splt r)
  where
    h = takeWhile (\x' -> x' == xh) x
    c = digitToInt xh
    l = length h
    r = drop l x

ans s = concat $ map dec $ splt s

main = do
  i <- lines <$> getContents :: IO [String]
  let o = map ans i
  mapM_ putStrLn o
