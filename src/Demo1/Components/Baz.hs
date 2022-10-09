module Demo1.Components.Baz where

import Control.Monad.IO.Class
import Demo1.Classes.MFunc
import Demo1.Components.Bar
import Demo1.Components.Compose
import Demo1.Components.Foo

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
