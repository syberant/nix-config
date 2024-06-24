
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Data.Comparison" = import ../Data.Comparison;
      "Data.Equivalence" = import ../Data.Equivalence;
      "Data.Functor.Contravariant" = import ../Data.Functor.Contravariant;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Op" = import ../Data.Op;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Predicate" = import ../Data.Predicate;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Tuple" = import ../Data.Tuple;
      "Prelude" = import ../Prelude;
    };
  conj = module."Data.HeytingAlgebra".conj module."Data.HeytingAlgebra".heytingAlgebraBoolean;
  append = module."Data.Semigroup".append module."Data.Ordering".semigroupOrdering;
  identity = module."Control.Category".identity module."Control.Category".categoryFn;
  Divide-Dict = x: x;
  dividePredicate = 
    { divide = f: v: v1: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              g = v;
              h = v1;
            in
              a: 
              let
                v2 = f1 a;
              in
                
                let
                  __pattern0 = __fail: 
                    if v2.__tag == "Tuple"
                      then 
                        let
                          b = v2.__field0;
                          c = v2.__field1;
                        in
                          conj (g b) (h c)
                      else __fail;
                  __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Divide.purs at 37:58 - 38:28";
                in
                  __pattern0 __patternFail;
          __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Divide.purs at 36:1 - 38:28";
        in
          __pattern0 __patternFail;
      "Contravariant0" = _: module."Data.Predicate".contravariantPredicate;
    };
  divideOp = dictSemigroup: 
    let
      append1 = module."Data.Semigroup".append dictSemigroup;
    in
      
      { divide = f: v: v1: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                g = v;
                h = v1;
              in
                a: 
                let
                  v2 = f1 a;
                in
                  
                  let
                    __pattern0 = __fail: 
                      if v2.__tag == "Tuple"
                        then 
                          let
                            b = v2.__field0;
                            c = v2.__field1;
                          in
                            append1 (g b) (h c)
                        else __fail;
                    __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Divide.purs at 41:37 - 42:28";
                  in
                    __pattern0 __patternFail;
            __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Divide.purs at 40:1 - 42:28";
          in
            __pattern0 __patternFail;
        "Contravariant0" = _: module."Data.Op".contravariantOp;
      };
  divideEquivalence = 
    { divide = f: v: v1: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              g = v;
              h = v1;
            in
              a: b: 
              let
                v2 = f1 a;
              in
                
                let
                  __pattern0 = __fail: 
                    if v2.__tag == "Tuple"
                      then 
                        let
                          a' = v2.__field0;
                          a'' = v2.__field1;
                        in
                          
                          let
                            v3 = f1 b;
                          in
                            
                            let
                              __pattern0 = __fail: 
                                if v3.__tag == "Tuple"
                                  then 
                                    let
                                      b' = v3.__field0;
                                      b'' = v3.__field1;
                                    in
                                      conj (g a' b') (h a'' b'')
                                  else __fail;
                              __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Divide.purs at 33:21 - 34:43";
                            in
                              __pattern0 __patternFail
                      else __fail;
                  __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Divide.purs at 32:66 - 34:43";
                in
                  __pattern0 __patternFail;
          __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Divide.purs at 31:1 - 34:43";
        in
          __pattern0 __patternFail;
      "Contravariant0" = _: module."Data.Equivalence".contravariantEquivalence;
    };
  divideComparison = 
    { divide = f: v: v1: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              g = v;
              h = v1;
            in
              a: b: 
              let
                v2 = f1 a;
              in
                
                let
                  __pattern0 = __fail: 
                    if v2.__tag == "Tuple"
                      then 
                        let
                          a' = v2.__field0;
                          a'' = v2.__field1;
                        in
                          
                          let
                            v3 = f1 b;
                          in
                            
                            let
                              __pattern0 = __fail: 
                                if v3.__tag == "Tuple"
                                  then 
                                    let
                                      b' = v3.__field0;
                                      b'' = v3.__field1;
                                    in
                                      append (g a' b') (h a'' b'')
                                  else __fail;
                              __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Divide.purs at 28:21 - 29:43";
                            in
                              __pattern0 __patternFail
                      else __fail;
                  __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Divide.purs at 27:63 - 29:43";
                in
                  __pattern0 __patternFail;
          __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Divide.purs at 26:1 - 29:43";
        in
          __pattern0 __patternFail;
      "Contravariant0" = _: module."Data.Comparison".contravariantComparison;
    };
  divide = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.divide;
      __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Divide.purs at 24:3 - 24:64";
    in
      __pattern0 __patternFail;
  divided = dictDivide: divide dictDivide identity;
in
  {inherit divide divided divideComparison divideEquivalence dividePredicate divideOp;}