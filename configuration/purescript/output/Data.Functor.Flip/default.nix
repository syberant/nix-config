
let
  module = 
    { "Control.Biapplicative" = import ../Control.Biapplicative;
      "Control.Biapply" = import ../Control.Biapply;
      "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Eq" = import ../Data.Eq;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.Contravariant" = import ../Data.Functor.Contravariant;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Profunctor" = import ../Data.Profunctor;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  Flip = x: x;
  showFlip = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                x = v;
              in
                append "(Flip " (append (show x) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Flip.purs at 22:1 - 23:44";
          in
            __pattern0 __patternFail;
      };
  semigroupoidFlip = dictSemigroupoid: 
    let
      compose = module."Control.Semigroupoid".compose dictSemigroupoid;
    in
      
      { compose = v: v1: 
          let
            __pattern0 = __fail: 
              let
                a = v;
                b = v1;
              in
                compose b a;
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Flip.purs at 40:1 - 41:49";
          in
            __pattern0 __patternFail;
      };
  ordFlip = dictOrd: dictOrd;
  newtypeFlip = {"Coercible0" = _: module."Prim".undefined;};
  functorFlip = dictBifunctor: 
    let
      lmap = module."Data.Bifunctor".lmap dictBifunctor;
    in
      
      { map = f: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                a = v;
              in
                lmap f1 a;
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Flip.purs at 25:1 - 26:35";
          in
            __pattern0 __patternFail;
      };
  eqFlip = dictEq: dictEq;
  contravariantFlip = dictProfunctor: 
    let
      lcmap = module."Data.Profunctor".lcmap dictProfunctor;
    in
      
      { cmap = f: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                a = v;
              in
                lcmap f1 a;
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Flip.purs at 37:1 - 38:37";
          in
            __pattern0 __patternFail;
      };
  categoryFlip = dictCategory: 
    let
      semigroupoidFlip1 = semigroupoidFlip (dictCategory."Semigroupoid0" module."Prim".undefined);
    in
      
      { identity = module."Control.Category".identity dictCategory;
        "Semigroupoid0" = _: semigroupoidFlip1;
      };
  bifunctorFlip = dictBifunctor: 
    let
      bimap = module."Data.Bifunctor".bimap dictBifunctor;
    in
      
      { bimap = f: g: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                g1 = g;
                a = v;
              in
                bimap g1 f1 a;
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Flip.purs at 28:1 - 29:42";
          in
            __pattern0 __patternFail;
      };
  biapplyFlip = dictBiapply: 
    let
      biapply = module."Control.Biapply".biapply dictBiapply;
      bifunctorFlip1 = bifunctorFlip (dictBiapply."Bifunctor0" module."Prim".undefined);
    in
      
      { biapply = v: v1: 
          let
            __pattern0 = __fail: 
              let
                fg = v;
                xy = v1;
              in
                biapply fg xy;
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Flip.purs at 31:1 - 32:51";
          in
            __pattern0 __patternFail;
        "Bifunctor0" = _: bifunctorFlip1;
      };
  biapplicativeFlip = dictBiapplicative: 
    let
      bipure = module."Control.Biapplicative".bipure dictBiapplicative;
      biapplyFlip1 = biapplyFlip (dictBiapplicative."Biapply0" module."Prim".undefined);
    in
      
      { bipure = a: b: bipure b a;
        "Biapply0" = _: biapplyFlip1;
      };
in
  {inherit Flip newtypeFlip eqFlip ordFlip showFlip functorFlip bifunctorFlip biapplyFlip biapplicativeFlip contravariantFlip semigroupoidFlip categoryFlip;}