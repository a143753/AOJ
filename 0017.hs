-- the  : 116,104,101
-- this : 116,104,105,115
-- that : 116,104, 97,116

key = ["the", "this", "that"]

ans s =
  let c = filter (\x->length(x)==3 || length(x)==4 ) s
  in
    s

main = do
  c <- getContents
  let i = map words $ lines c
      o = map ans i
  mapM_ print o
--  mapM_ putStrLn o
