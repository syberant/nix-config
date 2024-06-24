
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Data.Boolean" = import ../Data.Boolean;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ring" = import ../Data.Ring;
    };
  lessThanOrEq = module."Data.Ord".lessThanOrEq module."Data.Ord".ordInt;
  sub = module."Data.Ring".sub module."Data.Ring".ringInt;
  on = f: g: x: y: f (g x) (g y);
  flip = f: b: a: f a b;
  const = a: v: a;
  applyN = f: 
    let
      go = n: acc: 
        let
          __pattern0 = __fail: 
            let
              n1 = n;
              acc1 = acc;
            in
              if lessThanOrEq n1 0 then acc1 else if module."Data.Boolean".otherwise then go (sub n1 1) (f acc1) else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Function.purs at 100:3 - 102:37";
        in
          __pattern0 __patternFail;
    in
      go;
  applyFlipped = x: f: f x;
  apply = f: x: f x;
in
  
  { inherit flip const apply applyFlipped applyN on;
    inherit (module."Control.Category") compose identity;
  }