module App.Classes.Time where

import App.Classes.Monad

class SimpleTime time where
  isDaytime :: time -> Bool

class (HasMonad ctx) => HasTime ctx where
  type Time ctx

  now :: ctx -> M ctx (Time ctx)
