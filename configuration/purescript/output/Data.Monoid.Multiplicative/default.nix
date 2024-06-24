
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
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  Multiplicative = x: x;
  showMultiplicative = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                a = v;
              in
                append "(Multiplicative " (append (show a) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Multiplicative.purs at 24:1 - 25:64";
          in
            __pattern0 __patternFail;
      };
  semigroupMultiplicative = dictSemiring: 
    let
      mul = module."Data.Semiring".mul dictSemiring;
    in
      
      { append = v: v1: 
          let
            __pattern0 = __fail: 
              let
                a = v;
                b = v1;
              in
                mul a b;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Multiplicative.purs at 40:1 - 41:72";
          in
            __pattern0 __patternFail;
      };
  ordMultiplicative = dictOrd: dictOrd;
  monoidMultiplicative = dictSemiring: 
    let
      semigroupMultiplicative1 = semigroupMultiplicative dictSemiring;
    in
      
      { mempty = module."Data.Semiring".one dictSemiring;
        "Semigroup0" = _: semigroupMultiplicative1;
      };
  functorMultiplicative = 
    { map = f: m: 
        let
          __pattern0 = __fail: 
            let
              v = m;
            in
              f v;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Multiplicative.purs at 0:0 - 0:0";
        in
          __pattern0 __patternFail;
    };
  eqMultiplicative = dictEq: dictEq;
  eq1Multiplicative = {eq1 = dictEq: module."Data.Eq".eq (eqMultiplicative dictEq);};
  ord1Multiplicative = 
    { compare1 = dictOrd: module."Data.Ord".compare (ordMultiplicative dictOrd);
      "Eq10" = _: eq1Multiplicative;
    };
  boundedMultiplicative = dictBounded: dictBounded;
  applyMultiplicative = 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              x = v1;
            in
              f x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Multiplicative.purs at 29:1 - 30:69";
        in
          __pattern0 __patternFail;
      "Functor0" = _: functorMultiplicative;
    };
  bindMultiplicative = 
    { bind = v: f: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              f1 = f;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Multiplicative.purs at 35:1 - 36:34";
        in
          __pattern0 __patternFail;
      "Apply0" = _: applyMultiplicative;
    };
  applicativeMultiplicative = 
    { pure = Multiplicative;
      "Apply0" = _: applyMultiplicative;
    };
  monadMultiplicative = 
    { "Applicative0" = _: applicativeMultiplicative;
      "Bind1" = _: bindMultiplicative;
    };
in
  {inherit Multiplicative eqMultiplicative eq1Multiplicative ordMultiplicative ord1Multiplicative boundedMultiplicative showMultiplicative functorMultiplicative applyMultiplicative applicativeMultiplicative bindMultiplicative monadMultiplicative semigroupMultiplicative monoidMultiplicative;}