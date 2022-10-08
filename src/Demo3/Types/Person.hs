module Demo3.Types.Person where

import Demo3.Classes.Person

newtype SimplePerson = MkPerson
  { name :: String
  }

instance NamedPerson SimplePerson where
  person_name = name
