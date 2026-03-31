ans a b = if a < b
          then -1
               else if a == b
                    then 0
                    else 1

main = do
  [a,b] <- map read <$> lines <$> getContents :: IO [Int]
  let o = ans a b
  print o
      
