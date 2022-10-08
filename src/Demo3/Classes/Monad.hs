module Demo3.Classes.Monad where

import Data.Kind (Type)

class (Monad (M ctx)) => HasMonad ctx where
  type M ctx :: Type -> Type
