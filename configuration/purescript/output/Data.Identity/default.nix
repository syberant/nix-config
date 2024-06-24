
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Comonad" = import ../Control.Comonad;
      "Control.Extend" = import ../Control.Extend;
      "Control.Lazy" = import ../Control.Lazy;
      "Control.Monad" = import ../Control.Monad;
      "Data.BooleanAlgebra" = import ../Data.BooleanAlgebra;
      "Data.Bounded" = import ../Data.Bounded;
      "Data.CommutativeRing" = import ../Data.CommutativeRing;
      "Data.Eq" = import ../Data.Eq;
      "Data.EuclideanRing" = import ../Data.EuclideanRing;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.Invariant" = import ../Data.Functor.Invariant;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ring" = import ../Data.Ring;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  Identity = x: x;
  showIdentity = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                x = v;
              in
                append "(Identity " (append (show x) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/identity/master/src/Data/Identity.purs at 42:1 - 43:52";
          in
            __pattern0 __patternFail;
      };
  semiringIdentity = dictSemiring: dictSemiring;
  semigroupIdentity = dictSemigroup: dictSemigroup;
  ringIdentity = dictRing: dictRing;
  ordIdentity = dictOrd: dictOrd;
  newtypeIdentity = {"Coercible0" = _: module."Prim".undefined;};
  monoidIdentity = dictMonoid: dictMonoid;
  lazyIdentity = dictLazy: dictLazy;
  heytingAlgebraIdentity = dictHeytingAlgebra: dictHeytingAlgebra;
  functorIdentity = 
    { map = f: m: 
        let
          __pattern0 = __fail: 
            let
              v = m;
            in
              f v;
          __patternFail = builtins.throw "Pattern match failure in .spago/identity/master/src/Data/Identity.purs at 0:0 - 0:0";
        in
          __pattern0 __patternFail;
    };
  invariantIdentity = {imap = module."Data.Functor.Invariant".imapF functorIdentity;};
  extendIdentity = 
    { extend = f: m: f m;
      "Functor0" = _: functorIdentity;
    };
  euclideanRingIdentity = dictEuclideanRing: dictEuclideanRing;
  eqIdentity = dictEq: dictEq;
  eq1Identity = {eq1 = dictEq: module."Data.Eq".eq (eqIdentity dictEq);};
  ord1Identity = 
    { compare1 = dictOrd: module."Data.Ord".compare (ordIdentity dictOrd);
      "Eq10" = _: eq1Identity;
    };
  comonadIdentity = 
    { extract = v: 
        let
          __pattern0 = __fail: 
            let
              x = v;
            in
              x;
          __patternFail = builtins.throw "Pattern match failure in .spago/identity/master/src/Data/Identity.purs at 71:1 - 72:27";
        in
          __pattern0 __patternFail;
      "Extend0" = _: extendIdentity;
    };
  commutativeRingIdentity = dictCommutativeRing: dictCommutativeRing;
  boundedIdentity = dictBounded: dictBounded;
  booleanAlgebraIdentity = dictBooleanAlgebra: dictBooleanAlgebra;
  applyIdentity = 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              x = v1;
            in
              f x;
          __patternFail = builtins.throw "Pattern match failure in .spago/identity/master/src/Data/Identity.purs at 57:1 - 58:51";
        in
          __pattern0 __patternFail;
      "Functor0" = _: functorIdentity;
    };
  bindIdentity = 
    { bind = v: f: 
        let
          __pattern0 = __fail: 
            let
              m = v;
              f1 = f;
            in
              f1 m;
          __patternFail = builtins.throw "Pattern match failure in .spago/identity/master/src/Data/Identity.purs at 63:1 - 64:28";
        in
          __pattern0 __patternFail;
      "Apply0" = _: applyIdentity;
    };
  applicativeIdentity = 
    { pure = Identity;
      "Apply0" = _: applyIdentity;
    };
  monadIdentity = 
    { "Applicative0" = _: applicativeIdentity;
      "Bind1" = _: bindIdentity;
    };
  altIdentity = 
    { alt = x: v: x;
      "Functor0" = _: functorIdentity;
    };
in
  {inherit Identity newtypeIdentity eqIdentity ordIdentity boundedIdentity heytingAlgebraIdentity booleanAlgebraIdentity semigroupIdentity monoidIdentity semiringIdentity euclideanRingIdentity ringIdentity commutativeRingIdentity lazyIdentity showIdentity eq1Identity ord1Identity functorIdentity invariantIdentity altIdentity applyIdentity applicativeIdentity bindIdentity monadIdentity extendIdentity comonadIdentity;}