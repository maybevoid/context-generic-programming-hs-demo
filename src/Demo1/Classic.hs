module Demo1.Classic where

import Control.Monad.Reader
import Control.Monad.State.Strict

newtype FooEnv = FooEnv
  { fooConfig :: Int
  }

newtype BarState = BarState
  { barCounter :: Int
  }

foo :: (MonadReader FooEnv m) => Int -> m Int
foo x = do
  fooEnv <- ask
  return $ fooConfig fooEnv * x

bar :: (MonadState BarState m) => Int -> m String
bar x = do
  barState <- get
  let newBarCounter = barCounter barState + x
  put $ barState {barCounter = newBarCounter}
  return $ "bar: " ++ show newBarCounter

fooBar :: forall m. (MonadReader FooEnv m, MonadState BarState m) => Int -> m String
fooBar = foo @m >> bar

baz :: (MonadReader FooEnv m, MonadState BarState m, MonadIO m) => m ()
baz = do
  res <- fooBar 8
  liftIO $ putStrLn res

runBazWith :: FooEnv -> BarState -> IO ()
runBazWith foo = evalStateT $ runReaderT baz foo
