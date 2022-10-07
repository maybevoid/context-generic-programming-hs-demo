module App.Components.SimpleGreeter where

import App.Classes.Greeter
import App.Classes.Monad
import App.Classes.Person
import App.Classes.PersonQuerier
import Control.Monad.IO.Class

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
