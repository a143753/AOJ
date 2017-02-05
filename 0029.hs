import Data.List
 
max :: [(Int,String)] -> (Int,String)
max [] = (0,"")
max ((l,w):ls) =
        let (sl,sw) = Main.max ls
        in
                if l > sl
                then (l,w)
                else (sl,sw)
 
merge :: [(Int,String)] -> [(Int,String)]
merge [] = []
merge (x:[]) = [x]
merge ((l,w):xs@((xl,xw):xss)) =
        if w == xw
        then Main.merge ((l+xl,w):(Main.merge xss))
        else ((l,w):(Main.merge xs))
 
ans1 x = 
    let s@(sc:sx) = sort x
        i = zip (repeat 1) s
        (ml,mw) = Main.max $ Main.merge i
    in
        mw
 
ans2 s =
    let l = map (\w -> (length w, w) ) s
        (ml,mw) = Main.max l
    in
        mw
 
ans :: [String] -> (String,String)
ans s =
    let a1 = ans1 s
        a2 = ans2 s
    in
        (a1,a2)
 
main = do
    l <- getLine
    let i = words l
        (a1,a2) = ans i
    putStrLn $ a1 ++ " " ++ a2
 
