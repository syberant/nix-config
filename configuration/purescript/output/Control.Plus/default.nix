
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Data.Functor" = import ../Data.Functor;
    };
  Plus-Dict = x: x;
  plusArray = 
    { empty = [];
      "Alt0" = _: module."Control.Alt".altArray;
    };
  empty = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.empty;
      __patternFail = builtins.throw "Pattern match failure in .spago/control/master/src/Control/Plus.purs at 24:3 - 24:25";
    in
      __pattern0 __patternFail;
in
  
  { inherit empty plusArray;
    inherit (module."Control.Alt") alt;
    inherit (module."Data.Functor") map void;
  }