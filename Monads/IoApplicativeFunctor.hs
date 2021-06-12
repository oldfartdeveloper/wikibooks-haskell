module Monads.IoApplicativeFunctor where
  
import Prelude
import Text.Read

interactiveDoubling :: IO ()
interactiveDoubling = do
  putStrLn "Enter a number:"
  valStr <- getLine
  let mayVal = readMaybe valStr :: Maybe Double
  case mayVal of
    Just val -> putStrLn ("Success: the result is " ++ (show (2*val)))
    Nothing -> do
      putStrLn ("Failure: \"" ++ valStr ++ "\" is not a number")
  interactiveDoubling
    
interactiveSumming :: IO ()
interactiveSumming = do
  putStrLn "Enter 1st number:"
  s1 <- getLine
  putStrLn "Enter 2nd number:"
  s2 <- getLine
  let m1 = readMaybe s1 :: Maybe Double
      m2 = readMaybe s2
  case (+) <$> m1 <*> m2 of 
      Just maySum -> putStrLn ("Success: the sum is " ++ (show maySum))
      Nothing -> do
        putStrLn ("Failure: \"" ++ s1 ++ "\" or \"" ++ s2 ++ "\" is not a number")
  interactiveSumming
  
only2nd = (\_ y -> y) <$> putStrLn "First!" <*> putStrLn "Second!"
       
interactiveConcatenating :: IO ()
interactiveConcatenating = do
    putStrLn "Choose two strings:"
    sz <- (++) <$> getLine <*> getLine
    putStrLn "Let's concatenate them:" *> putStrLn sz
    interactiveConcatenating
    
interactiveConcatenating' :: IO ()
interactiveConcatenating' = do
    sz <- putStrLn "Choose two strings (v2):" *> ((++) <$> getLine <*> getLine)
    putStrLn "Let's concatenate them:" *> putStrLn sz
    interactiveConcatenating
   