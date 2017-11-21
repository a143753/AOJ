f [] = True
f ('A':[])    = True
f ('A':'B':s) = f ('B':s)
f ('A':'D':s) = f ('D':s)
f ('A':_)     = False

f ('B':[])    = True
f ('B':'A':s) = f ('A':s)
f ('B':'C':s) = f ('C':s)
f ('B':'E':s) = f ('E':s)
f ('B':_)     = False

f ('C':[])    = True
f ('C':'B':s) = f ('B':s)
f ('C':'F':s) = f ('F':s)
f ('C':_)     = False

f ('D':[])    = True
f ('D':'A':s) = f ('A':s)
f ('D':'E':s) = f ('E':s)
f ('D':'G':s) = f ('G':s)
f ('D':_)     = False

f ('E':[])    = True
f ('E':'B':s) = f ('B':s)
f ('E':'D':s) = f ('D':s)
f ('E':'F':s) = f ('F':s)
f ('E':'H':s) = f ('H':s)
f ('E':_)     = False

f ('F':[])    = True
f ('F':'C':s) = f ('C':s)
f ('F':'E':s) = f ('E':s)
f ('F':'I':s) = f ('I':s)
f ('F':_)     = False

f ('G':[])    = True
f ('G':'D':s) = f ('D':s)
f ('G':'H':s) = f ('H':s)
f ('G':_)     = False

f ('H':[])    = True
f ('H':'G':s) = f ('G':s)
f ('H':'E':s) = f ('E':s)
f ('H':'I':s) = f ('I':s)
f ('H':_)     = False

f ('I':[])    = True
f ('I':'F':s) = f ('F':s)
f ('I':'H':s) = f ('H':s)
f ('I':_)     = False

main = do
  c <- getContents
  let i = lines c
      o = filter f i
  mapM_ putStrLn o
