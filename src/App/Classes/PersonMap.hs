module App.Classes.PersonMap where

import App.Classes.Person
import Data.HashMap.Strict

class (HasPersonTypes ctx) => HasPersonMap ctx where
  getPersonMap :: ctx -> HashMap (PersonId ctx) (Person ctx)
