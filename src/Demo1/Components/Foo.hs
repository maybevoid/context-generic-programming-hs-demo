module Demo1.Components.Foo where

import Control.Monad.Reader
import Demo1.Classes.MFunc

newtype FooEnv = FooEnv
  { fooConfig :: Int
  }

data Foo

instance
  (Monad m, MonadReader FooEnv m) =>
  MFunc Foo m
  where
  type In Foo = Int
  type Out Foo = Int

  apply x = do
    fooEnv <- ask
    return $ fooConfig fooEnv * x
