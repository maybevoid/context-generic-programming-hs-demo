module App.Components.QueryPersonFromMap where

import App.Classes.Errors.PersonNotFound
import App.Classes.Monad
import App.Classes.Person
import App.Classes.PersonMap
import App.Classes.PersonQuerier
import Data.HashMap.Strict
import Data.Hashable
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
