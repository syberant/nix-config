
let
  module = 
    { "Control.Comonad" = import ../Control.Comonad;
      "Control.Extend" = import ../Control.Extend;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Either" = import ../Data.Either;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor" = import ../Data.Functor;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  bimap = module."Data.Bifunctor".bimap module."Data.Bifunctor".bifunctorEither;
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  Coproduct = x: x;
  showCoproduct = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      dictShow1: 
      let
        show1 = module."Data.Show".show dictShow1;
      in
        
        { show = v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Left"
                  then 
                    let
                      fa = v.__field0;
                    in
                      append "(left " (append (show fa) ")")
                  else __fail;
              __pattern1 = __fail: 
                if v.__tag == "Right"
                  then 
                    let
                      ga = v.__field0;
                    in
                      append "(right " (append (show1 ga) ")")
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct.purs at 63:1 - 65:60";
            in
              __pattern0 (__pattern1 __patternFail);
        };
  right = ga: module."Data.Either".Right ga;
  newtypeCoproduct = {"Coercible0" = _: module."Prim".undefined;};
  left = fa: module."Data.Either".Left fa;
  functorCoproduct = dictFunctor: 
    let
      map = module."Data.Functor".map dictFunctor;
    in
      dictFunctor1: 
      let
        map1 = module."Data.Functor".map dictFunctor1;
      in
        
        { map = f: v: 
            let
              __pattern0 = __fail: 
                let
                  f1 = f;
                  e = v;
                in
                  bimap (map f1) (map1 f1) e;
              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct.purs at 67:1 - 68:60";
            in
              __pattern0 __patternFail;
        };
  eq1Coproduct = dictEq1: 
    let
      eq1 = module."Data.Eq".eq1 dictEq1;
    in
      dictEq11: 
      let
        eq11 = module."Data.Eq".eq1 dictEq11;
      in
        
        { eq1 = dictEq: 
            let
              eq12 = eq1 dictEq;
              eq13 = eq11 dictEq;
            in
              v: v1: 
              let
                __pattern0 = __fail: 
                  let
                    x = v;
                    y = v1;
                  in
                    
                    let
                      __pattern0 = __fail: 
                        if x.__tag == "Left" && y.__tag == "Left"
                          then 
                            let
                              fa = x.__field0;
                              ga = y.__field0;
                            in
                              eq12 fa ga
                          else __fail;
                      __pattern1 = __fail: 
                        if x.__tag == "Right" && y.__tag == "Right"
                          then 
                            let
                              fa = x.__field0;
                              ga = y.__field0;
                            in
                              eq13 fa ga
                          else __fail;
                      __pattern2 = __fail: false;
                      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct.purs at 47:5 - 50:20";
                    in
                      __pattern0 (__pattern1 (__pattern2 __patternFail));
                __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct.purs at 45:1 - 50:20";
              in
                __pattern0 __patternFail;
        };
  eqCoproduct = dictEq1: 
    let
      eq1Coproduct1 = eq1Coproduct dictEq1;
    in
      dictEq11: 
      let
        eq1 = module."Data.Eq".eq1 (eq1Coproduct1 dictEq11);
      in
        dictEq: {eq = eq1 dictEq;};
  ord1Coproduct = dictOrd1: 
    let
      compare1 = module."Data.Ord".compare1 dictOrd1;
      eq1Coproduct1 = eq1Coproduct (dictOrd1."Eq10" module."Prim".undefined);
    in
      dictOrd11: 
      let
        compare11 = module."Data.Ord".compare1 dictOrd11;
        eq1Coproduct2 = eq1Coproduct1 (dictOrd11."Eq10" module."Prim".undefined);
      in
        
        { compare1 = dictOrd: 
            let
              compare12 = compare1 dictOrd;
              compare13 = compare11 dictOrd;
            in
              v: v1: 
              let
                __pattern0 = __fail: 
                  let
                    x = v;
                    y = v1;
                  in
                    
                    let
                      __pattern0 = __fail: 
                        if x.__tag == "Left" && y.__tag == "Left"
                          then 
                            let
                              fa = x.__field0;
                              ga = y.__field0;
                            in
                              compare12 fa ga
                          else __fail;
                      __pattern1 = __fail: if x.__tag == "Left" then module."Data.Ordering".LT else __fail;
                      __pattern2 = __fail: if y.__tag == "Left" then module."Data.Ordering".GT else __fail;
                      __pattern3 = __fail: 
                        if x.__tag == "Right" && y.__tag == "Right"
                          then 
                            let
                              fa = x.__field0;
                              ga = y.__field0;
                            in
                              compare13 fa ga
                          else __fail;
                      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct.purs at 57:5 - 61:43";
                    in
                      __pattern0 (__pattern1 (__pattern2 (__pattern3 __patternFail)));
                __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct.purs at 55:1 - 61:43";
              in
                __pattern0 __patternFail;
          "Eq10" = _: eq1Coproduct2;
        };
  ordCoproduct = dictOrd1: 
    let
      ord1Coproduct1 = ord1Coproduct dictOrd1;
      eqCoproduct1 = eqCoproduct (dictOrd1."Eq10" module."Prim".undefined);
    in
      dictOrd11: 
      let
        compare1 = module."Data.Ord".compare1 (ord1Coproduct1 dictOrd11);
        eqCoproduct2 = eqCoproduct1 (dictOrd11."Eq10" module."Prim".undefined);
      in
        dictOrd: 
        let
          eqCoproduct3 = eqCoproduct2 (dictOrd."Eq0" module."Prim".undefined);
        in
          
          { compare = compare1 dictOrd;
            "Eq0" = _: eqCoproduct3;
          };
  coproduct = v: v1: v2: 
    let
      __pattern0 = __fail: 
        if v2.__tag == "Left"
          then 
            let
              f = v;
              a = v2.__field0;
            in
              f a
          else __fail;
      __pattern1 = __fail: 
        if v2.__tag == "Right"
          then 
            let
              g = v1;
              b = v2.__field0;
            in
              g b
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct.purs at 27:1 - 27:78";
    in
      __pattern0 (__pattern1 __patternFail);
  extendCoproduct = dictExtend: 
    let
      extend = module."Control.Extend".extend dictExtend;
      functorCoproduct1 = functorCoproduct (dictExtend."Functor0" module."Prim".undefined);
    in
      dictExtend1: 
      let
        extend1 = module."Control.Extend".extend dictExtend1;
        functorCoproduct2 = functorCoproduct1 (dictExtend1."Functor0" module."Prim".undefined);
      in
        
        { extend = f: compose Coproduct (coproduct (compose module."Data.Either".Left (extend (compose f (compose Coproduct module."Data.Either".Left)))) (compose module."Data.Either".Right (extend1 (compose f (compose Coproduct module."Data.Either".Right)))));
          "Functor0" = _: functorCoproduct2;
        };
  comonadCoproduct = dictComonad: 
    let
      extract = module."Control.Comonad".extract dictComonad;
      extendCoproduct1 = extendCoproduct (dictComonad."Extend0" module."Prim".undefined);
    in
      dictComonad1: 
      let
        extendCoproduct2 = extendCoproduct1 (dictComonad1."Extend0" module."Prim".undefined);
      in
        
        { extract = coproduct extract (module."Control.Comonad".extract dictComonad1);
          "Extend0" = _: extendCoproduct2;
        };
  bihoistCoproduct = natF: natG: v: 
    let
      __pattern0 = __fail: 
        let
          natF1 = natF;
          natG1 = natG;
          e = v;
        in
          bimap natF1 natG1 e;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct.purs at 32:1 - 37:19";
    in
      __pattern0 __patternFail;
in
  {inherit Coproduct left right coproduct bihoistCoproduct newtypeCoproduct eqCoproduct eq1Coproduct ordCoproduct ord1Coproduct showCoproduct functorCoproduct extendCoproduct comonadCoproduct;}