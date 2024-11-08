import Data.List

l1 = [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" ]
l2 = ["ld", "mb", "mp", "nc", "nd", "ng", "nt", "nw", "ps", "qu", "cw", "ts"]

-- |
-- >>> nw "abc"
-- ("a","bc")
-- >>> nw "ncw"
-- ("nc","w")
nw (a:[]) = ([a],[])
nw (a:b:x) = if elem [a,b] l2 then ([a,b],x) else ([a],(b:x))

splt [] = []
splt w =
  let (l,r) = nw w
  in
    l:(splt r)

g l (a:[]) = []
g l (a:b:x) =
  let n = g l (b:x)
  in
    if l == a then (b:n) else n

c (w1,n1) (w2,n2) =
  let i1 = elemIndex w1 (l1++l2)
      i2 = elemIndex w2 (l1++l2)
      cn = compare n1 n2
      ci = compare i2 i1
  in
    if cn /= EQ then cn else ci

f s l =
  let t = p $ sort $ concat $ map (g l) s
      m = maximumBy c t
  in
    if t == []
    then unwords [l, "a 0"]
    else unwords [l, fst m, show $ snd m]


p [] = []
p l@(a:_) =
  let n = length $ takeWhile (== a) l
      r = dropWhile (== a) l
  in
    (a,n):(p r)

ans c =
  let pl = map splt $ words c
      ct = map (f pl) (l1++l2)
  in
    ct

main = do
  _ <- getLine
  c <- getContents
  let o = ans c
  mapM_ putStrLn o
