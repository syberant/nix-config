
let
  module = {"Data.Unit" = import ../Data.Unit;};
  Lazy-Dict = x: x;
  lazyUnit = {defer = v: module."Data.Unit".unit;};
  lazyFn = {defer = f: x: f module."Data.Unit".unit x;};
  defer = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.defer;
      __patternFail = builtins.throw "Pattern match failure in .spago/control/master/src/Control/Lazy.purs at 11:3 - 11:28";
    in
      __pattern0 __patternFail;
  fix = dictLazy: 
    let
      defer1 = defer dictLazy;
    in
      f: 
      let
        go = defer1 (v: f go);
      in
        go;
in
  {inherit defer fix lazyFn lazyUnit;}