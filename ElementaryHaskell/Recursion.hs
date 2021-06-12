module ElementaryHaskell.Recursion where
  
import Prelude hiding ((!!), length, zip)

factorial 0 = 1
factorial n = abs n * factorial (abs n - 1)

factorial' n = go (abs n) 1
    where
    go n res
        | n > 1     = go (n - 1) (res * n)
        | otherwise = res

doublefactorial 0 = 1
doublefactorial 1 = 1
doublefactorial n = abs n * doublefactorial (abs n - 2)

mult _ 0 = 0                      -- anything times 0 is zero
mult n m = (mult n (m - 1)) + n   -- recurse: multiply by one less, and add an extra copy

--power :: Int -> Int -> Int
power n m = go n m n
  where
    go n m acc
        | m == 0    = 1
        | m > 0     = go n (m - 1) (n * acc)
        | otherwise = acc
        
plusOne x = x + 1

addition x 0 = x
addition x y = addition (plusOne x) (y - 1)

-- Giving up; should be able to figure out but lost patience
log2' n = go n 2
  where
    go n added
        | added > n  = added - 1
        | otherwise  = go n (n `div` added)

-- Book answer
log2 1 = 0
log2 n = 1 + log2 (n `div` 2) -- the "`" make div into infix notation
        
--length :: [a] -> Int
--length []     = 0
--length (x:xs) = 1 + length xs

-- List-based recursion

replicate' :: Int -> a -> [a]
replicate' n c = go n c []
  where
    go 0 c str = str
    go n c str = go (n - 1) c (c : str)
    

(!!) :: [a] -> Int -> a
(!!) (x:xs) 0 = x
(!!) (x:xs) n = (!!) xs (n - 1)

zip :: [a] -> [b] -> [(a, b)]
zip x y = go x y []
    where
      go [] _ z = z
      go _ [] z = z
      go (x:xs) (y:ys) z = go xs ys (z ++ [(x, y)])


length :: [a] -> Int
length l =  go l 0
  where
    go [] acc = acc
    go (x:xs) acc = go xs (acc + 1)

