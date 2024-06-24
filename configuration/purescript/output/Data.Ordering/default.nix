
let
  module = 
    { "Data.Eq" = import ../Data.Eq;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
    };
  LT = {__tag = "LT";};
  GT = {__tag = "GT";};
  EQ = {__tag = "EQ";};
  showOrdering = 
    { show = v: 
        let
          __pattern0 = __fail: if v.__tag == "LT" then "LT" else __fail;
          __pattern1 = __fail: if v.__tag == "GT" then "GT" else __fail;
          __pattern2 = __fail: if v.__tag == "EQ" then "EQ" else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ordering.purs at 26:1 - 29:17";
        in
          __pattern0 (__pattern1 (__pattern2 __patternFail));
    };
  semigroupOrdering = 
    { append = v: v1: 
        let
          __pattern0 = __fail: if v.__tag == "LT" then LT else __fail;
          __pattern1 = __fail: if v.__tag == "GT" then GT else __fail;
          __pattern2 = __fail: 
            if v.__tag == "EQ"
              then 
                let
                  y = v1;
                in
                  y
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ordering.purs at 21:1 - 24:18";
        in
          __pattern0 (__pattern1 (__pattern2 __patternFail));
    };
  invert = v: 
    let
      __pattern0 = __fail: if v.__tag == "GT" then LT else __fail;
      __pattern1 = __fail: if v.__tag == "EQ" then EQ else __fail;
      __pattern2 = __fail: if v.__tag == "LT" then GT else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ordering.purs at 33:1 - 33:31";
    in
      __pattern0 (__pattern1 (__pattern2 __patternFail));
  eqOrdering = 
    { eq = v: v1: 
        let
          __pattern0 = __fail: if v.__tag == "LT" && v1.__tag == "LT" then true else __fail;
          __pattern1 = __fail: if v.__tag == "GT" && v1.__tag == "GT" then true else __fail;
          __pattern2 = __fail: if v.__tag == "EQ" && v1.__tag == "EQ" then true else __fail;
          __pattern3 = __fail: false;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ordering.purs at 15:1 - 19:19";
        in
          __pattern0 (__pattern1 (__pattern2 (__pattern3 __patternFail)));
    };
in
  {inherit LT GT EQ invert eqOrdering semigroupOrdering showOrdering;}