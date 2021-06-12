module ElementaryHaskell.ControlStructures where
  
import Prelude

fakeIfFunction :: (Eq a) => a -> a -> Bool
fakeIfFunction x y =
  x == y

fakeIf :: Bool -> b -> b -> b
fakeIf condition trueResult falseResult =
  case condition of
    True -> trueResult
    False -> falseResult

    
--main :: IO ()
--main = do
--  do x <- getX
--     putStrLn x
--    putStrLn "Enter your number to guess:"
--    nStr <- getLine
--    (doGuessing . read) nStr
     
--getX =
-- do return "My Shangri-La"
--    return "beneath"
--    return "the summer moon"
--    return "I will"
--    return "return"
--    return "again"

--doGuessing :: Int -> ()
--doGuessing target = do
--  putStrLn "Enter your guess:"
--  guess <- getLine
--  case compare target (read guess) of
--    EQ -> do putStrLn "You win!"; ()
--    LT -> do putStrLn "Too low!"; doGuessing target
--    GT -> do putStrLn "Too high!"; doGuessing target
    
mainX :: IO ()
mainX = do
  putStrLn "Hello, what is your name?"
  name <- getLine
  case name of
      "Simon" -> greatlanguage
      "John"  -> greatlanguage
      "Phil"  -> greatlanguage
      "Koen"  -> putStrLn "I think debugging Haskell is fun."
      _       -> putStrLn "Sorry, I don't know you."
      where
      greatlanguage = putStrLn "I think Haskell is a great programming language."
    