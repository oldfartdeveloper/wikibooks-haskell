module Solitaire.Foundation (Foundation, create, addCard, removeCard) where
  
import Prelude

import Data.Foldable (null)

import Solitaire.Card (Card, Suit, Rank(..), deck, rank, suit)

type Pile = [Card]
type Foundation = [Pile]

-- Create an empty foundation
create :: Foundation
create = replicate (1 + fromEnum(maxBound :: Suit)) []

-- Add card to matching suit card list
addCard :: Foundation -> Card -> Foundation
addCard foundation card =
  manageCard (\pile -> card : pile) foundation card where

-- Remove card from matching suit card list.
-- NOTE: code does NOT check that card removed is
--       the same as the card argument; assumes code
--       structure is strong enough to not have to
--       worry about this.
removeCard :: Foundation -> Card -> Foundation
removeCard foundation card =
  manageCard (\pile -> tail pile) foundation card where

-- Answer whether a card can be added to the foundation.
-- True if Ace's corresponding list is empty
--   or if corresponding pile is card's predecessor
-- otherwise False
canReceiveCard :: Foundation -> Card -> Bool
canReceiveCard foundation card = do
  let
    thisSuit = head $ snd $ splitAt (suitOffset card) foundation
  if rank card == Ace
  then null thisSuit
  else (pred $ rank card) == (rank . head) thisSuit
  
-- Items below are not exported:

manageCard :: (Pile -> Pile) ->
  Foundation -> Card -> Foundation
manageCard f foundation card = do
  let
    (before,rest) = splitAt (suitOffset card) foundation
  before ++ [(f $ head rest)] ++ tail rest 
   
suitOffset :: Card -> Int
suitOffset card = fromEnum $ suit card
