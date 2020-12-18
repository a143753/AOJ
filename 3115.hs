import Data.List
import qualified Data.Set as Set

nubOrd xs = go Set.empty xs where
    go s (x:xs)
        | x `Set.member` s = go s xs
        | otherwise        = x : go (Set.insert x s) xs
    go _ _ = []

ans i =
    length $ nubOrd i

main = do
    _ <- getLine
    l <- getLine
    let i = map read $ words l :: [Int]
        o = ans i
    print o
