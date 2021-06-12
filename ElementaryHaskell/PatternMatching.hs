module ElementaryHaskell.PatternMatching where
  
import Prelude hiding (scanr)

k = 1

-- 1. Flawed h function.  Problem is that h is not treated as a variable;
-- it's treated as a value holder.

h :: Int -> Bool
h 1 = True
h _ = False


-- 2. About True and False
--    These can be pattern-matched because they are both constructors.

--scanr :: (a -> b -> b) -> b -> [a] -> [b]
--scanr f [] = []
--scanr f list@(x:xs) = f list 
 
data Foo2 = Bar2
          | Baz2 {bazNumber :: Int, bazName :: String}

h' :: Foo2 -> Int
h' Baz2 {bazName = name} = length name
h' Bar2 = 0


