module App.Components.DaytimeGreeter where

import App.Classes.Errors.ShopClosed (InjectShopClosedError (..))
import App.Classes.Greeter
import App.Classes.Monad
import App.Classes.Person
import App.Classes.PersonQuerier
import App.Classes.Time (HasTime (Time, now), SimpleTime (..))

data DaytimeGreeter in_greeter

instance
  (HasMonad ctx, HasPersonTypes ctx, Greeter in_greeter ctx, InjectShopClosedError ctx, SimpleTime (Time ctx)) =>
  Greeter (DaytimeGreeter in_greeter) ctx
  where
  greet :: ctx -> PersonId ctx -> M ctx ()
  greet ctx person_id = do
    time <- now ctx
    if isDaytime time
      then greet @in_greeter ctx person_id
      else raise_shop_closed_error @ctx time
