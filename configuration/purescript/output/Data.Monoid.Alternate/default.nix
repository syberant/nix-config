
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Alternative" = import ../Control.Alternative;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Comonad" = import ../Control.Comonad;
      "Control.Extend" = import ../Control.Extend;
      "Control.Monad" = import ../Control.Monad;
      "Control.Plus" = import ../Control.Plus;
      "Data.Bounded" = import ../Data.Bounded;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor" = import ../Data.Functor;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  Alternate = x: x;
  showAlternate = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                a = v;
              in
                append "(Alternate " (append (show a) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/control/master/src/Data/Monoid/Alternate.purs at 53:1 - 54:54";
          in
            __pattern0 __patternFail;
      };
  semigroupAlternate = dictAlt: 
    let
      alt = module."Control.Alt".alt dictAlt;
    in
      
      { append = v: v1: 
          let
            __pattern0 = __fail: 
              let
                a = v;
                b = v1;
              in
                alt a b;
            __patternFail = builtins.throw "Pattern match failure in .spago/control/master/src/Data/Monoid/Alternate.purs at 56:1 - 57:59";
          in
            __pattern0 __patternFail;
      };
  plusAlternate = dictPlus: dictPlus;
  ordAlternate = dictOrd: dictOrd;
  ord1Alternate = dictOrd1: dictOrd1;
  newtypeAlternate = {"Coercible0" = _: module."Prim".undefined;};
  monoidAlternate = dictPlus: 
    let
      semigroupAlternate1 = semigroupAlternate (dictPlus."Alt0" module."Prim".undefined);
    in
      
      { mempty = module."Control.Plus".empty dictPlus;
        "Semigroup0" = _: semigroupAlternate1;
      };
  monadAlternate = dictMonad: dictMonad;
  functorAlternate = dictFunctor: dictFunctor;
  extendAlternate = dictExtend: dictExtend;
  eqAlternate = dictEq: dictEq;
  eq1Alternate = dictEq1: dictEq1;
  comonadAlternate = dictComonad: dictComonad;
  boundedAlternate = dictBounded: dictBounded;
  bindAlternate = dictBind: dictBind;
  applyAlternate = dictApply: dictApply;
  applicativeAlternate = dictApplicative: dictApplicative;
  alternativeAlternate = dictAlternative: dictAlternative;
  altAlternate = dictAlt: dictAlt;
in
  {inherit Alternate newtypeAlternate eqAlternate eq1Alternate ordAlternate ord1Alternate boundedAlternate functorAlternate applyAlternate applicativeAlternate altAlternate plusAlternate alternativeAlternate bindAlternate monadAlternate extendAlternate comonadAlternate showAlternate semigroupAlternate monoidAlternate;}