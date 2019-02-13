import Data.List

-- pe : その状態にいる確率
-- ps : 弁当をもらえる確率

next a [] = if a == 0 then [] else [(a,1.0)]
next a ((pe,ps):ss) = (pe*ps,ps/2):(next (a + pe*(1-ps) ) ss)

sort s = sortBy (\ (e1,s1) (e2,s2) -> compare s1 s2) s

pack [] = [] 
pack (s:[]) = [s]
pack ((pe0,ps0):(pe1,ps1):ss) =
    if ps0 == ps1
    then pack ((pe0+pe1,ps1):ss)
    else (pe0,ps0):(pack ((pe1,ps1):ss))

expe [] = 0
expe ((pe,ps):ss) = (pe*ps) + (expe ss)

ans' s 1 = []
ans' s n =
    let ex = next 0 s
    in 
        ex:(ans' ex (n-1))
        

ans s 1 = expe s
ans s n = 
    let ex = expe s
        ns = next 0 s
    in
        ex + ans ns (n-1)

main = do
    c <- getContents
    let init = [(1.0,1.0)]
        i = takeWhile (/= 0) $ map read $ lines c :: [Int]
        o = map (ans init) i
        o'= map (ans' init) i
    mapM_ print o
--    mapM_ print o'
-- Memory Limit Exceeded or Time Limit Exceeded
-- modを100にしてpack,sortの回数を減らすとメモリ不足で落ちる

-- (1,1)
-- (1,0.5)
-- (0.5,1), (0.5,0.25)
-- (0.4375,1) (0.5,0.5) (0.0625,0.125)
