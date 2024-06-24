
let
  module = 
    { "Control.Biapplicative" = import ../Control.Biapplicative;
      "Control.Biapply" = import ../Control.Biapply;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor" = import ../Data.Functor;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Profunctor" = import ../Data.Profunctor;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  conj = module."Data.HeytingAlgebra".conj module."Data.HeytingAlgebra".heytingAlgebraBoolean;
  Product2 = value0: value1: 
    { __tag = "Product2";
      __field0 = value0;
      __field1 = value1;
    };
  showProduct2 = dictShow: 
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
                if v.__tag == "Product2"
                  then 
                    let
                      x = v.__field0;
                      y = v.__field1;
                    in
                      append "(Product2 " (append (show x) (append " " (append (show1 y) ")")))
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product2.purs at 24:1 - 25:71";
            in
              __pattern0 __patternFail;
        };
  profunctorProduct2 = dictProfunctor: 
    let
      dimap = module."Data.Profunctor".dimap dictProfunctor;
    in
      dictProfunctor1: 
      let
        dimap1 = module."Data.Profunctor".dimap dictProfunctor1;
      in
        
        { dimap = f: g: v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Product2"
                  then 
                    let
                      f1 = f;
                      g1 = g;
                      x = v.__field0;
                      y = v.__field1;
                    in
                      Product2 (dimap f1 g1 x) (dimap1 f1 g1 y)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product2.purs at 39:1 - 40:66";
            in
              __pattern0 __patternFail;
        };
  functorProduct2 = dictFunctor: 
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
                if v.__tag == "Product2"
                  then 
                    let
                      f1 = f;
                      x = v.__field0;
                      y = v.__field1;
                    in
                      Product2 (map f1 x) (map1 f1 y)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product2.purs at 27:1 - 28:54";
            in
              __pattern0 __patternFail;
        };
  eqProduct2 = dictEq: 
    let
      eq = module."Data.Eq".eq dictEq;
    in
      dictEq1: 
      let
        eq1 = module."Data.Eq".eq dictEq1;
      in
        
        { eq = x: y: 
            let
              __pattern0 = __fail: 
                if x.__tag == "Product2" && y.__tag == "Product2"
                  then 
                    let
                      l = x.__field0;
                      l1 = x.__field1;
                      r = y.__field0;
                      r1 = y.__field1;
                    in
                      conj (eq l r) (eq1 l1 r1)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product2.purs at 0:0 - 0:0";
            in
              __pattern0 __patternFail;
        };
  ordProduct2 = dictOrd: 
    let
      compare = module."Data.Ord".compare dictOrd;
      eqProduct21 = eqProduct2 (dictOrd."Eq0" module."Prim".undefined);
    in
      dictOrd1: 
      let
        compare1 = module."Data.Ord".compare dictOrd1;
        eqProduct22 = eqProduct21 (dictOrd1."Eq0" module."Prim".undefined);
      in
        
        { compare = x: y: 
            let
              __pattern0 = __fail: 
                if x.__tag == "Product2" && y.__tag == "Product2"
                  then 
                    let
                      l = x.__field0;
                      l1 = x.__field1;
                      r = y.__field0;
                      r1 = y.__field1;
                    in
                      
                      let
                        v = compare l r;
                      in
                        
                        let
                          __pattern0 = __fail: if v.__tag == "LT" then module."Data.Ordering".LT else __fail;
                          __pattern1 = __fail: if v.__tag == "GT" then module."Data.Ordering".GT else __fail;
                          __pattern2 = __fail: compare1 l1 r1;
                          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product2.purs at 0:0 - 0:0";
                        in
                          __pattern0 (__pattern1 (__pattern2 __patternFail))
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product2.purs at 0:0 - 0:0";
            in
              __pattern0 __patternFail;
          "Eq0" = _: eqProduct22;
        };
  bifunctorProduct2 = dictBifunctor: 
    let
      bimap = module."Data.Bifunctor".bimap dictBifunctor;
    in
      dictBifunctor1: 
      let
        bimap1 = module."Data.Bifunctor".bimap dictBifunctor1;
      in
        
        { bimap = f: g: v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Product2"
                  then 
                    let
                      f1 = f;
                      g1 = g;
                      x = v.__field0;
                      y = v.__field1;
                    in
                      Product2 (bimap f1 g1 x) (bimap1 f1 g1 y)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product2.purs at 30:1 - 31:66";
            in
              __pattern0 __patternFail;
        };
  biapplyProduct2 = dictBiapply: 
    let
      biapply = module."Control.Biapply".biapply dictBiapply;
      bifunctorProduct21 = bifunctorProduct2 (dictBiapply."Bifunctor0" module."Prim".undefined);
    in
      dictBiapply1: 
      let
        biapply1 = module."Control.Biapply".biapply dictBiapply1;
        bifunctorProduct22 = bifunctorProduct21 (dictBiapply1."Bifunctor0" module."Prim".undefined);
      in
        
        { biapply = v: v1: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Product2" && v1.__tag == "Product2"
                  then 
                    let
                      w = v.__field0;
                      x = v.__field1;
                      y = v1.__field0;
                      z = v1.__field1;
                    in
                      Product2 (biapply w y) (biapply1 x z)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product2.purs at 33:1 - 34:79";
            in
              __pattern0 __patternFail;
          "Bifunctor0" = _: bifunctorProduct22;
        };
  biapplicativeProduct2 = dictBiapplicative: 
    let
      bipure = module."Control.Biapplicative".bipure dictBiapplicative;
      biapplyProduct21 = biapplyProduct2 (dictBiapplicative."Biapply0" module."Prim".undefined);
    in
      dictBiapplicative1: 
      let
        bipure1 = module."Control.Biapplicative".bipure dictBiapplicative1;
        biapplyProduct22 = biapplyProduct21 (dictBiapplicative1."Biapply0" module."Prim".undefined);
      in
        
        { bipure = a: b: Product2 (bipure a b) (bipure1 a b);
          "Biapply0" = _: biapplyProduct22;
        };
in
  {inherit Product2 eqProduct2 ordProduct2 showProduct2 functorProduct2 bifunctorProduct2 biapplyProduct2 biapplicativeProduct2 profunctorProduct2;}