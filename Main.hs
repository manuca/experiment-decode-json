{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Data.Aeson
import           Data.Aeson.Casing
import qualified Data.ByteString.Lazy as B
import           GHC.Generics

data Person = Person { personFirstName :: String } deriving Generic

instance FromJSON Person where
   parseJSON = genericParseJSON $ aesonPrefix snakeCase


main :: IO ()
main = do
  jsonData <- B.readFile "sample.json"

  case decode jsonData  of
    Nothing ->
      putStrLn "Couldn't decode Person"
    Just p ->
      putStrLn $ "Hi " ++ (personFirstName p)
