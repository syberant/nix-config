module NixTypes where

import Prelude
import Data.Maybe (Maybe)

-- Just a generic value, we have no idea what
foreign import data NixValue :: Type
-- A generic attribute set, we don't know what's in there
foreign import data AttrSet :: Type
-- A path, PureScript doesn't have a type for this AFAIK
-- TODO: How do we create this?
-- Also allow to convert to String
foreign import data Path :: Type
foreign import data NixFloat :: Type

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

