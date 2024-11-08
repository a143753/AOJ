bmi :: Double -> Double -> Double
bmi w h = w / (h*h)

ans :: [String] -> (Int, Double)
ans (s:w:h:_) =
  let s' = read s :: Int
      w' = read w :: Double
      h' = read h :: Double
  in
    (s', bmi w' h')


split :: String -> [String]
split text =
  let i = lookup ',' $ zip text [0..]
  in
    case i of
      Just j  -> (take j text):(split $ drop (j+1) text)
      Nothing -> [text]

main = do
  c <- getContents
  let l = map ans $ map split $ lines c
      o = filter (\(i,b) -> b >= 25) l
  mapM_ (\(i,b) -> print i) o
