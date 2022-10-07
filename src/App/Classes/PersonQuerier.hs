module App.Classes.PersonQuerier where

import App.Classes.Monad
import App.Classes.Person

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
