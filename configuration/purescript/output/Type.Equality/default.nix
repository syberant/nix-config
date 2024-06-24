
let
  module = {"Prim.Coerce" = import ../Prim.Coerce;};
  TypeEquals-Dict = x: x;
  To = x: x;
  From = x: x;
  refl = 
    { proof = a: a;
      "Coercible0" = _: module."Prim".undefined;
    };
  proof = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.proof;
      __patternFail = builtins.throw "Pattern match failure in .spago/type-equality/master/src/Type/Equality.purs at 22:3 - 22:32";
    in
      __pattern0 __patternFail;
  to = dictTypeEquals: 
    let
      v = proof dictTypeEquals (a: a);
    in
      
      let
        __pattern0 = __fail: 
          let
            f = v;
          in
            f;
        __patternFail = builtins.throw "Pattern match failure in .spago/type-equality/master/src/Type/Equality.purs at 30:6 - 30:44";
      in
        __pattern0 __patternFail;
  from = dictTypeEquals: 
    let
      v = proof dictTypeEquals (a: a);
    in
      
      let
        __pattern0 = __fail: 
          let
            f = v;
          in
            f;
        __patternFail = builtins.throw "Pattern match failure in .spago/type-equality/master/src/Type/Equality.purs at 35:8 - 35:50";
      in
        __pattern0 __patternFail;
in
  {inherit proof to from refl;}