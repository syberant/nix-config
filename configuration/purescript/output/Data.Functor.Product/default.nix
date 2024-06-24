
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Monad" = import ../Control.Monad;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor" = import ../Data.Functor;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Data.Tuple" = import ../Data.Tuple;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  bimap = module."Data.Bifunctor".bimap module."Data.Bifunctor".bifunctorTuple;
  conj = module."Data.HeytingAlgebra".conj module."Data.HeytingAlgebra".heytingAlgebraBoolean;
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  unwrap = module."Data.Newtype".unwrap module."Prim".undefined;
  Product = x: x;
  showProduct = dictShow: 
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
                if v.__tag == "Tuple"
                  then 
                    let
                      fa = v.__field0;
                      ga = v.__field1;
                    in
                      append "(product " (append (show fa) (append " " (append (show1 ga) ")")))
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product.purs at 44:1 - 45:81";
            in
              __pattern0 __patternFail;
        };
  product = fa: ga: module."Data.Tuple".Tuple fa ga;
  newtypeProduct = {"Coercible0" = _: module."Prim".undefined;};
  functorProduct = dictFunctor: 
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
                  fga = v;
                in
                  bimap (map f1) (map1 f1) fga;
              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product.purs at 47:1 - 48:60";
            in
              __pattern0 __patternFail;
        };
  eq1Product = dictEq1: 
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
                  if v.__tag == "Tuple" && v1.__tag == "Tuple"
                    then 
                      let
                        l1 = v.__field0;
                        r1 = v.__field1;
                        l2 = v1.__field0;
                        r2 = v1.__field1;
                      in
                        conj (eq12 l1 l2) (eq13 r1 r2)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product.purs at 32:1 - 33:79";
              in
                __pattern0 __patternFail;
        };
  eqProduct = dictEq1: 
    let
      eq1Product1 = eq1Product dictEq1;
    in
      dictEq11: 
      let
        eq1 = module."Data.Eq".eq1 (eq1Product1 dictEq11);
      in
        dictEq: {eq = eq1 dictEq;};
  ord1Product = dictOrd1: 
    let
      compare1 = module."Data.Ord".compare1 dictOrd1;
      eq1Product1 = eq1Product (dictOrd1."Eq10" module."Prim".undefined);
    in
      dictOrd11: 
      let
        compare11 = module."Data.Ord".compare1 dictOrd11;
        eq1Product2 = eq1Product1 (dictOrd11."Eq10" module."Prim".undefined);
      in
        
        { compare1 = dictOrd: 
            let
              compare12 = compare1 dictOrd;
              compare13 = compare11 dictOrd;
            in
              v: v1: 
              let
                __pattern0 = __fail: 
                  if v.__tag == "Tuple" && v1.__tag == "Tuple"
                    then 
                      let
                        l1 = v.__field0;
                        r1 = v.__field1;
                        l2 = v1.__field0;
                        r2 = v1.__field1;
                      in
                        
                        let
                          v2 = compare12 l1 l2;
                        in
                          
                          let
                            __pattern0 = __fail: if v2.__tag == "EQ" then compare13 r1 r2 else __fail;
                            __pattern1 = __fail: 
                              let
                                o = v2;
                              in
                                o;
                            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product.purs at 40:5 - 42:13";
                          in
                            __pattern0 (__pattern1 __patternFail)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product.purs at 38:1 - 42:13";
              in
                __pattern0 __patternFail;
          "Eq10" = _: eq1Product2;
        };
  ordProduct = dictOrd1: 
    let
      ord1Product1 = ord1Product dictOrd1;
      eqProduct1 = eqProduct (dictOrd1."Eq10" module."Prim".undefined);
    in
      dictOrd11: 
      let
        compare1 = module."Data.Ord".compare1 (ord1Product1 dictOrd11);
        eqProduct2 = eqProduct1 (dictOrd11."Eq10" module."Prim".undefined);
      in
        dictOrd: 
        let
          eqProduct3 = eqProduct2 (dictOrd."Eq0" module."Prim".undefined);
        in
          
          { compare = compare1 dictOrd;
            "Eq0" = _: eqProduct3;
          };
  bihoistProduct = natF: natG: v: 
    let
      __pattern0 = __fail: 
        let
          natF1 = natF;
          natG1 = natG;
          e = v;
        in
          bimap natF1 natG1 e;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product.purs at 19:1 - 24:17";
    in
      __pattern0 __patternFail;
  applyProduct = dictApply: 
    let
      apply = module."Control.Apply".apply dictApply;
      functorProduct1 = functorProduct (dictApply."Functor0" module."Prim".undefined);
    in
      dictApply1: 
      let
        apply1 = module."Control.Apply".apply dictApply1;
        functorProduct2 = functorProduct1 (dictApply1."Functor0" module."Prim".undefined);
      in
        
        { apply = v: v1: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Tuple" && v1.__tag == "Tuple"
                  then 
                    let
                      f = v.__field0;
                      g = v.__field1;
                      a = v1.__field0;
                      b = v1.__field1;
                    in
                      product (apply f a) (apply1 g b)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product.purs at 50:1 - 51:86";
            in
              __pattern0 __patternFail;
          "Functor0" = _: functorProduct2;
        };
  bindProduct = dictBind: 
    let
      bind = module."Control.Bind".bind dictBind;
      applyProduct1 = applyProduct (dictBind."Apply0" module."Prim".undefined);
    in
      dictBind1: 
      let
        bind1 = module."Control.Bind".bind dictBind1;
        applyProduct2 = applyProduct1 (dictBind1."Apply0" module."Prim".undefined);
      in
        
        { bind = v: f: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Tuple"
                  then 
                    let
                      fa = v.__field0;
                      ga = v.__field1;
                      f1 = f;
                    in
                      product (bind fa (compose module."Data.Tuple".fst (compose unwrap f1))) (bind1 ga (compose module."Data.Tuple".snd (compose unwrap f1)))
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product.purs at 56:1 - 58:72";
            in
              __pattern0 __patternFail;
          "Apply0" = _: applyProduct2;
        };
  applicativeProduct = dictApplicative: 
    let
      pure = module."Control.Applicative".pure dictApplicative;
      applyProduct1 = applyProduct (dictApplicative."Apply0" module."Prim".undefined);
    in
      dictApplicative1: 
      let
        pure1 = module."Control.Applicative".pure dictApplicative1;
        applyProduct2 = applyProduct1 (dictApplicative1."Apply0" module."Prim".undefined);
      in
        
        { pure = a: product (pure a) (pure1 a);
          "Apply0" = _: applyProduct2;
        };
  monadProduct = dictMonad: 
    let
      applicativeProduct1 = applicativeProduct (dictMonad."Applicative0" module."Prim".undefined);
      bindProduct1 = bindProduct (dictMonad."Bind1" module."Prim".undefined);
    in
      dictMonad1: 
      let
        applicativeProduct2 = applicativeProduct1 (dictMonad1."Applicative0" module."Prim".undefined);
        bindProduct2 = bindProduct1 (dictMonad1."Bind1" module."Prim".undefined);
      in
        
        { "Applicative0" = _: applicativeProduct2;
          "Bind1" = _: bindProduct2;
        };
in
  {inherit Product product bihoistProduct newtypeProduct eqProduct eq1Product ordProduct ord1Product showProduct functorProduct applyProduct applicativeProduct bindProduct monadProduct;}