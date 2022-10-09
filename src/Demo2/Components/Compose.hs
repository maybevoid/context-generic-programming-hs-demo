module Demo2.Components.Compose where

import Demo2.Classes.MFunc

data Compose f g

instance
  (MFunc f m, MFunc g m, Out f ~ In g) =>
  MFunc (Compose f g) m
  where
  type In (Compose f g) = In f
  type Out (Compose f g) = Out g

  apply x = do
    fx <- apply @f @m x
    apply @g fx
