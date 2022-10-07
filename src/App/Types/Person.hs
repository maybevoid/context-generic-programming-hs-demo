module App.Types.Person where

import App.Classes.Person

newtype SimplePerson = MkPerson
  { name :: String
  }

instance NamedPerson SimplePerson where
  person_name = name
