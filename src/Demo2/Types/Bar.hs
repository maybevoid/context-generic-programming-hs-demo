module Demo2.Types.Bar where

import GHC.Generics

newtype BarState = BarState
  { barCounter :: Int
  }
  deriving (Generic)
