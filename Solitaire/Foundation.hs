module Solitaire.Foundation where
  
import Prelude

import Solitaire.Card (Card, Suit, deck, suit)

type Foundation = [[Card]]

create :: Foundation
create = replicate (1 + fromEnum(maxBound :: Suit)) []

addCard :: Foundation -> Card -> Foundation
addCard foundation card = do
  let suitOffset = fromEnum (suit card)
      (beforeSuits, result) = splitAt suitOffset foundation
      thisSuit = head result
      afterSuits = tail result
  beforeSuits ++ [card : thisSuit] ++ afterSuits
