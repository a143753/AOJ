main = do
  let a = 7
  let b = 8
  putStrLn $ unwords $ map show [a,b]
  let t = a
  let a = b
  let b = t
  putStrLn $ unwords $ map show [a,b]
