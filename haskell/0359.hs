-- 2017/9/1 -> Fri

ans i =
  let r = i `mod` 7
  in
    case r of
      0 -> "thu"
      1 -> "fri"
      2 -> "sat"
      3 -> "sun"
      4 -> "mon"
      5 -> "tue"
      6 -> "wed"

main = do
  l <- getLine
  let i = read l :: Int
      o = ans i
  putStrLn o
  
