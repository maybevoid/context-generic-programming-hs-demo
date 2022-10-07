module App.Classes.Greeter where

import App.Classes.Monad
import App.Classes.Person

class
  (HasMonad ctx, HasPersonTypes ctx) =>
  Greeter greeter ctx
  where
  greet :: ctx -> PersonId ctx -> M ctx ()
