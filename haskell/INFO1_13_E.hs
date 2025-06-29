import Data.List (intercalate)

to_s x = "(" ++ (intercalate ", " x) ++ ")"
ans n = map show $ take n [0..] :: [String]

main = do
  n <- readLn :: IO Int
  let y = ans n
  putStrLn $ to_s y
