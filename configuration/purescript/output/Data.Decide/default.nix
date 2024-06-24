
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Comparison" = import ../Data.Comparison;
      "Data.Divide" = import ../Data.Divide;
      "Data.Either" = import ../Data.Either;
      "Data.Equivalence" = import ../Data.Equivalence;
      "Data.Op" = import ../Data.Op;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Predicate" = import ../Data.Predicate;
      "Prelude" = import ../Prelude;
    };
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  identity = module."Control.Category".identity module."Control.Category".categoryFn;
  Decide-Dict = x: x;
  choosePredicate = 
    { choose = f: v: v1: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              g = v;
              h = v1;
            in
              compose (module."Data.Either".either g h) f1;
          __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Decide.purs at 34:1 - 35:70";
        in
          __pattern0 __patternFail;
      "Divide0" = _: module."Data.Divide".dividePredicate;
    };
  chooseOp = dictSemigroup: 
    let
      divideOp = module."Data.Divide".divideOp dictSemigroup;
    in
      
      { choose = f: v: v1: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                g = v;
                h = v1;
              in
                compose (module."Data.Either".either g h) f1;
            __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Decide.purs at 37:1 - 38:49";
          in
            __pattern0 __patternFail;
        "Divide0" = _: divideOp;
      };
  chooseEquivalence = 
    { choose = f: v: v1: 
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
                    if v2.__tag == "Left"
                      then 
                        let
                          c = v2.__field0;
                        in
                          
                          let
                            v3 = f1 b;
                          in
                            
                            let
                              __pattern0 = __fail: 
                                if v3.__tag == "Left"
                                  then 
                                    let
                                      d = v3.__field0;
                                    in
                                      g c d
                                  else __fail;
                              __pattern1 = __fail: if v3.__tag == "Right" then false else __fail;
                              __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Decide.purs at 27:15 - 29:23";
                            in
                              __pattern0 (__pattern1 __patternFail)
                      else __fail;
                  __pattern1 = __fail: 
                    if v2.__tag == "Right"
                      then 
                        let
                          c = v2.__field0;
                        in
                          
                          let
                            v3 = f1 b;
                          in
                            
                            let
                              __pattern0 = __fail: if v3.__tag == "Left" then false else __fail;
                              __pattern1 = __fail: 
                                if v3.__tag == "Right"
                                  then 
                                    let
                                      d = v3.__field0;
                                    in
                                      h c d
                                  else __fail;
                              __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Decide.purs at 30:16 - 32:23";
                            in
                              __pattern0 (__pattern1 __patternFail)
                      else __fail;
                  __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Decide.purs at 26:66 - 32:23";
                in
                  __pattern0 (__pattern1 __patternFail);
          __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Decide.purs at 25:1 - 32:23";
        in
          __pattern0 __patternFail;
      "Divide0" = _: module."Data.Divide".divideEquivalence;
    };
  chooseComparison = 
    { choose = f: v: v1: 
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
                    if v2.__tag == "Left"
                      then 
                        let
                          c = v2.__field0;
                        in
                          
                          let
                            v3 = f1 b;
                          in
                            
                            let
                              __pattern0 = __fail: 
                                if v3.__tag == "Left"
                                  then 
                                    let
                                      d = v3.__field0;
                                    in
                                      g c d
                                  else __fail;
                              __pattern1 = __fail: if v3.__tag == "Right" then module."Data.Ordering".LT else __fail;
                              __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Decide.purs at 18:15 - 20:20";
                            in
                              __pattern0 (__pattern1 __patternFail)
                      else __fail;
                  __pattern1 = __fail: 
                    if v2.__tag == "Right"
                      then 
                        let
                          c = v2.__field0;
                        in
                          
                          let
                            v3 = f1 b;
                          in
                            
                            let
                              __pattern0 = __fail: if v3.__tag == "Left" then module."Data.Ordering".GT else __fail;
                              __pattern1 = __fail: 
                                if v3.__tag == "Right"
                                  then 
                                    let
                                      d = v3.__field0;
                                    in
                                      h c d
                                  else __fail;
                              __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Decide.purs at 21:16 - 23:23";
                            in
                              __pattern0 (__pattern1 __patternFail)
                      else __fail;
                  __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Decide.purs at 17:63 - 23:23";
                in
                  __pattern0 (__pattern1 __patternFail);
          __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Decide.purs at 16:1 - 23:23";
        in
          __pattern0 __patternFail;
      "Divide0" = _: module."Data.Divide".divideComparison;
    };
  choose = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.choose;
      __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Decide.purs at 14:3 - 14:65";
    in
      __pattern0 __patternFail;
  chosen = dictDecide: choose dictDecide identity;
in
  {inherit choose chosen chooseComparison chooseEquivalence choosePredicate chooseOp;}