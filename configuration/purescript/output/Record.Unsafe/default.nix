
let
  module = { };
  foreign = import ./foreign.nix;
  unsafeHas = foreign.unsafeHas;
  unsafeGet = foreign.unsafeGet;
  unsafeSet = foreign.unsafeSet;
  unsafeDelete = foreign.unsafeDelete;
in
  {inherit unsafeHas unsafeGet unsafeSet unsafeDelete;}