srch :: [String] -> Char -> (Int, Int)
srch m c = 
  let h = length m
      w = length (head m)
      positions = [(i, j) | i <- [0..h-1], j <- [0..w-1], (m !! i) !! j == c]
  in
    if null positions then (-1, -1) else head positions

calc :: [(Int, Int)] -> Int
calc ((x1,y1):[]) = 0
calc ((x1,y1):(x2,y2):xs) = abs (x1 - x2) + abs (y1 - y2) + 1 + calc ((x2,y2):xs)

ans' m s =
  calc ((0,0):(map (srch m) s))

ans (hw:r) =
  let [h, w] = map read $ words hw :: [Int]
      m = take h r
      s = head $ drop h r
  in
    if h == 0 && w == 0 then [] else (ans' m s):(ans $ drop (h + 1) r)

main = do
  c <- lines <$> getContents :: IO [String]
  let o = ans c
  mapM_ print o
  
