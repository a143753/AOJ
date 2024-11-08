l w = "+" ++ (take (w-2) $ repeat '-') ++ "+\n"

b w h =
  let line = "|" ++ (take (w-2) $ repeat '.') ++ "|\n"
  in
    concat $ take ((h-3)`div`2) $ repeat line

c w h cc =
  let b = take ((w-3)`div`2) $ repeat '.'
  in
    "|" ++ b ++ cc ++ b ++ "|\n"

ans (wc:hc:cc:_) =
  let w = read wc :: Int
      h = read hc :: Int
  in
    (l w) ++ (b w h) ++ (c w h cc) ++ (b w h) ++ (l w)

main = do
  l <- getLine
  let i = words l
      o = ans i
  putStr o
  
