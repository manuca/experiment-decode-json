{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Data.Aeson
import qualified Data.ByteString.Lazy as B
import           GHC.Generics

fileContents :: B.ByteString
fileContents =
  "{\"name\": \"Juan\"}"

data Person = Person { name :: String } deriving Generic

instance FromJSON Person

main :: IO ()
main = do
  case decode fileContents of
    Nothing ->
      putStrLn "Couldn't decode Person"
    Just p ->
      putStrLn $ "Hi " ++ (name p)
