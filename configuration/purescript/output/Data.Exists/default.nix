
let
  module = {"Unsafe.Coerce" = import ../Unsafe.Coerce;};
  runExists = module."Unsafe.Coerce".unsafeCoerce;
  mkExists = module."Unsafe.Coerce".unsafeCoerce;
in
  {inherit mkExists runExists;}