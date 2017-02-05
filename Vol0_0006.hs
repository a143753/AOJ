-- Reverse Sequence

main = do
  c <- getContents
  let i = (lines c)!!0
      o = reverse i
  putStrLn o
