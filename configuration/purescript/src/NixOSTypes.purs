module NixOSTypes where

-- This module includes some pretty raw types used in the NixOS module system.
-- In the future some converters could be written.

{-

import Prelude
import Prim as P
import Data.Maybe (Maybe)
-- import Data.Array
-- import Data.Boolean (Boolean)


import NixTypes as NixTypes
import NixTypes (AttrSet, NixValue, NixFloat, Package, Path)

-- A kind wrapping around all of the NixOS types
data OptionType :: forall k. k -> Type
data OptionType a = OptionType

type Raw = OptionType NixValue
type Anything = OptionType NixValue
type Unspecified = OptionType NixValue


data CustomOptionType = CustomOptionType (OptionType
    { name :: String
    , description :: String

    , descriptionClass :: Maybe String -- one of: "noun", "conjunction", "composite", "nonRestrictiveClause"
    , emptyValue :: AttrSet
    })

-- type Bool = OptionType Boolean
-- type BoolByOr = OptionType Boolean

type Int = OptionType P.Int
-- TODO: Ints
-- newtype Port = Ints.U16;

type Float = OptionType NixFloat
type Number = OptionType P.Number
-- TODO: Numbers

type Str = OptionType P.String
type NonEmptyStr = OptionType P.String
type SingleLineStr = OptionType P.String
type StringMatching regex = OptionType P.String
data SeparatedString sep = SeparatedString (OptionType P.String)
lines = SeparatedString "\n"
commas = SeparatedString ","
envVar = SeparatedString ":"
type String = OptionType P.String -- NOTE: Deprecated in nixpkgs
-- newtype passwdEntry =

type Attrs = OptionType AttrSet
type Package = OptionType NixTypes.Package
type ShellPackage = OptionType NixTypes.Package
-- newtype pkgs =
type Path = OptionType NixTypes.Path
type PathInStore = OptionType NixTypes.Path
-- type ListOf elemType = OptionType (Array elemType)

data NullOr elemType = NullOr (OptionType (Maybe elemType))
data FunctionTo elemType = FunctionTo (OptionType NixValue)

-- data Enum [String] =
-- data Either left right = Either (OptionType (left | right))
-- data OneOf [elemType] =
-- data Submodule [modules] =

-- TODO: More
-}
