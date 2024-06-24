
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Monad" = import ../Control.Monad;
      "Data.Bounded" = import ../Data.Bounded;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor" = import ../Data.Functor;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Ord" = import ../Data.Ord;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  Disj = x: x;
  showDisj = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                a = v;
              in
                append "(Disj " (append (show a) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Disj.purs at 25:1 - 26:44";
          in
            __pattern0 __patternFail;
      };
  semiringDisj = dictHeytingAlgebra: 
    let
      disj = module."Data.HeytingAlgebra".disj dictHeytingAlgebra;
      conj = module."Data.HeytingAlgebra".conj dictHeytingAlgebra;
    in
      
      { zero = module."Data.HeytingAlgebra".ff dictHeytingAlgebra;
        one = module."Data.HeytingAlgebra".tt dictHeytingAlgebra;
        add = v: v1: 
          let
            __pattern0 = __fail: 
              let
                a = v;
                b = v1;
              in
                disj a b;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Disj.purs at 47:1 - 51:42";
          in
            __pattern0 __patternFail;
        mul = v: v1: 
          let
            __pattern0 = __fail: 
              let
                a = v;
                b = v1;
              in
                conj a b;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Disj.purs at 47:1 - 51:42";
          in
            __pattern0 __patternFail;
      };
  semigroupDisj = dictHeytingAlgebra: 
    let
      disj = module."Data.HeytingAlgebra".disj dictHeytingAlgebra;
    in
      
      { append = v: v1: 
          let
            __pattern0 = __fail: 
              let
                a = v;
                b = v1;
              in
                disj a b;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Disj.purs at 41:1 - 42:45";
          in
            __pattern0 __patternFail;
      };
  ordDisj = dictOrd: dictOrd;
  monoidDisj = dictHeytingAlgebra: 
    let
      semigroupDisj1 = semigroupDisj dictHeytingAlgebra;
    in
      
      { mempty = module."Data.HeytingAlgebra".ff dictHeytingAlgebra;
        "Semigroup0" = _: semigroupDisj1;
      };
  functorDisj = 
    { map = f: m: 
        let
          __pattern0 = __fail: 
            let
              v = m;
            in
              f v;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Disj.purs at 0:0 - 0:0";
        in
          __pattern0 __patternFail;
    };
  eqDisj = dictEq: dictEq;
  eq1Disj = {eq1 = dictEq: module."Data.Eq".eq (eqDisj dictEq);};
  ord1Disj = 
    { compare1 = dictOrd: module."Data.Ord".compare (ordDisj dictOrd);
      "Eq10" = _: eq1Disj;
    };
  boundedDisj = dictBounded: dictBounded;
  applyDisj = 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              x = v1;
            in
              f x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Disj.purs at 30:1 - 31:39";
        in
          __pattern0 __patternFail;
      "Functor0" = _: functorDisj;
    };
  bindDisj = 
    { bind = v: f: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              f1 = f;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Disj.purs at 36:1 - 37:24";
        in
          __pattern0 __patternFail;
      "Apply0" = _: applyDisj;
    };
  applicativeDisj = 
    { pure = Disj;
      "Apply0" = _: applyDisj;
    };
  monadDisj = 
    { "Applicative0" = _: applicativeDisj;
      "Bind1" = _: bindDisj;
    };
in
  {inherit Disj eqDisj eq1Disj ordDisj ord1Disj boundedDisj showDisj functorDisj applyDisj applicativeDisj bindDisj monadDisj semigroupDisj monoidDisj semiringDisj;}