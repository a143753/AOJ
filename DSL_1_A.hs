import System.IO
import System.IO.Streams
import Control.Monad
import Data.List

initial_state :: [[Int]]
initial_state = []

find' :: Int -> [[Int]] -> Maybe [Int]
find' x [] = Nothing
find' x (st:sts)
    | elem x st = Just st
    | otherwise = find' x sts

drop' :: Int -> Int -> [[Int]] -> [[Int]]
drop' _ _ [[]] = [[]]
drop' _ _ [] = []
drop' x y (st:sts)
    | elem x st = sts
    | elem y st = sts
    | otherwise = st : (drop' x y sts)

merge :: Int -> Int -> Maybe[Int] -> Maybe[Int] -> [Int]
merge x y Nothing   Nothing   = [x,y]
merge x y (Just xx) Nothing   = (y:xx)
merge x y Nothing   (Just yy) = (x:yy)
merge x y (Just xx) (Just yy) = xx++yy

unite :: Int -> Int -> [[Int]] -> [[Int]]
unite x y state =
    let xs  = find' x state
        ys  = find' y state
        tmp = drop' x y state
    in
      (merge x y xs ys):tmp

same :: Int -> Int -> [[Int]] -> String
same x y state =
    let set = find' x state
    in
      if set == Nothing
      then "0"
      else
          let (Just s) = set
          in
            if elem y s
            then "1"
            else "0"

action :: Int -> [Int] -> IO [[Int]] -> IO [[Int]]
action max (code:x:y:_) state =
  case code of
    0 -> do
      s <- state
      return $ unite x y s
    1 -> do
      s <- state
      putStrLn $ same x y s
      return s

map' :: (String -> Int) -> [String] -> [Int]
map' f xs = foldl (\acc x -> acc ++ [f x]) [] xs
--map' f xs = foldr (\x acc -> (f x) : acc) [] xs

-- execute :: Int -> [[Int]] -> IO ()
-- execute max state = do
--   eof <- isEOF
--   if eof
--   then
--       return ()
--   else
--       do 
--         c <- getLine
       
--         let c' = words c
--             cc = map' read c'
--             c0 = cc `seq` cc!!0
--             c1 = cc `seq` cc!!1
--             c2 = cc `seq` cc!!2
--         new_state <- action max c0 c1 c2 state
--         execute max new_state
--         return ()

foldrM' :: (Monad m) => (a -> m b -> m b) -> m b -> [a] -> m b
foldrM' _ z [] = z
foldrM' f z (x:xs) = f x (foldrM' f z xs)

main = do
  c1 <- getLine
  let l1 = map read $ words c1 :: [Int]
      max = l1!!0
      state = initial_state

  c2 <- getContents
  let i0 = map words $ lines c2
      i1 = map (map read) i0

  foldrM' (action max) (return []) i1
