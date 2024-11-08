import Data.List

enc1 :: Char -> [Int]
enc1 c =
  case c of
    ' '  -> [1,0,1]
    '\'' -> [0,0,0,0,0,0]
    ','  -> [0,0,0,0,1,1]
    '-'  -> [1,0,0,1,0,0,0,1]
    '.'  -> [0,1,0,0,0,1]
    '?'  -> [0,0,0,0,0,1]
    'A'  -> [1,0,0,1,0,1]
    'B'  -> [1,0,0,1,1,0,1,0]
    'C'  -> [0,1,0,1]
    'D'  -> [0,0,0,1]
    'E'  -> [1,1,0]
    'F'  -> [0,1,0,0,1]
    'G'  -> [1,0,0,1,1,0,1,1]
    'H'  -> [0,1,0,0,0,0]
    'I'  -> [0,1,1,1]
    'J'  -> [1,0,0,1,1,0,0,0]
    'K'  -> [0,1,1,0]
    'L'  -> [0,0,1,0,0]
    'M'  -> [1,0,0,1,1,0,0,1]
    'N'  -> [1,0,0,1,1,1,1,0]
    'O'  -> [0,0,1,0,1]
    'P'  -> [1,1,1]
    'Q'  -> [1,0,0,1,1,1,1,1]
    'R'  -> [1,0,0,0]
    'S'  -> [0,0,1,1,0]
    'T'  -> [0,0,1,1,1]
    'U'  -> [1,0,0,1,1,1,0,0]
    'V'  -> [1,0,0,1,1,1,0,1]
    'W'  -> [0,0,0,0,1,0]
    'X'  -> [1,0,0,1,0,0,1,0]
    'Y'  -> [1,0,0,1,0,0,1,1]
    'Z'  -> [1,0,0,1,0,0,0,0]

enc1' [] = []
enc1' (s:sx) = (enc1 s) ++ (enc1' sx)

enc2 :: [Int] -> Char
enc2 c =
  case c of
    [0,0,0,0,0] -> 'A'
    [0,0,0,0,1] -> 'B'
    [0,0,0,1,0] -> 'C'
    [0,0,0,1,1] -> 'D'
    [0,0,1,0,0] -> 'E'
    [0,0,1,0,1] -> 'F'
    [0,0,1,1,0] -> 'G'
    [0,0,1,1,1] -> 'H'
    [0,1,0,0,0] -> 'I'
    [0,1,0,0,1] -> 'J'
    [0,1,0,1,0] -> 'K'
    [0,1,0,1,1] -> 'L'
    [0,1,1,0,0] -> 'M'
    [0,1,1,0,1] -> 'N'
    [0,1,1,1,0] -> 'O'
    [0,1,1,1,1] -> 'P'
    [1,0,0,0,0] -> 'Q'
    [1,0,0,0,1] -> 'R'
    [1,0,0,1,0] -> 'S'
    [1,0,0,1,1] -> 'T'
    [1,0,1,0,0] -> 'U'
    [1,0,1,0,1] -> 'V'
    [1,0,1,1,0] -> 'W'
    [1,0,1,1,1] -> 'X'
    [1,1,0,0,0] -> 'Y'
    [1,1,0,0,1] -> 'Z'
    [1,1,0,1,0] -> ' '
    [1,1,0,1,1] -> '.'
    [1,1,1,0,0] -> ','
    [1,1,1,0,1] -> '-'
    [1,1,1,1,0] -> '\''
    [1,1,1,1,1] -> '?'

enc2' :: [Int] -> String
enc2' [] = []
enc2' s =
  let d = take 5 s
      r = drop 5 s
  in
    (enc2 d):(enc2' r)

--enc :: String -> String
enc x =
  let e1 = enc1' x
      ln = (length e1) `mod` 5
      e' = if ln /= 0
           then e1 ++ (replicate (5-ln) 0)
           else e1
      e2 = enc2' e'
  in
    e2

main = do
  c <- getContents
  let i = lines c
      o = map (enc) i
  mapM_ putStrLn o