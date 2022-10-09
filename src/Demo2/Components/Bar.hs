module Demo2.Components.Bar where

import Control.Monad.State.Strict
import Demo2.Classes.MFunc
import Optics.Core

data Bar

instance
  (Monad m, MonadState s m, LabelOptic' "barCounter" A_Lens s Int) =>
  MFunc Bar m
  where
  type In Bar = Int
  type Out Bar = String

  apply x = do
    barState <- get @s
    let newBarCounter = barState ^. #barCounter + x
    put $ barState & #barCounter .~ newBarCounter
    return $ "bar: " ++ show newBarCounter
