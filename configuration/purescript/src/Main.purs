module Main where

-- import Prelude

import NixTypes (Package)
-- import NixOSTypes

type Pkgs = { hello :: Package }

nixosModule :: { pkgs :: Pkgs } -> _
nixosModule { pkgs } = { environment: { systemPackages: [ pkgs.hello ] } }
