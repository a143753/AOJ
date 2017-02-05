hello_world :: [String]
hello_world = "Hello World" : hello_world

main = do
  mapM_ putStrLn $ take 1000 hello_world
