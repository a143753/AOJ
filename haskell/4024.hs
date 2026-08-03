import Data.Char (digitToInt)

ans i =
  if length i == 1
  then "No"
  else if maximum i < 9
       then "Yes"
       else "No"

main = do
  i <- map digitToInt <$> getLine :: IO [Int]
  let o = ans i
  putStrLn o
