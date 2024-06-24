
let
  module = 
    { "Data.Profunctor" = import ../Data.Profunctor;
      "Data.Tuple" = import ../Data.Tuple;
    };
  Costrong-Dict = x: x;
  unsecond = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.unsecond;
      __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Costrong.purs at 9:3 - 9:63";
    in
      __pattern0 __patternFail;
  unfirst = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.unfirst;
      __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Costrong.purs at 8:3 - 8:62";
    in
      __pattern0 __patternFail;
in
  {inherit unfirst unsecond;}