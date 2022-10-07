module App.Classes.Errors.PersonNotFound where

import App.Classes.Monad
import App.Classes.Person

class
  (HasPersonTypes ctx, HasMonad ctx) =>
  InjectPersonNotFoundError ctx
  where
  raise_person_not_found_error :: PersonId ctx -> M ctx a
