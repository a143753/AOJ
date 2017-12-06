chkA ('>':'\'':s)   = chkA_1 s
chkA s              = False

chkA_1 ('=':s)      = chkA_2 n $ dropWhile (== '=') s
  where
    n = 1 + (length . takeWhile (== '=')) s
                        
chkA_1 s            = False
  
chkA_2 n ('#':s)    = chkA_3 n s
chkA_2 n s          = False

chkA_3 n ('=':s)    = if n == m
                      then chkA_4 $ dropWhile (== '=') s
                      else False
  where
    m = 1 + (length . takeWhile (== '=')) s
                        
chkA_3 n s          = False

chkA_4 ('~':[])     = True
chkA_4 s            = False

chkB ('>':'^':s)    = chkB_1 s
chkB s              = False

chkB_1 ('Q':'=':s)  = chkB_2 s
chkB_1 s = False

chkB_2 ('Q':'=':s)  = chkB_2 s
chkB_2 ('~':'~':[]) = True
chkB_2 s = False


ans s =
  let a = chkA s
      b = chkB s
  in
    if a
    then "A"
    else if b
         then "B"
         else "NA"

main = do
  n <- getLine
  c <- getContents
  let n'= read n :: Int
      i = take n' $ lines c
      o = map ans i
  mapM_ putStrLn o
