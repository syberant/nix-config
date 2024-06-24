
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
  Additive = x: x;
  showAdditive = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                a = v;
              in
                append "(Additive " (append (show a) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Additive.purs at 24:1 - 25:52";
          in
            __pattern0 __patternFail;
      };
  semigroupAdditive = dictSemiring: 
    let
      add = module."Data.Semiring".add dictSemiring;
    in
      
      { append = v: v1: 
          let
            __pattern0 = __fail: 
              let
                a = v;
                b = v1;
              in
                add a b;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Additive.purs at 40:1 - 41:54";
          in
            __pattern0 __patternFail;
      };
  ordAdditive = dictOrd: dictOrd;
  monoidAdditive = dictSemiring: 
    let
      semigroupAdditive1 = semigroupAdditive dictSemiring;
    in
      
      { mempty = module."Data.Semiring".zero dictSemiring;
        "Semigroup0" = _: semigroupAdditive1;
      };
  functorAdditive = 
    { map = f: m: 
        let
          __pattern0 = __fail: 
            let
              v = m;
            in
              f v;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Additive.purs at 0:0 - 0:0";
        in
          __pattern0 __patternFail;
    };
  eqAdditive = dictEq: dictEq;
  eq1Additive = {eq1 = dictEq: module."Data.Eq".eq (eqAdditive dictEq);};
  ord1Additive = 
    { compare1 = dictOrd: module."Data.Ord".compare (ordAdditive dictOrd);
      "Eq10" = _: eq1Additive;
    };
  boundedAdditive = dictBounded: dictBounded;
  applyAdditive = 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              x = v1;
            in
              f x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Additive.purs at 29:1 - 30:51";
        in
          __pattern0 __patternFail;
      "Functor0" = _: functorAdditive;
    };
  bindAdditive = 
    { bind = v: f: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              f1 = f;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Additive.purs at 35:1 - 36:28";
        in
          __pattern0 __patternFail;
      "Apply0" = _: applyAdditive;
    };
  applicativeAdditive = 
    { pure = Additive;
      "Apply0" = _: applyAdditive;
    };
  monadAdditive = 
    { "Applicative0" = _: applicativeAdditive;
      "Bind1" = _: bindAdditive;
    };
in
  {inherit Additive eqAdditive eq1Additive ordAdditive ord1Additive boundedAdditive showAdditive functorAdditive applyAdditive applicativeAdditive bindAdditive monadAdditive semigroupAdditive monoidAdditive;}