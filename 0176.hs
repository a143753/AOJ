import Data.List

tab = [("black",    0,  0,  0),
       ("blue",     0,  0,255),
       ("lime",     0,255,  0),
       ("aqua",     0,255,255),
       ("red",    255,  0,  0),
       ("fuchsia",255,  0,255),
       ("yellow", 255,255,  0),
       ("white",  255,255,255)]

h2d x = read ("0x"++x) :: Int

ans x =
  let r = h2d $ take 2 $ drop 1 x
      g = h2d $ take 2 $ drop 3 x
      b = h2d $ take 2 $ drop 5 x
      d = map (\ (c,r1,g1,b1) -> (c, (r1-r)^2+(g1-g)^2+(b1-b)^2 ) ) tab
      s = sortBy (\ (c0,d0) (c1,d1) -> compare d0 d1 ) d
  in
    fst $ head s
      
main = do
  c <- getContents
  let i = takeWhile (/= "0") $ lines c
      o = map ans i
  mapM_ putStrLn o
