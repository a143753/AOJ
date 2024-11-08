f 'A' w = if w == '0' then 'X' else 'Y'
f 'X' w = if w == '0' then 'C' else 'Z'
f 'Y' w = if w == '0' then 'X' else 'C'
f 'Z' w = if w == '0' then 'W' else 'B'
f 'W' w = if w == '0' then 'B' else 'Y'
f 'B' w = if w == '0' then 'Y' else 'X'
f 'C' _ = 'C'

ans ("#":_) = []
ans (x:xs) =
  let d = foldl f 'A' x
      a = if d == 'B' then "Yes" else "No"
  in
    a:ans(xs)

main = do
  c <- getContents
  let i = lines c
      o = ans i
  mapM_ putStrLn o
