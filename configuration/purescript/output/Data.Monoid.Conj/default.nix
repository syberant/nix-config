
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
  Conj = x: x;
  showConj = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                a = v;
              in
                append "(Conj " (append (show a) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Conj.purs at 25:1 - 26:44";
          in
            __pattern0 __patternFail;
      };
  semiringConj = dictHeytingAlgebra: 
    let
      conj = module."Data.HeytingAlgebra".conj dictHeytingAlgebra;
      disj = module."Data.HeytingAlgebra".disj dictHeytingAlgebra;
    in
      
      { zero = module."Data.HeytingAlgebra".tt dictHeytingAlgebra;
        one = module."Data.HeytingAlgebra".ff dictHeytingAlgebra;
        add = v: v1: 
          let
            __pattern0 = __fail: 
              let
                a = v;
                b = v1;
              in
                conj a b;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Conj.purs at 47:1 - 51:42";
          in
            __pattern0 __patternFail;
        mul = v: v1: 
          let
            __pattern0 = __fail: 
              let
                a = v;
                b = v1;
              in
                disj a b;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Conj.purs at 47:1 - 51:42";
          in
            __pattern0 __patternFail;
      };
  semigroupConj = dictHeytingAlgebra: 
    let
      conj = module."Data.HeytingAlgebra".conj dictHeytingAlgebra;
    in
      
      { append = v: v1: 
          let
            __pattern0 = __fail: 
              let
                a = v;
                b = v1;
              in
                conj a b;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Conj.purs at 41:1 - 42:45";
          in
            __pattern0 __patternFail;
      };
  ordConj = dictOrd: dictOrd;
  monoidConj = dictHeytingAlgebra: 
    let
      semigroupConj1 = semigroupConj dictHeytingAlgebra;
    in
      
      { mempty = module."Data.HeytingAlgebra".tt dictHeytingAlgebra;
        "Semigroup0" = _: semigroupConj1;
      };
  functorConj = 
    { map = f: m: 
        let
          __pattern0 = __fail: 
            let
              v = m;
            in
              f v;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Conj.purs at 0:0 - 0:0";
        in
          __pattern0 __patternFail;
    };
  eqConj = dictEq: dictEq;
  eq1Conj = {eq1 = dictEq: module."Data.Eq".eq (eqConj dictEq);};
  ord1Conj = 
    { compare1 = dictOrd: module."Data.Ord".compare (ordConj dictOrd);
      "Eq10" = _: eq1Conj;
    };
  boundedConj = dictBounded: dictBounded;
  applyConj = 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              x = v1;
            in
              f x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Conj.purs at 30:1 - 31:39";
        in
          __pattern0 __patternFail;
      "Functor0" = _: functorConj;
    };
  bindConj = 
    { bind = v: f: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              f1 = f;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Conj.purs at 36:1 - 37:24";
        in
          __pattern0 __patternFail;
      "Apply0" = _: applyConj;
    };
  applicativeConj = 
    { pure = Conj;
      "Apply0" = _: applyConj;
    };
  monadConj = 
    { "Applicative0" = _: applicativeConj;
      "Bind1" = _: bindConj;
    };
in
  {inherit Conj eqConj eq1Conj ordConj ord1Conj boundedConj showConj functorConj applyConj applicativeConj bindConj monadConj semigroupConj monoidConj semiringConj;}