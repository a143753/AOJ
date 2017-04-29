import Data.Char

op "+" n0 n1 = show $ read(n0) + read(n1)
op "-" n0 n1 = show $ read(n0) - read(n1)
op "*" n0 n1 = show $ read(n0) * read(n1)

isOperator s = s == "+" || s == "-" || s == "*"

exec :: [String] -> [String]
exec (n0:n1:o:ls)
  | isOperator o = let r = op o n0 n1
                   in r:ls
  | otherwise = n0:(exec (n1:o:ls))

ans :: [String] -> Int
ans x =
  if length x == 1
  then read $ head x
  else ans $ exec x

main = do
  c <- getLine
  let i = words c
      o = ans i
  print o
