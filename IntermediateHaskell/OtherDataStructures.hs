module IntermediateHaskell.OtherDataStructures where
  
import Prelude

data Tree a = Leaf a | Branch (Tree a) (Tree a)

treeMap :: (a -> b) -> Tree a -> Tree b
treeMap f = g where
  g (Leaf x) = Leaf (f x)
  g (Branch left right) = Branch (g left) (g right)

treeFold :: (b -> b -> b) -> (a -> b) -> Tree a -> b
treeFold fbranch fleaf = g where
  g (Leaf x) = fleaf x
  g (Branch left right) = fbranch (g left) (g right)
  
tree1 :: Tree Int
tree1 = 
    Branch
       (Branch 
           (Branch 
               (Leaf 1) 
               (Branch (Leaf 2) (Leaf 3))) 
           (Branch 
               (Leaf 4) 
               (Branch (Leaf 5) (Leaf 6)))) 
       (Branch
           (Branch (Leaf 7) (Leaf 8)) 
           (Leaf 9))
 
doubleTree = treeMap (*2)  -- doubles each value in tree
sumTree = treeFold (+) id -- sum of the leaf values in tree
fringeTree = treeFold (++) (: [])  -- list of the leaves of tree

{- 
Contrived datatype provided by book.

Trying to make it lest contrived by implementing
some of my own structure by making it a small coin
calculator.  Added data Coin and pennies.
-}

data Coin = Penny
          | Nickel
          | Dime
          | Quarter

pennies :: Coin -> Int
pennies Penny = 1
pennies Nickel = 5
pennies Dime = 10
pennies Quarter = 25


data Weird a b = First a
               | Second b
               | Third [(a,b)]
               | Fourth (Weird a b)
  deriving (Show)

weirdMap :: (a -> c) -> (b -> d) -> Weird a b -> Weird c d
weirdMap fa fb = g
  where
    g (First x)   = First (fa x)
    g (Second y)  = Second (fb y)
    g (Third z) = Third ( map (\(x, y) -> (fa x, fb y) ) z)      
    g (Fourth w)  = Fourth (g w) 
    
weirdFa1 coin = pennies coin
weirdFb1 = (+) (-1)

weirdFc1 :: [(Coin, Int)] -> Int
weirdFc1 = sum . thirds
  where
    thirds = map sumTuple
      where
        sumTuple (coin, y) = (pennies coin) * y
    
make_dollar = 60
weirdFd1 = (+) make_dollar


weirdFirst1 = First Nickel
weirdSecond1 = Second 5

-- Each Tuple contains coin type and how many there are
weirdThird1 = Third [(Dime, 3), (Quarter, 2)]

weirdFourth1 = Fourth (Third [(Nickel, 2), (Dime,3)])

weirdFold :: (a -> c) -> (b -> c) -> ([(a,b)] -> c) -> (c -> c) -> Weird a b -> c
weirdFold f1 f2 f3 f4 = g
  where
    g (First x)          = f1 x
    g (Second y)         = f2 y
    g (Third z)          = f3 z
    g (Fourth w)         = f4 (g w)
