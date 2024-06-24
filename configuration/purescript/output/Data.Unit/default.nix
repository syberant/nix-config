
let
  module = {"Data.Show" = import ../Data.Show;};
  foreign = import ./foreign.nix;
  unit = foreign.unit;
  showUnit = {show = v: "unit";};
in
  {inherit unit showUnit;}