module App.Contexts.Mock where

import App.Classes.Errors.PersonNotFound
import App.Classes.Errors.ShopClosed
import App.Classes.Greeter
import App.Classes.Monad
import App.Classes.Person
import App.Classes.PersonMap
import App.Classes.PersonQuerier
import App.Classes.Time
import App.Components.DaytimeGreeter
import App.Components.QueryPersonFromMap
import App.Components.SimpleGreeter
import App.Types.Person
import Data.HashMap.Strict

data MockContext = MkMockContext
  { personMap :: HashMap String SimplePerson,
    currentTime :: DummyTime
  }

newtype DummyTime = MkDummyTime
  { daytime :: Bool
  }

instance SimpleTime DummyTime where
  isDaytime = daytime

instance HasMonad MockContext where
  type M MockContext = IO

instance HasPersonTypes MockContext where
  type Person MockContext = SimplePerson
  type PersonId MockContext = String

instance HasTime MockContext where
  type Time MockContext = DummyTime

  now = return <$> currentTime

instance HasPersonMap MockContext where
  getPersonMap = personMap

instance HasPersonQuerier MockContext where
  type GetPersonQuerier MockContext = QueryPersonFromMap

instance InjectPersonNotFoundError MockContext where
  raise_person_not_found_error person_id = error $ "person not found: " ++ person_id

instance InjectShopClosedError MockContext where
  raise_shop_closed_error _ = error " "

mockGreet :: MockContext -> String -> IO ()
mockGreet = greet @(DaytimeGreeter SimpleGreeter)
