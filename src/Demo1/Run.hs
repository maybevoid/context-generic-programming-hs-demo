module Demo1.Run where

import Control.Monad.Reader
import Control.Monad.State.Strict
import Demo1.Classes.MFunc
import Demo1.Components.Bar
import Demo1.Components.Baz
import Demo1.Components.Foo

runBaz :: ReaderT FooEnv (StateT BarState IO) ()
runBaz = apply @Baz ()

runBazWith :: FooEnv -> BarState -> IO ()
runBazWith foo = evalStateT $ runReaderT runBaz foo
