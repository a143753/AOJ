import Text.Printf

main = do
  i <- read <$> getLine :: IO Double
  putStrLn $ printf "%.6f %.6f" (i*i*pi) (i*2*pi)
