module ElementaryHaskell.Lists3 where
  
import Prelude hiding (and, or, maximum, minimum, reverse)
import Data.List (foldl')

and :: [Bool] -> Bool
and [] = True
and (False:_) = False
and (True:xs) = and xs

and' :: [Bool] -> Bool
and' = foldr (&&) True
    
or' :: [Bool] -> Bool
or' = foldr (||) False

maximum :: Ord a => [a] -> a
maximum = foldr1 max

minimum :: Ord a => [a] -> a
minimum = foldr1 min

reverse :: [a] -> [a]
reverse = foldl' flippedCons []
  where
    flippedCons xs x = x : xs
    
returnDivisible :: Int -> [Int] -> [Int] 
returnDivisible n xs = [x | x <- xs, ((mod x n) == 0)]

choosingTails :: [[Int]] -> [[Int]]
choosingTails xss = [xs | (x:xs) <- xss, x > 5]