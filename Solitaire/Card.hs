module Solitaire.Card where
  
import Prelude

{-
  This describes the static behaviors of each of the
  52 cards in a deck.  Dynamic card information, such as
  what other card can be transferred to it to unblock it
  is in module Location (probably -- TODO)
-}

import Data.List as List
  
data Deck = List Card

data Card = Card
  { suit :: Suit
  , rank :: Rank
  , color :: Color
  }
  
data Rank -- from lowest to highest
  = Ace
  | Two
  | Three
  | Four
  | Five
  | Six
  | Seven
  | Eight
  | Nine
  | Ten
  | Jack
  | Queen
  | King
  deriving (Eq, Ord, Enum, Bounded)

-- see https://en.wikipedia.org/wiki/High_card_by_suit
-- (but suit order isn't important in Solitaire):
data Suit
  = Club
  | Diamond
  | Heart
  | Spade
  deriving (Eq, Enum, Bounded)
  
data Color
  = Black
  | Red
  deriving (Enum, Bounded)

oppositeColor :: Color -> Color
oppositeColor Black = Red
oppositeColor _ = Black
