
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Biapplicative" = import ../Control.Biapplicative;
      "Control.Biapply" = import ../Control.Biapply;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor" = import ../Data.Functor;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  Join = x: x;
  showJoin = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                x = v;
              in
                append "(Join " (append (show x) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/bifunctors/master/src/Data/Bifunctor/Join.purs at 21:1 - 22:44";
          in
            __pattern0 __patternFail;
      };
  ordJoin = dictOrd: dictOrd;
  newtypeJoin = {"Coercible0" = _: module."Prim".undefined;};
  eqJoin = dictEq: dictEq;
  bifunctorJoin = dictBifunctor: 
    let
      bimap = module."Data.Bifunctor".bimap dictBifunctor;
    in
      
      { map = f: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                a = v;
              in
                bimap f1 f1 a;
            __patternFail = builtins.throw "Pattern match failure in .spago/bifunctors/master/src/Data/Bifunctor/Join.purs at 24:1 - 25:38";
          in
            __pattern0 __patternFail;
      };
  biapplyJoin = dictBiapply: 
    let
      biapply = module."Control.Biapply".biapply dictBiapply;
      bifunctorJoin1 = bifunctorJoin (dictBiapply."Bifunctor0" module."Prim".undefined);
    in
      
      { apply = v: v1: 
          let
            __pattern0 = __fail: 
              let
                f = v;
                a = v1;
              in
                biapply f a;
            __patternFail = builtins.throw "Pattern match failure in .spago/bifunctors/master/src/Data/Bifunctor/Join.purs at 27:1 - 28:45";
          in
            __pattern0 __patternFail;
        "Functor0" = _: bifunctorJoin1;
      };
  biapplicativeJoin = dictBiapplicative: 
    let
      bipure = module."Control.Biapplicative".bipure dictBiapplicative;
      biapplyJoin1 = biapplyJoin (dictBiapplicative."Biapply0" module."Prim".undefined);
    in
      
      { pure = a: bipure a a;
        "Apply0" = _: biapplyJoin1;
      };
in
  {inherit Join newtypeJoin eqJoin ordJoin showJoin bifunctorJoin biapplyJoin biapplicativeJoin;}