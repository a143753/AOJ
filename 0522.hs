cnt pat []  = 0
cnt pat str =
  let sub = take 3 str
      mtc = if pat == sub
            then 1
            else 0
  in
    mtc + (cnt pat $ drop 1 str)

ans [] = []
ans (l:ls) =
  let j = cnt "JOI" l
      i = cnt "IOI" l
  in
    [j,i] ++ (ans ls)

main = do
  c <- getContents
  let i = lines c
      o = ans i
  mapM_ print o
