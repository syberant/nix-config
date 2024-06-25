
let
  module = {"Partial" = import ../Partial;};
  foreign = import ./foreign.nix;
  _unsafePartial = foreign._unsafePartial;
  crashWith = module."Partial".crashWith module."Prim".undefined;
  unsafePartial = _unsafePartial;
  unsafeCrashWith = msg: unsafePartial (_: crashWith msg);
in
  {inherit unsafePartial unsafeCrashWith;}