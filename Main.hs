module Main where

import Prelude

--Adjust following to choose the actual program you want to run:
--import ElementaryHaskell.ControlStructures (mainX)
import IntermediateHaskell.StandalonePrograms (mainX)
import IntermediateHaskell.Indentation (doGuessing')
import Monads.IoApplicativeFunctor (interactiveDoubling, interactiveSumming, interactiveConcatenating, interactiveConcatenating')

main :: IO ()
main = do
  interactiveConcatenating'
  