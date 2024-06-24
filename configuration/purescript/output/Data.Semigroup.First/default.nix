
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Monad" = import ../Control.Monad;
      "Data.Bounded" = import ../Data.Bounded;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor" = import ../Data.Functor;
      "Data.Ord" = import ../Data.Ord;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  First = x: x;
  showFirst = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                a = v;
              in
                append "(First " (append (show a) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semigroup/First.purs at 23:1 - 24:46";
          in
            __pattern0 __patternFail;
      };
  semigroupFirst = {append = x: v: x;};
  ordFirst = dictOrd: dictOrd;
  functorFirst = 
    { map = f: m: 
        let
          __pattern0 = __fail: 
            let
              v = m;
            in
              f v;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semigroup/First.purs at 0:0 - 0:0";
        in
          __pattern0 __patternFail;
    };
  eqFirst = dictEq: dictEq;
  eq1First = {eq1 = dictEq: module."Data.Eq".eq (eqFirst dictEq);};
  ord1First = 
    { compare1 = dictOrd: module."Data.Ord".compare (ordFirst dictOrd);
      "Eq10" = _: eq1First;
    };
  boundedFirst = dictBounded: dictBounded;
  applyFirst = 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              x = v1;
            in
              f x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semigroup/First.purs at 28:1 - 29:42";
        in
          __pattern0 __patternFail;
      "Functor0" = _: functorFirst;
    };
  bindFirst = 
    { bind = v: f: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              f1 = f;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semigroup/First.purs at 34:1 - 35:25";
        in
          __pattern0 __patternFail;
      "Apply0" = _: applyFirst;
    };
  applicativeFirst = 
    { pure = First;
      "Apply0" = _: applyFirst;
    };
  monadFirst = 
    { "Applicative0" = _: applicativeFirst;
      "Bind1" = _: bindFirst;
    };
in
  {inherit First eqFirst eq1First ordFirst ord1First boundedFirst showFirst functorFirst applyFirst applicativeFirst bindFirst monadFirst semigroupFirst;}