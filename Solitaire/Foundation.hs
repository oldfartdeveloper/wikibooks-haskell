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
  manageCard (\b t a -> b ++ [card : t] ++ a) foundation card

-- Remove card from matching suit card list.
-- NOTE: code does NOT check that card removed is
--       the same as the card argument; assumes code
--       structure is strong enough to not have to
--       worry about this.
removeCard :: Foundation -> Card -> Foundation
removeCard foundation card =
  manageCard (\b t a -> b ++ [tail t] ++ a) foundation card

-- Answer whether a card can be added to the foundation.
-- True if Ace's corresponding list is empty
--   or if corresponding pile is card's predecessor
-- otherwise False
canReceiveCard :: Foundation -> Card -> Bool
canReceiveCard foundation card = do
  let
    (_, result) = splitAt (suitOffset card) foundation
    thisSuit = head result
  if rank card == Ace
  then null thisSuit
  else (pred . rank) card == (rank . head) thisSuit
  
-- Items below are not exported:

manageCard :: ([Pile] -> Pile -> [Pile] -> Foundation) ->
  Foundation -> Card -> Foundation
manageCard f foundation card = do
  let
    (beforeSuits, rest) = splitAt (suitOffset card) foundation
    thisSuit = head rest
    afterSuits = tail rest
  f beforeSuits thisSuit afterSuits
   
suitOffset :: Card -> Int
suitOffset card = (fromEnum . suit) card