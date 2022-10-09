module Demo1.Components.Bar where

import Control.Monad.State.Strict
import Demo1.Classes.MFunc

newtype BarState = BarState
  { barCounter :: Int
  }

data Bar

instance
  (Monad m, MonadState BarState m) =>
  MFunc Bar m
  where
  type In Bar = Int
  type Out Bar = String

  apply x = do
    barState <- get
    let newBarCounter = barCounter barState + x
    put $ barState {barCounter = newBarCounter}
    return $ "bar: " ++ show newBarCounter
