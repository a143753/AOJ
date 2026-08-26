import Data.List

cmp a b =
  case a of
    'J' -> case b of
             'J' -> EQ
             'O' -> LT
             'I' -> LT
    'O' -> case b of
             'J' -> GT
             'O' -> EQ
             'I' -> LT
    'I' -> case b of
             'J' -> GT
             'O' -> GT
             'I' -> EQ

ans i = sortBy cmp i

main = do
  _ <- getLine
  i <- getLine
  let o = ans i
  putStrLn o
