
let
  module = 
    { "Data.Functor" = import ../Data.Functor;
      "Data.Semigroup" = import ../Data.Semigroup;
    };
  Alt-Dict = x: x;
  altArray = 
    { alt = module."Data.Semigroup".append module."Data.Semigroup".semigroupArray;
      "Functor0" = _: module."Data.Functor".functorArray;
    };
  alt = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.alt;
      __patternFail = builtins.throw "Pattern match failure in .spago/control/master/src/Control/Alt.purs at 37:3 - 37:37";
    in
      __pattern0 __patternFail;
in
  
  { inherit alt altArray;
    inherit (module."Data.Functor") map void;
  }