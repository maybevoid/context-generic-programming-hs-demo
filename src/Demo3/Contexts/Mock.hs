module Demo3.Contexts.Mock where

import Data.HashMap.Strict
import Demo3.Classes.Errors.PersonNotFound
import Demo3.Classes.Errors.ShopClosed
import Demo3.Classes.Greeter
import Demo3.Classes.Monad
import Demo3.Classes.Person
import Demo3.Classes.PersonMap
import Demo3.Classes.PersonQuerier
import Demo3.Classes.Time
import Demo3.Components.DaytimeGreeter
import Demo3.Components.QueryPersonFromMap
import Demo3.Components.SimpleGreeter
import Demo3.Types.Person

data MockContext = MkMockContext
  { personMap :: HashMap String SimplePerson,
    currentTime :: DummyTime
  }

newtype DummyTime = MkDummyTime
  { daytime :: Bool
  }

instance HasGreeter MockContext where
  type GetGreeter MockContext = DaytimeGreeter SimpleGreeter

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
mockGreet = greetWithCtx
