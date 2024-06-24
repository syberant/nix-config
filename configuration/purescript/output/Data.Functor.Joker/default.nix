
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Biapplicative" = import ../Control.Biapplicative;
      "Control.Biapply" = import ../Control.Biapply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Monad" = import ../Control.Monad;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Either" = import ../Data.Either;
      "Data.Eq" = import ../Data.Eq;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Profunctor" = import ../Data.Profunctor;
      "Data.Profunctor.Choice" = import ../Data.Profunctor.Choice;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  composeFlipped = module."Control.Semigroupoid".composeFlipped module."Control.Semigroupoid".semigroupoidFn;
  un = module."Data.Newtype".un module."Prim".undefined;
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  Joker = x: x;
  showJoker = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                x = v;
              in
                append "(Joker " (append (show x) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Joker.purs at 26:1 - 27:46";
          in
            __pattern0 __patternFail;
      };
  profunctorJoker = dictFunctor: 
    let
      map = module."Data.Functor".map dictFunctor;
    in
      
      { dimap = v: g: v1: 
          let
            __pattern0 = __fail: 
              let
                g1 = g;
                a = v1;
              in
                map g1 a;
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Joker.purs at 52:1 - 53:40";
          in
            __pattern0 __patternFail;
      };
  ordJoker = dictOrd: dictOrd;
  newtypeJoker = {"Coercible0" = _: module."Prim".undefined;};
  hoistJoker = f: v: 
    let
      __pattern0 = __fail: 
        let
          f1 = f;
          a = v;
        in
          f1 a;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Joker.purs at 59:1 - 59:69";
    in
      __pattern0 __patternFail;
  functorJoker = dictFunctor: 
    let
      map = module."Data.Functor".map dictFunctor;
    in
      
      { map = f: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                a = v;
              in
                map f1 a;
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Joker.purs at 29:1 - 30:36";
          in
            __pattern0 __patternFail;
      };
  eqJoker = dictEq: dictEq;
  choiceJoker = dictFunctor: 
    let
      map = module."Data.Functor".map dictFunctor;
      profunctorJoker1 = profunctorJoker dictFunctor;
    in
      
      { left = v: 
          let
            __pattern0 = __fail: 
              let
                f = v;
              in
                map module."Data.Either".Left f;
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Joker.purs at 55:1 - 57:40";
          in
            __pattern0 __patternFail;
        right = v: 
          let
            __pattern0 = __fail: 
              let
                f = v;
              in
                map module."Data.Either".Right f;
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Joker.purs at 55:1 - 57:40";
          in
            __pattern0 __patternFail;
        "Profunctor0" = _: profunctorJoker1;
      };
  bifunctorJoker = dictFunctor: 
    let
      map = module."Data.Functor".map dictFunctor;
    in
      
      { bimap = v: g: v1: 
          let
            __pattern0 = __fail: 
              let
                g1 = g;
                a = v1;
              in
                map g1 a;
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Joker.purs at 43:1 - 44:40";
          in
            __pattern0 __patternFail;
      };
  biapplyJoker = dictApply: 
    let
      apply = module."Control.Apply".apply dictApply;
      bifunctorJoker1 = bifunctorJoker (dictApply."Functor0" module."Prim".undefined);
    in
      
      { biapply = v: v1: 
          let
            __pattern0 = __fail: 
              let
                fg = v;
                xy = v1;
              in
                apply fg xy;
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Joker.purs at 46:1 - 47:52";
          in
            __pattern0 __patternFail;
        "Bifunctor0" = _: bifunctorJoker1;
      };
  biapplicativeJoker = dictApplicative: 
    let
      pure = module."Control.Applicative".pure dictApplicative;
      biapplyJoker1 = biapplyJoker (dictApplicative."Apply0" module."Prim".undefined);
    in
      
      { bipure = v: b: pure b;
        "Biapply0" = _: biapplyJoker1;
      };
  applyJoker = dictApply: 
    let
      apply = module."Control.Apply".apply dictApply;
      functorJoker1 = functorJoker (dictApply."Functor0" module."Prim".undefined);
    in
      
      { apply = v: v1: 
          let
            __pattern0 = __fail: 
              let
                f = v;
                g = v1;
              in
                apply f g;
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Joker.purs at 32:1 - 33:48";
          in
            __pattern0 __patternFail;
        "Functor0" = _: functorJoker1;
      };
  bindJoker = dictBind: 
    let
      bind = module."Control.Bind".bind dictBind;
      applyJoker1 = applyJoker (dictBind."Apply0" module."Prim".undefined);
    in
      
      { bind = v: amb: 
          let
            __pattern0 = __fail: 
              let
                ma = v;
                amb1 = amb;
              in
                bind ma (composeFlipped amb1 (un Joker));
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Joker.purs at 38:1 - 39:58";
          in
            __pattern0 __patternFail;
        "Apply0" = _: applyJoker1;
      };
  applicativeJoker = dictApplicative: 
    let
      applyJoker1 = applyJoker (dictApplicative."Apply0" module."Prim".undefined);
    in
      
      { pure = compose Joker (module."Control.Applicative".pure dictApplicative);
        "Apply0" = _: applyJoker1;
      };
  monadJoker = dictMonad: 
    let
      applicativeJoker1 = applicativeJoker (dictMonad."Applicative0" module."Prim".undefined);
      bindJoker1 = bindJoker (dictMonad."Bind1" module."Prim".undefined);
    in
      
      { "Applicative0" = _: applicativeJoker1;
        "Bind1" = _: bindJoker1;
      };
in
  {inherit Joker hoistJoker newtypeJoker eqJoker ordJoker showJoker functorJoker applyJoker applicativeJoker bindJoker monadJoker bifunctorJoker biapplyJoker biapplicativeJoker profunctorJoker choiceJoker;}