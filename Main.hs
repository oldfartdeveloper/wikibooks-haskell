module Main where

import Prelude

--Adjust following to choose the actual program you want to run:
--import ElementaryHaskell.ControlStructures (mainX)
import IntermediateHaskell.StandalonePrograms (mainX)
import IntermediateHaskell.Indentation (doGuessing')
import Monads.IoApplicativeFunctor (interactiveDoubling, interactiveSumming, interactiveConcatenating, interactiveConcatenating')
import Monads.DoNotation (nameDo, nameLambda, greetAndSeeYou, nameReturnAndCarryOn)
import Solitaire.AnsiColor (ansiDemo)

main :: IO ()
main = do
  ansiDemo