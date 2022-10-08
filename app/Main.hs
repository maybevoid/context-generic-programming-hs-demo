module Main where

import Data.HashMap.Strict
import Demo3.Contexts.Mock
import Demo3.Types.Person

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
