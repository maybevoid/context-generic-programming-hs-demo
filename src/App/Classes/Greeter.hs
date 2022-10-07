module App.Classes.Greeter where

import App.Classes.Monad
import App.Classes.Person

class
  (HasMonad ctx, HasPersonTypes ctx) =>
  Greeter greeter ctx
  where
  greet :: ctx -> PersonId ctx -> M ctx ()

class
  (Greeter (GetGreeter ctx) ctx) =>
  HasGreeter ctx
  where
  type GetGreeter ctx

greetWithCtx :: forall ctx. (HasGreeter ctx) => ctx -> PersonId ctx -> M ctx ()
greetWithCtx = greet @(GetGreeter ctx)
