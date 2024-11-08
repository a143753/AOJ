--  N
--W   E
--  S
data Dir = N | E | W | S deriving Eq
data Sp  = In | Out deriving Eq

next d c =
  case c of
    'R' -> case d of
             N -> E
             E -> S
             S -> W
             W -> N
    'L' -> case d of
             N -> W
             W -> S
             S -> E
             E -> N

ans :: Dir -> Sp -> Int -> String -> Int
ans _ _ n [] = n

ans d s n (c:cs) =
  let d' = next d c
      s' = if (d == N)
           then if (c == 'R') then In else Out
           else s
      n' = if (d == W) && (c == 'R') && (s == In) then (n + 1) else n
  in
    ans d' s' n' cs

main = do
  l <- getLine
  let o = ans N In 0 l
  print o
