module IntermediateHaskell.ClassesAndTypes where
  
import Prelude

data Tree a = Leaf a | Branch (Tree a) (Tree a)

instance Functor Tree where
    fmap f (Leaf x)            = Leaf   (f x)
    fmap f (Branch left right) = Branch (fmap f left) (fmap f right)
