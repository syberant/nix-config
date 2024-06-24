module Main where

import Prelude

import Data.Foldable (foldr)
import Data.Maybe (Maybe)

newtype License = License
    { free :: Boolean,
      deprecated :: Boolean,
      shortName :: String,
      fullName :: String,
      redistributable :: Boolean,

      -- Optional
      spdxId :: Maybe String,
      url :: Maybe String
    }

newtype Metadata = Metadata
    { description :: String,
      longDescription :: Maybe String,
      homePage :: Maybe String,

      -- Status
      broken :: Maybe Boolean,
      available :: Maybe Boolean,
      unfree :: Maybe Boolean
    }

newtype Package = Package
    { type :: String,
      name :: String,
      pname :: Maybe String,
      version :: Maybe String,
      outPath :: String
    }

type Pkgs = { hello :: Package }

nixosModule :: { pkgs :: Pkgs } -> _
nixosModule { pkgs } = { environment: { systemPackages: [ pkgs.hello ] } }
