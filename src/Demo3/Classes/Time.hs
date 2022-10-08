module Demo3.Classes.Time where

import Demo3.Classes.Monad

class SimpleTime time where
  isDaytime :: time -> Bool

class (HasMonad ctx) => HasTime ctx where
  type Time ctx

  now :: ctx -> M ctx (Time ctx)
