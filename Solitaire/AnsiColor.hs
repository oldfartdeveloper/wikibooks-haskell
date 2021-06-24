module Solitaire.AnsiColor where
  
{-
  From https://hackage.haskell.org/package/ansi-terminal
-}

import System.Console.ANSI

ansiDemo = do
--    Original:
--    setCursorPosition 5 0
--    setTitle "ANSI Terminal Short Example"
--
--    setSGR [ SetConsoleIntensity BoldIntensity
--           , SetColor Foreground Vivid Red
--           ]
--    putStr "Hello ♣️ "
--
--    setSGR [ SetConsoleIntensity NormalIntensity
--           , SetColor Foreground Vivid White
--           , SetColor Background Dull Blue
--           ]
--    putStrLn "World!"
    
  -- My test:
  setSGR [ SetConsoleIntensity NormalIntensity
         ,  SetColor Foreground Vivid Red
         ]
  putStr "Red ❤️ ♦️"
  
--  setSGR [ SetConsoleIntensity NormalIntensity
--         , SetColor Foreground Vivid Black
--         ]
  putStrLn " Black ♣️ ♠️"

