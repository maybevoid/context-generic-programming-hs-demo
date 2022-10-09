module Demo2.Components.Baz where

import Control.Monad.IO.Class
import Demo2.Classes.MFunc
import Demo2.Components.Bar
import Demo2.Components.Compose
import Demo2.Components.Foo

type FooBar = Compose Foo Bar

data Baz

instance
  (MonadIO m, MFunc FooBar m) =>
  MFunc Baz m
  where
  type In Baz = ()
  type Out Baz = ()

  apply () = do
    res <- apply @FooBar 8
    liftIO $ putStrLn res
