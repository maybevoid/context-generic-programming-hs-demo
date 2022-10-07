module Main where

import App.Contexts.Mock
import App.Types.Person
import Data.HashMap.Strict

mockPersonMap :: HashMap String SimplePerson
mockPersonMap =
  fromList
    [ ("john", MkPerson "John Smith"),
      ("bob", MkPerson "Bob")
    ]

mockTime = MkDummyTime True

context :: MockContext
context =
  MkMockContext
    { personMap = mockPersonMap,
      currentTime = mockTime
    }

main :: IO ()
main = do
  mockGreet context "john"
