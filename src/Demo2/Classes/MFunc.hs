module Demo2.Classes.MFunc where

class (Monad m) => MFunc f m where
  type In f
  type Out f

  apply :: In f -> m (Out f)
