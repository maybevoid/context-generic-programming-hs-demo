module Demo3.Components.DaytimeGreeter where

import Demo3.Classes.Errors.ShopClosed (InjectShopClosedError (..))
import Demo3.Classes.Greeter
import Demo3.Classes.Monad
import Demo3.Classes.Person
import Demo3.Classes.PersonQuerier
import Demo3.Classes.Time (HasTime (Time, now), SimpleTime (..))

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
