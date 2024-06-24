
let
  module = { };
  foreign = import ./foreign.nix;
  unsafeCoerce = foreign.unsafeCoerce;
in
  {inherit unsafeCoerce;}