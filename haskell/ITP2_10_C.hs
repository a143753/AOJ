import Data.Bits
import Data.Word

-- test(i)
fn :: ([String],Word64) -> [Int] -> ([String],Word64)
fn (r,f) [0,i] = if (testBit f i) then (("1":r),f) else (("0":r),f)
-- set(i)
fn (r,f) [1,i] = (r, setBit f i)
-- clear(i)
fn (r,f) [2,i] = (r, clearBit f i)
-- flip(i)
fn (r,f) [3,i] = (r, f `xor` (1 `shiftL` i))
-- all
fn (r,f) [4] = if f == (2^64 - 1) then (("1":r),f) else (("0":r),f)
-- any
fn (r,f) (5:xs) = if f /= 0 then (("1":r),f) else (("0":r),f)
-- none
fn (r,f) (6:xs) = if f == 0 then (("1":r),f) else (("0":r),f)
-- count
fn (r,f) [7] = let c = popCount f in ((show c):r,f)
-- val
fn (r,f) (8:xs) = (((show f):r),f)

ans (r,f) [] = reverse r
ans (r,f) (x:xs) = ans (r',f') xs
  where
    (r',f') = fn (r,f) x
    
  
main = do
  _ <- getLine
  q <- map (map read) <$> map words <$> lines <$> getContents :: IO [[Int]]
  let o = ans ([],0) q
  mapM_ putStrLn o
