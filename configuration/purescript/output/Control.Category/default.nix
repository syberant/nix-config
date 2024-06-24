
let
  module = {"Control.Semigroupoid" = import ../Control.Semigroupoid;};
  Category-Dict = x: x;
  identity = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.identity;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Control/Category.purs at 18:3 - 18:30";
    in
      __pattern0 __patternFail;
  categoryFn = 
    { identity = x: x;
      "Semigroupoid0" = _: module."Control.Semigroupoid".semigroupoidFn;
    };
in
  
  { inherit identity categoryFn;
    inherit (module."Control.Semigroupoid") compose;
  }