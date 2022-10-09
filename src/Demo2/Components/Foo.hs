module Demo2.Components.Foo where

import Control.Monad.Reader
import Demo2.Classes.MFunc
import GHC.Records

data Foo

instance
  (Monad m, MonadReader e m, HasField "fooConfig" e Int) =>
  MFunc Foo m
  where
  type In Foo = Int
  type Out Foo = Int

  apply x = do
    fooEnv <- ask @e
    return $ getField @"fooConfig" fooEnv * x
