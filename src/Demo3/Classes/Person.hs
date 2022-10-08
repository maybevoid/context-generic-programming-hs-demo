module Demo3.Classes.Person where

class NamedPerson person where
  person_name :: person -> String

class
  (NamedPerson (Person ctx)) =>
  HasPersonTypes ctx
  where
  type PersonId ctx
  type Person ctx
