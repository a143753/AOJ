import Data.Char

tab = [ ['.', ',', '!', '?', ' '],
        ['a', 'b', 'c'],
        ['d', 'e', 'f'],
        ['g', 'h', 'i'],
        ['j', 'k', 'l'],
        ['m', 'n', 'o'],
        ['p', 'q', 'r', 's'],
        ['t', 'u', 'v'],
        ['w', 'x', 'y', 'z']
      ]

ans [] = []
ans s =
  let s' = dropWhile (== 0) s
      w  = takeWhile (/= 0) s'
      k  = head w
      l  = (length w) - 1
      t  = tab!!(k-1)
      tl = length t
      c  = t!!(l `mod` tl)
  in
    if w == [] then [] else c:(ans $ dropWhile (/= 0) s')

main = do
  _ <- getLine
  c <- getContents
  let i = map (map digitToInt) $ lines c :: [[Int]]
      o = map ans i
  mapM_ putStrLn o
