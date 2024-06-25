
let
  module = { };
  foreign = import ./foreign.nix;
  _crashWith = foreign._crashWith;
  crashWith = _: _crashWith;
  crashWith1 = crashWith module."Prim".undefined;
  crash = _: crashWith1 "Partial.crash: partial function";
in
  {inherit crash crashWith;}