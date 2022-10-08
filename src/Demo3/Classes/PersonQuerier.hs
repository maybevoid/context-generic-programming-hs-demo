module Demo3.Classes.PersonQuerier where

import Demo3.Classes.Monad
import Demo3.Classes.Person

class
  (HasMonad ctx, HasPersonTypes ctx) =>
  PersonQuerier querier ctx
  where
  query_person :: ctx -> PersonId ctx -> M ctx (Person ctx)

class
  (PersonQuerier (GetPersonQuerier ctx) ctx) =>
  HasPersonQuerier ctx
  where
  type GetPersonQuerier ctx
