module Solitaire.Foundation (Foundation, create, addCard, removeCard) where
  
import Prelude

import Solitaire.Card (Card, Suit, deck, suit)

type Foundation = [[Card]]

-- Create an empty foundation
create :: Foundation
create = replicate (1 + fromEnum(maxBound :: Suit)) []

-- Add card to matching suit card list
addCard :: Foundation -> Card -> Foundation
addCard foundation card =
  manageCard Add foundation card

-- Remove card from matching suit card list.
-- NOTE: code does NOT check that card removed is
--       the same as the card argument; assumes code
--       structure is strong enough to not have to
--       worry about this.
removeCard :: Foundation -> Card -> Foundation
removeCard foundation card =
  manageCard Remove foundation card
  
-- Items below are not exported:

data CardAction
  = Add
  | Remove

manageCard :: CardAction -> Foundation -> Card -> Foundation
manageCard action foundation card = do
  let
    suitOffset = fromEnum (suit card)
    (beforeSuits, result) = splitAt suitOffset foundation
    thisSuit = head result
    afterSuits = tail result
  case action of
    Add -> beforeSuits ++ [card : thisSuit] ++ afterSuits
    Remove -> beforeSuits ++ [ tail thisSuit] ++ afterSuits
   