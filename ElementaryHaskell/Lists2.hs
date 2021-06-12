module ElementaryHaskell.Lists2 where
  
import Prelude hiding (takeInt, dropInt)
  
takeInt :: Int -> [a] -> [a]
takeInt n l = go n l []
  where
    go 0 _ arr = arr
    go n [] arr = arr
    go n (x:xs) arr = go (n - 1) (xs) (arr ++ [x])
    
dropInt :: Int -> [a] -> [a]
dropInt 0 l = l
dropInt n (x:xs) = dropInt (n - 1) (xs)

sumInt :: (Num a) => [a] -> a
sumInt l = go l 0
  where
      go :: (Num a) => [a] -> a -> a
      go [] acc = acc
      go (x:xs) acc = go xs (acc + x)
      
multiplyList :: Integer -> [Integer] -> [Integer]
multiplyList m list = map ((*) m) list

heads :: [[a]] -> [a]
heads = map head

negateList :: [Int] -> [Int]
negateList = map negate

divisors p = [ f | f <- [1..p], p `mod` f == 0 ]

negateListOfLists :: [[Int]] -> [[Int]]  
negateListOfLists = map (map negate)

