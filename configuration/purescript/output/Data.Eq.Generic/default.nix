
let
  module = 
    { "Data.Eq" = import ../Data.Eq;
      "Data.Generic.Rep" = import ../Data.Generic.Rep;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Prelude" = import ../Prelude;
    };
  conj = module."Data.HeytingAlgebra".conj module."Data.HeytingAlgebra".heytingAlgebraBoolean;
  GenericEq-Dict = x: x;
  genericEqNoConstructors = {genericEq' = v: v1: true;};
  genericEqNoArguments = {genericEq' = v: v1: true;};
  genericEqArgument = dictEq: 
    let
      eq = module."Data.Eq".eq dictEq;
    in
      
      { genericEq' = v: v1: 
          let
            __pattern0 = __fail: 
              let
                a1 = v;
                a2 = v1;
              in
                eq a1 a2;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Eq/Generic.purs at 30:1 - 31:52";
          in
            __pattern0 __patternFail;
      };
  genericEq' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericEq';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Eq/Generic.purs at 11:3 - 11:34";
    in
      __pattern0 __patternFail;
  genericEqConstructor = dictGenericEq: 
    let
      genericEq'1 = genericEq' dictGenericEq;
    in
      
      { genericEq' = v: v1: 
          let
            __pattern0 = __fail: 
              let
                a1 = v;
                a2 = v1;
              in
                genericEq'1 a1 a2;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Eq/Generic.purs at 27:1 - 28:66";
          in
            __pattern0 __patternFail;
      };
  genericEqProduct = dictGenericEq: 
    let
      genericEq'1 = genericEq' dictGenericEq;
    in
      dictGenericEq1: 
      let
        genericEq'2 = genericEq' dictGenericEq1;
      in
        
        { genericEq' = v: v1: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Product" && v1.__tag == "Product"
                  then 
                    let
                      a1 = v.__field0;
                      b1 = v.__field1;
                      a2 = v1.__field0;
                      b2 = v1.__field1;
                    in
                      conj (genericEq'1 a1 a2) (genericEq'2 b1 b2)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Eq/Generic.purs at 24:1 - 25:84";
            in
              __pattern0 __patternFail;
        };
  genericEqSum = dictGenericEq: 
    let
      genericEq'1 = genericEq' dictGenericEq;
    in
      dictGenericEq1: 
      let
        genericEq'2 = genericEq' dictGenericEq1;
      in
        
        { genericEq' = v: v1: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Inl" && v1.__tag == "Inl"
                  then 
                    let
                      a1 = v.__field0;
                      a2 = v1.__field0;
                    in
                      genericEq'1 a1 a2
                  else __fail;
              __pattern1 = __fail: 
                if v.__tag == "Inr" && v1.__tag == "Inr"
                  then 
                    let
                      b1 = v.__field0;
                      b2 = v1.__field0;
                    in
                      genericEq'2 b1 b2
                  else __fail;
              __pattern2 = __fail: false;
              __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Eq/Generic.purs at 19:1 - 22:25";
            in
              __pattern0 (__pattern1 (__pattern2 __patternFail));
        };
  genericEq = dictGeneric: 
    let
      from = module."Data.Generic.Rep".from dictGeneric;
    in
      dictGenericEq: 
      let
        genericEq'1 = genericEq' dictGenericEq;
      in
        x: y: genericEq'1 (from x) (from y);
in
  {inherit genericEq' genericEq genericEqNoConstructors genericEqNoArguments genericEqSum genericEqProduct genericEqConstructor genericEqArgument;}