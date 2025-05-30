main = do
  let a = 10
  let b = 15
  putStrLn $ unwords $ map show [a,b]
  putStrLn $ unwords $ map show [b,a]
  
