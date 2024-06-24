
let
  module = 
    { "Data.Either" = import ../Data.Either;
      "Data.Profunctor" = import ../Data.Profunctor;
    };
  Cochoice-Dict = x: x;
  unright = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.unright;
      __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Cochoice.purs at 9:3 - 9:64";
    in
      __pattern0 __patternFail;
  unleft = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.unleft;
      __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Cochoice.purs at 8:3 - 8:63";
    in
      __pattern0 __patternFail;
in
  {inherit unleft unright;}