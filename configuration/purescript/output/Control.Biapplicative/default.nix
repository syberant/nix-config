
let
  module = 
    { "Control.Biapply" = import ../Control.Biapply;
      "Data.Tuple" = import ../Data.Tuple;
    };
  Biapplicative-Dict = x: x;
  bipure = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.bipure;
      __patternFail = builtins.throw "Pattern match failure in .spago/bifunctors/master/src/Control/Biapplicative.purs at 9:3 - 9:40";
    in
      __pattern0 __patternFail;
  biapplicativeTuple = 
    { bipure = module."Data.Tuple".Tuple;
      "Biapply0" = _: module."Control.Biapply".biapplyTuple;
    };
in
  {inherit bipure biapplicativeTuple;}