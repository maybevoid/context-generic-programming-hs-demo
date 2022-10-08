module Demo3.Components.QueryPersonFromMap where

import Data.HashMap.Strict
import Data.Hashable
import Demo3.Classes.Errors.PersonNotFound
import Demo3.Classes.Monad
import Demo3.Classes.Person
import Demo3.Classes.PersonMap
import Demo3.Classes.PersonQuerier
import Prelude hiding (lookup)

data QueryPersonFromMap

instance
  (HasPersonMap ctx, HasMonad ctx, Ord (PersonId ctx), Hashable (PersonId ctx), InjectPersonNotFoundError ctx) =>
  PersonQuerier QueryPersonFromMap ctx
  where
  query_person ctx person_id = do
    let personMap = getPersonMap ctx
        m_person = lookup person_id personMap
    maybe (raise_person_not_found_error @ctx person_id) return m_person
