import Data.List

ans' :: Int -> [[Int]] -> Maybe [Int]
ans' s [] = Just [s]
ans' s ([a,b]:xs) =
  let s' = s + a - b
      r  = ans' s' xs
  in
    if s' < 0
    then Nothing
    else
      case r of
        Just r' -> Just (s:r')
        Nothing -> Nothing

ans s c =
  let a = ans' s c
  in
    case a of
      Just a  -> maximum a
      Nothing -> 0

main = do
  _ <- getLine
  s <- getLine
  c <- getContents
  let s' = read s :: Int
      c' = map (map read) $ map words $ lines c :: [[Int]]
      o  = ans s' c'
  print o
