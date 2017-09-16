chk s b =
  ( (b!!0 == s) && (b!!1 == s) && (b!!2 == s) ) ||
  ( (b!!3 == s) && (b!!4 == s) && (b!!5 == s) ) ||
  ( (b!!6 == s) && (b!!7 == s) && (b!!8 == s) ) ||

  ( (b!!0 == s) && (b!!3 == s) && (b!!6 == s) ) ||
  ( (b!!1 == s) && (b!!4 == s) && (b!!7 == s) ) ||
  ( (b!!2 == s) && (b!!5 == s) && (b!!8 == s) ) ||

  ( (b!!0 == s) && (b!!4 == s) && (b!!8 == s) ) ||
  ( (b!!2 == s) && (b!!4 == s) && (b!!6 == s) )

ans b
  | chk 'o' b = "o"
  | chk 'x' b = "x"
  | otherwise = "d"

main = do
  c <- getContents
  let i = lines c
      o = map ans i
  mapM_ putStrLn o
  
