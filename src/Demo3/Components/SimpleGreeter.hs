module Demo3.Components.SimpleGreeter where

import Control.Monad.IO.Class
import Demo3.Classes.Greeter
import Demo3.Classes.Monad
import Demo3.Classes.Person
import Demo3.Classes.PersonQuerier

data SimpleGreeter

instance
  (HasMonad ctx, HasPersonTypes ctx, HasPersonQuerier ctx, MonadIO (M ctx)) =>
  Greeter SimpleGreeter ctx
  where
  greet :: ctx -> PersonId ctx -> M ctx ()
  greet ctx person_id = do
    person <- query_person @(GetPersonQuerier ctx) ctx person_id
    liftIO (putStrLn $ "Hello, " ++ person_name person ++ "!")
    return ()
