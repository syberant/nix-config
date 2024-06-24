
let
  module = 
    { "Control.Extend" = import ../Control.Extend;
      "Data.Functor" = import ../Data.Functor;
    };
  Comonad-Dict = x: x;
  extract = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.extract;
      __patternFail = builtins.throw "Pattern match failure in .spago/control/master/src/Control/Comonad.purs at 21:3 - 21:32";
    in
      __pattern0 __patternFail;
in
  
  { inherit extract;
    inherit (module."Control.Extend") duplicate extend;
    inherit (module."Data.Functor") map void;
  }