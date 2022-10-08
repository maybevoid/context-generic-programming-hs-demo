module Demo3.Classes.Errors.PersonNotFound where

import Demo3.Classes.Monad
import Demo3.Classes.Person

class
  (HasPersonTypes ctx, HasMonad ctx) =>
  InjectPersonNotFoundError ctx
  where
  raise_person_not_found_error :: PersonId ctx -> M ctx a
