import Text.Printf
main = do
  c <- getContents
  let i  = map read $ words $ ((lines c)!!1) :: [Int]
  printf "%d %d %d\n" (minimum i) (maximum i) (sum i)
  
