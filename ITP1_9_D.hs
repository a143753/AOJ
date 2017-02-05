cmdPrint :: String -> Int -> Int -> IO ()
cmdPrint str a b =
  putStrLn $ take (b-a+1) $ drop a str

cmdReverse :: String -> Int -> Int -> String
cmdReverse str a b =
  let h = take a str
      m = drop a $ take (b+1) str
      f = drop (b+1) str
  in
    h ++ (reverse m) ++ f

cmdReplace :: String -> Int -> Int -> String -> String
cmdReplace str a b p =
  let h = take a str
      f = drop (b+1) str
  in
    h ++ p ++ f


play :: String -> [[String]] -> IO ()
play _ [] = return ()
play str (("print":a:b:_):cmds) = do
  let a' = read a :: Int
      b' = read b :: Int
  cmdPrint str a' b'
  play str cmds

play str (("reverse":a:b:_):cmds) = do
  let a' = read a :: Int
      b' = read b :: Int
      s  = cmdReverse str a' b'
  play s cmds

play str (("replace":a:b:p:_):cmds) = do
  let a' = read a :: Int
      b' = read b :: Int
      s  = cmdReplace str a' b' p
  play s cmds

main = do
  l <- getLine
  c <- getContents
  let i = drop 1 $ map words $ lines c
  play l i
