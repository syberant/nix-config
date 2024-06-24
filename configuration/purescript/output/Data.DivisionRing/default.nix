
let
  module = 
    { "Data.EuclideanRing" = import ../Data.EuclideanRing;
      "Data.Ring" = import ../Data.Ring;
      "Data.Semiring" = import ../Data.Semiring;
    };
  div = module."Data.EuclideanRing".div module."Data.EuclideanRing".euclideanRingNumber;
  DivisionRing-Dict = x: x;
  recip = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.recip;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/DivisionRing.purs at 30:3 - 30:18";
    in
      __pattern0 __patternFail;
  rightDiv = dictDivisionRing: 
    let
      mul = module."Data.Semiring".mul ((dictDivisionRing."Ring0" module."Prim".undefined)."Semiring0" module."Prim".undefined);
      recip1 = recip dictDivisionRing;
    in
      a: b: mul a (recip1 b);
  leftDiv = dictDivisionRing: 
    let
      mul = module."Data.Semiring".mul ((dictDivisionRing."Ring0" module."Prim".undefined)."Semiring0" module."Prim".undefined);
      recip1 = recip dictDivisionRing;
    in
      a: b: mul (recip1 b) a;
  divisionringNumber = 
    { recip = x: div 1.0 x;
      "Ring0" = _: module."Data.Ring".ringNumber;
    };
in
  
  { inherit recip leftDiv rightDiv divisionringNumber;
    inherit (module."Data.Ring") negate sub;
    inherit (module."Data.Semiring") add mul one zero;
  }