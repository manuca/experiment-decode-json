{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Data.Aeson
import qualified Data.ByteString.Lazy as B
import           GHC.Generics

data Person = Person { first_name :: String } deriving Generic

instance FromJSON Person

main :: IO ()
main = do
  jsonData <- B.readFile "sample.json"

  case decode jsonData  of
    Nothing ->
      putStrLn "Couldn't decode Person"
    Just p ->
      putStrLn $ "Hi " ++ (first_name p)
