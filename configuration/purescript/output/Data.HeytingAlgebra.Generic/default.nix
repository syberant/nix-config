
let
  module = 
    { "Data.Function" = import ../Data.Function;
      "Data.Generic.Rep" = import ../Data.Generic.Rep;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Prelude" = import ../Prelude;
    };
  GenericHeytingAlgebra-Dict = x: x;
  genericTT' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericTT';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 10:3 - 10:18";
    in
      __pattern0 __patternFail;
  genericTT = dictGeneric: 
    let
      to = module."Data.Generic.Rep".to dictGeneric;
    in
      dictGenericHeytingAlgebra: to (genericTT' dictGenericHeytingAlgebra);
  genericNot' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericNot';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 14:3 - 14:24";
    in
      __pattern0 __patternFail;
  genericNot = dictGeneric: 
    let
      to = module."Data.Generic.Rep".to dictGeneric;
      from = module."Data.Generic.Rep".from dictGeneric;
    in
      dictGenericHeytingAlgebra: 
      let
        genericNot'1 = genericNot' dictGenericHeytingAlgebra;
      in
        x: to (genericNot'1 (from x));
  genericImplies' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericImplies';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 11:3 - 11:33";
    in
      __pattern0 __patternFail;
  genericImplies = dictGeneric: 
    let
      to = module."Data.Generic.Rep".to dictGeneric;
      from = module."Data.Generic.Rep".from dictGeneric;
    in
      dictGenericHeytingAlgebra: 
      let
        genericImplies'1 = genericImplies' dictGenericHeytingAlgebra;
      in
        x: y: to (genericImplies'1 (from x) (from y));
  genericHeytingAlgebraNoArguments = 
    { genericFF' = module."Data.Generic.Rep".NoArguments;
      genericTT' = module."Data.Generic.Rep".NoArguments;
      genericImplies' = v: v1: module."Data.Generic.Rep".NoArguments;
      genericConj' = v: v1: module."Data.Generic.Rep".NoArguments;
      genericDisj' = v: v1: module."Data.Generic.Rep".NoArguments;
      genericNot' = v: module."Data.Generic.Rep".NoArguments;
    };
  genericHeytingAlgebraArgument = dictHeytingAlgebra: 
    let
      implies = module."Data.HeytingAlgebra".implies dictHeytingAlgebra;
      conj = module."Data.HeytingAlgebra".conj dictHeytingAlgebra;
      disj = module."Data.HeytingAlgebra".disj dictHeytingAlgebra;
      not = module."Data.HeytingAlgebra".not dictHeytingAlgebra;
    in
      
      { genericFF' = module."Data.HeytingAlgebra".ff dictHeytingAlgebra;
        genericTT' = module."Data.HeytingAlgebra".tt dictHeytingAlgebra;
        genericImplies' = v: v1: 
          let
            __pattern0 = __fail: 
              let
                x = v;
                y = v1;
              in
                implies x y;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 24:1 - 30:46";
          in
            __pattern0 __patternFail;
        genericConj' = v: v1: 
          let
            __pattern0 = __fail: 
              let
                x = v;
                y = v1;
              in
                conj x y;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 24:1 - 30:46";
          in
            __pattern0 __patternFail;
        genericDisj' = v: v1: 
          let
            __pattern0 = __fail: 
              let
                x = v;
                y = v1;
              in
                disj x y;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 24:1 - 30:46";
          in
            __pattern0 __patternFail;
        genericNot' = v: 
          let
            __pattern0 = __fail: 
              let
                x = v;
              in
                not x;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 24:1 - 30:46";
          in
            __pattern0 __patternFail;
      };
  genericFF' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericFF';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 9:3 - 9:18";
    in
      __pattern0 __patternFail;
  genericFF = dictGeneric: 
    let
      to = module."Data.Generic.Rep".to dictGeneric;
    in
      dictGenericHeytingAlgebra: to (genericFF' dictGenericHeytingAlgebra);
  genericDisj' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericDisj';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 13:3 - 13:30";
    in
      __pattern0 __patternFail;
  genericDisj = dictGeneric: 
    let
      to = module."Data.Generic.Rep".to dictGeneric;
      from = module."Data.Generic.Rep".from dictGeneric;
    in
      dictGenericHeytingAlgebra: 
      let
        genericDisj'1 = genericDisj' dictGenericHeytingAlgebra;
      in
        x: y: to (genericDisj'1 (from x) (from y));
  genericConj' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericConj';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 12:3 - 12:30";
    in
      __pattern0 __patternFail;
  genericHeytingAlgebraConstructor = dictGenericHeytingAlgebra: 
    let
      genericImplies'1 = genericImplies' dictGenericHeytingAlgebra;
      genericConj'1 = genericConj' dictGenericHeytingAlgebra;
      genericDisj'1 = genericDisj' dictGenericHeytingAlgebra;
      genericNot'1 = genericNot' dictGenericHeytingAlgebra;
    in
      
      { genericFF' = genericFF' dictGenericHeytingAlgebra;
        genericTT' = genericTT' dictGenericHeytingAlgebra;
        genericImplies' = v: v1: 
          let
            __pattern0 = __fail: 
              let
                a1 = v;
                a2 = v1;
              in
                genericImplies'1 a1 a2;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 40:1 - 46:60";
          in
            __pattern0 __patternFail;
        genericConj' = v: v1: 
          let
            __pattern0 = __fail: 
              let
                a1 = v;
                a2 = v1;
              in
                genericConj'1 a1 a2;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 40:1 - 46:60";
          in
            __pattern0 __patternFail;
        genericDisj' = v: v1: 
          let
            __pattern0 = __fail: 
              let
                a1 = v;
                a2 = v1;
              in
                genericDisj'1 a1 a2;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 40:1 - 46:60";
          in
            __pattern0 __patternFail;
        genericNot' = v: 
          let
            __pattern0 = __fail: 
              let
                a = v;
              in
                genericNot'1 a;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 40:1 - 46:60";
          in
            __pattern0 __patternFail;
      };
  genericHeytingAlgebraProduct = dictGenericHeytingAlgebra: 
    let
      genericFF'1 = genericFF' dictGenericHeytingAlgebra;
      genericTT'1 = genericTT' dictGenericHeytingAlgebra;
      genericImplies'1 = genericImplies' dictGenericHeytingAlgebra;
      genericConj'1 = genericConj' dictGenericHeytingAlgebra;
      genericDisj'1 = genericDisj' dictGenericHeytingAlgebra;
      genericNot'1 = genericNot' dictGenericHeytingAlgebra;
    in
      dictGenericHeytingAlgebra1: 
      let
        genericImplies'2 = genericImplies' dictGenericHeytingAlgebra1;
        genericConj'2 = genericConj' dictGenericHeytingAlgebra1;
        genericDisj'2 = genericDisj' dictGenericHeytingAlgebra1;
        genericNot'2 = genericNot' dictGenericHeytingAlgebra1;
      in
        
        { genericFF' = module."Data.Generic.Rep".Product genericFF'1 (genericFF' dictGenericHeytingAlgebra1);
          genericTT' = module."Data.Generic.Rep".Product genericTT'1 (genericTT' dictGenericHeytingAlgebra1);
          genericImplies' = v: v1: 
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
                      module."Data.Generic.Rep".Product (genericImplies'1 a1 a2) (genericImplies'2 b1 b2)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 32:1 - 38:70";
            in
              __pattern0 __patternFail;
          genericConj' = v: v1: 
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
                      module."Data.Generic.Rep".Product (genericConj'1 a1 a2) (genericConj'2 b1 b2)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 32:1 - 38:70";
            in
              __pattern0 __patternFail;
          genericDisj' = v: v1: 
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
                      module."Data.Generic.Rep".Product (genericDisj'1 a1 a2) (genericDisj'2 b1 b2)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 32:1 - 38:70";
            in
              __pattern0 __patternFail;
          genericNot' = v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Product"
                  then 
                    let
                      a = v.__field0;
                      b = v.__field1;
                    in
                      module."Data.Generic.Rep".Product (genericNot'1 a) (genericNot'2 b)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 32:1 - 38:70";
            in
              __pattern0 __patternFail;
        };
  genericConj = dictGeneric: 
    let
      to = module."Data.Generic.Rep".to dictGeneric;
      from = module."Data.Generic.Rep".from dictGeneric;
    in
      dictGenericHeytingAlgebra: 
      let
        genericConj'1 = genericConj' dictGenericHeytingAlgebra;
      in
        x: y: to (genericConj'1 (from x) (from y));
in
  {inherit genericConj' genericDisj' genericFF' genericImplies' genericNot' genericTT' genericFF genericTT genericImplies genericConj genericDisj genericNot genericHeytingAlgebraNoArguments genericHeytingAlgebraArgument genericHeytingAlgebraProduct genericHeytingAlgebraConstructor;}