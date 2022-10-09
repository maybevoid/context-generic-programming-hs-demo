module Demo2.Run where

import Control.Monad.Reader
import Control.Monad.State.Strict
import Demo2.Classes.MFunc
import Demo2.Components.Bar
import Demo2.Components.Baz
import Demo2.Components.Foo
import Demo2.Types.Bar
import Demo2.Types.Foo

runBaz :: ReaderT FooEnv (StateT BarState IO) ()
runBaz = apply @Baz ()

runBazWith :: FooEnv -> BarState -> IO ()
runBazWith foo = evalStateT $ runReaderT runBaz foo
