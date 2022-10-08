module Demo3.Classes.PersonMap where

import Data.HashMap.Strict
import Demo3.Classes.Person

class (HasPersonTypes ctx) => HasPersonMap ctx where
  getPersonMap :: ctx -> HashMap (PersonId ctx) (Person ctx)
