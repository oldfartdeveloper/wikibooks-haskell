module Monads.UnderstandMonads where
  
import Prelude

printSomethingTwice :: String -> IO ()
printSomethingTwice str = putStrLn str >> putStrLn str >> putStrLn str
