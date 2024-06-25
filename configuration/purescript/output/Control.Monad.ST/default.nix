
let
  module = {"Control.Monad.ST.Internal" = import ../Control.Monad.ST.Internal;};
in
  {inherit (module."Control.Monad.ST.Internal") for foreach run while;}