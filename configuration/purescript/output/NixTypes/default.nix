
let
  module = 
    { "Data.Maybe" = import ../Data.Maybe;
      "Prelude" = import ../Prelude;
    };
  Package = x: x;
  Metadata = x: x;
  License = x: x;
in
  {inherit License Metadata Package;}