
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Monad" = import ../Control.Monad;
      "Data.Bounded" = import ../Data.Bounded;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor" = import ../Data.Functor;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Ord" = import ../Data.Ord;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  Dual = x: x;
  showDual = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                a = v;
              in
                append "(Dual " (append (show a) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Dual.purs at 24:1 - 25:44";
          in
            __pattern0 __patternFail;
      };
  semigroupDual = dictSemigroup: 
    let
      append1 = module."Data.Semigroup".append dictSemigroup;
    in
      
      { append = v: v1: 
          let
            __pattern0 = __fail: 
              let
                x = v;
                y = v1;
              in
                append1 y x;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Dual.purs at 40:1 - 41:43";
          in
            __pattern0 __patternFail;
      };
  ordDual = dictOrd: dictOrd;
  monoidDual = dictMonoid: 
    let
      semigroupDual1 = semigroupDual (dictMonoid."Semigroup0" module."Prim".undefined);
    in
      
      { mempty = module."Data.Monoid".mempty dictMonoid;
        "Semigroup0" = _: semigroupDual1;
      };
  functorDual = 
    { map = f: m: 
        let
          __pattern0 = __fail: 
            let
              v = m;
            in
              f v;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Dual.purs at 0:0 - 0:0";
        in
          __pattern0 __patternFail;
    };
  eqDual = dictEq: dictEq;
  eq1Dual = {eq1 = dictEq: module."Data.Eq".eq (eqDual dictEq);};
  ord1Dual = 
    { compare1 = dictOrd: module."Data.Ord".compare (ordDual dictOrd);
      "Eq10" = _: eq1Dual;
    };
  boundedDual = dictBounded: dictBounded;
  applyDual = 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              x = v1;
            in
              f x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Dual.purs at 29:1 - 30:39";
        in
          __pattern0 __patternFail;
      "Functor0" = _: functorDual;
    };
  bindDual = 
    { bind = v: f: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              f1 = f;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Dual.purs at 35:1 - 36:24";
        in
          __pattern0 __patternFail;
      "Apply0" = _: applyDual;
    };
  applicativeDual = 
    { pure = Dual;
      "Apply0" = _: applyDual;
    };
  monadDual = 
    { "Applicative0" = _: applicativeDual;
      "Bind1" = _: bindDual;
    };
in
  {inherit Dual eqDual eq1Dual ordDual ord1Dual boundedDual showDual functorDual applyDual applicativeDual bindDual monadDual semigroupDual monoidDual;}