heads ([]:_) = []
heads matrix =
  let h = reverse $ map (head) matrix
      r = map (drop 1) matrix
  in
    h:(heads r)

rot90 ([]:_) = []
rot90 matrix = heads matrix

main = do
  c <- getContents
  let i = lines c
      a90 = rot90 i
      a180= rot90 a90
      a270= rot90 a180
  putStrLn "90"
  mapM_ putStrLn a90
  putStrLn "180"
  mapM_ putStrLn a180
  putStrLn "270"
  mapM_ putStrLn a270
