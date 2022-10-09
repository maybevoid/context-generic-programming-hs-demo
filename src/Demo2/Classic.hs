module Demo2.Classic where

import Control.Monad.Reader
import Control.Monad.State.Strict
import Demo2.Types.Bar
import Demo2.Types.Foo
import GHC.Records
import Optics.Core

foo :: forall m e. (MonadReader e m, HasField "fooConfig" e Int) => Int -> m Int
foo x = do
  fooEnv <- ask @e
  return $ getField @"fooConfig" fooEnv * x

bar :: forall m s. (MonadState s m, LabelOptic' "barCounter" A_Lens s Int) => Int -> m String
bar x = do
  barState <- get @s
  let newBarCounter = barState ^. #barCounter + x
  put $ barState & #barCounter .~ newBarCounter
  return $ "bar: " ++ show newBarCounter

fooBar ::
  forall m e s.
  ( MonadReader e m,
    MonadState s m,
    HasField "fooConfig" e Int,
    LabelOptic' "barCounter" A_Lens s Int
  ) =>
  Int ->
  m String
fooBar = foo @m >> bar @m

baz ::
  forall m e s.
  ( MonadReader e m,
    MonadState s m,
    MonadIO m,
    HasField "fooConfig" e Int,
    LabelOptic' "barCounter" A_Lens s Int
  ) =>
  m ()
baz = do
  res <- fooBar 8
  liftIO $ putStrLn res

runBazWith :: FooEnv -> BarState -> IO ()
runBazWith foo = evalStateT $ runReaderT baz foo
