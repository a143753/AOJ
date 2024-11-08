ans :: [(Int,Int)] -> (Int,Int)
ans dt =
  let s = sum $ map (\(a,b) -> a*b) dt
      n = sum $ map (\(a,b) -> b) dt
      i = length dt
      a'= (n*10) `div` i
      a = if a' `mod` 10 >= 5
          then a' `div` 10 + 1
          else a' `div` 10
  in
    (s,a)

split :: String -> (Int,Int)
split text =
        let Just i = lookup ',' $ zip text [0..]
            a = read $ take i text
            b = read $ drop (i+1) text
        in
          (a,b)

main = do
    c <- getContents
    let s = map split $ lines c
        o = ans s
    print $ fst o
    print $ snd o
