
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
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
  Const = x: x;
  showConst = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                x = v;
              in
                append "(Const " (append (show x) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/const/master/src/Data/Const.purs at 32:1 - 33:46";
          in
            __pattern0 __patternFail;
      };
  semiringConst = dictSemiring: dictSemiring;
  semigroupoidConst = 
    { compose = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v1;
            in
              x;
          __patternFail = builtins.throw "Pattern match failure in .spago/const/master/src/Data/Const.purs at 35:1 - 36:32";
        in
          __pattern0 __patternFail;
    };
  semigroupConst = dictSemigroup: dictSemigroup;
  ringConst = dictRing: dictRing;
  ordConst = dictOrd: dictOrd;
  newtypeConst = {"Coercible0" = _: module."Prim".undefined;};
  monoidConst = dictMonoid: dictMonoid;
  heytingAlgebraConst = dictHeytingAlgebra: dictHeytingAlgebra;
  functorConst = 
    { map = f: m: 
        let
          __pattern0 = __fail: 
            let
              v = m;
            in
              v;
          __patternFail = builtins.throw "Pattern match failure in .spago/const/master/src/Data/Const.purs at 0:0 - 0:0";
        in
          __pattern0 __patternFail;
    };
  invariantConst = {imap = module."Data.Functor.Invariant".imapF functorConst;};
  euclideanRingConst = dictEuclideanRing: dictEuclideanRing;
  eqConst = dictEq: dictEq;
  eq1Const = dictEq: 
    let
      eq = module."Data.Eq".eq (eqConst dictEq);
    in
      {eq1 = dictEq1: eq;};
  ord1Const = dictOrd: 
    let
      compare = module."Data.Ord".compare (ordConst dictOrd);
      eq1Const1 = eq1Const (dictOrd."Eq0" module."Prim".undefined);
    in
      
      { compare1 = dictOrd1: compare;
        "Eq10" = _: eq1Const1;
      };
  commutativeRingConst = dictCommutativeRing: dictCommutativeRing;
  boundedConst = dictBounded: dictBounded;
  booleanAlgebraConst = dictBooleanAlgebra: dictBooleanAlgebra;
  applyConst = dictSemigroup: 
    let
      append1 = module."Data.Semigroup".append dictSemigroup;
    in
      
      { apply = v: v1: 
          let
            __pattern0 = __fail: 
              let
                x = v;
                y = v1;
              in
                append1 x y;
            __patternFail = builtins.throw "Pattern match failure in .spago/const/master/src/Data/Const.purs at 59:1 - 60:45";
          in
            __pattern0 __patternFail;
        "Functor0" = _: functorConst;
      };
  applicativeConst = dictMonoid: 
    let
      mempty = module."Data.Monoid".mempty dictMonoid;
      applyConst1 = applyConst (dictMonoid."Semigroup0" module."Prim".undefined);
    in
      
      { pure = v: mempty;
        "Apply0" = _: applyConst1;
      };
in
  {inherit Const newtypeConst eqConst eq1Const ordConst ord1Const boundedConst showConst semigroupoidConst semigroupConst monoidConst semiringConst ringConst euclideanRingConst commutativeRingConst heytingAlgebraConst booleanAlgebraConst functorConst invariantConst applyConst applicativeConst;}