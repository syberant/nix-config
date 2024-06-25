
let
  module = 
    { "Data.Array" = import ../Data.Array;
      "Data.Ring" = import ../Data.Ring;
      "Prelude" = import ../Prelude;
    };
  unsafeIndex = module."Data.Array".unsafeIndex module."Prim".undefined;
  sub = module."Data.Ring".sub module."Data.Ring".ringInt;
  tail = _: xs: module."Data.Array".slice 1 (module."Data.Array".length xs) xs;
  last = _: xs: unsafeIndex xs (sub (module."Data.Array".length xs) 1);
  init = _: xs: module."Data.Array".slice 0 (sub (module."Data.Array".length xs) 1) xs;
  head = _: xs: unsafeIndex xs 0;
in
  {inherit head tail last init;}