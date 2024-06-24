
let
  module = {"Type.Proxy" = import ../Type.Proxy;};
  foreign = import ./foreign.nix;
  unsafeCoerce = foreign.unsafeCoerce;
  SProxy = {__tag = "SProxy";};
  IsSymbol-Dict = x: x;
  reifySymbol = s: f: 
    let
      coerce = unsafeCoerce;
    in
      coerce (dictIsSymbol: f dictIsSymbol) {reflectSymbol = v: s;} module."Type.Proxy".Proxy;
  reflectSymbol = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.reflectSymbol;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Symbol.purs at 24:3 - 24:53";
    in
      __pattern0 __patternFail;
in
  {inherit reflectSymbol reifySymbol SProxy;}