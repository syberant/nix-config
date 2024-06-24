
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Alternative" = import ../Control.Alternative;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Category" = import ../Control.Category;
      "Control.Monad" = import ../Control.Monad;
      "Control.MonadPlus" = import ../Control.MonadPlus;
      "Control.MonadZero" = import ../Control.MonadZero;
      "Control.Plus" = import ../Control.Plus;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Distributive" = import ../Data.Distributive;
      "Data.Either" = import ../Data.Either;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.Invariant" = import ../Data.Functor.Invariant;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Profunctor" = import ../Data.Profunctor;
      "Data.Profunctor.Choice" = import ../Data.Profunctor.Choice;
      "Data.Profunctor.Closed" = import ../Data.Profunctor.Closed;
      "Data.Profunctor.Strong" = import ../Data.Profunctor.Strong;
      "Data.Tuple" = import ../Data.Tuple;
      "Prelude" = import ../Prelude;
    };
  composeFlipped = module."Control.Semigroupoid".composeFlipped module."Control.Semigroupoid".semigroupoidFn;
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  Star = x: x;
  semigroupoidStar = dictBind: 
    let
      bind = module."Control.Bind".bind dictBind;
    in
      
      { compose = v: v1: 
          let
            __pattern0 = __fail: 
              let
                f = v;
                g = v1;
              in
                x: bind (g x) f;
            __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 29:1 - 30:51";
          in
            __pattern0 __patternFail;
      };
  profunctorStar = dictFunctor: 
    let
      map = module."Data.Functor".map dictFunctor;
    in
      
      { dimap = f: g: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                g1 = g;
                ft = v;
              in
                composeFlipped f1 (composeFlipped ft (map g1));
            __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 68:1 - 69:50";
          in
            __pattern0 __patternFail;
      };
  strongStar = dictFunctor: 
    let
      map = module."Data.Functor".map dictFunctor;
      profunctorStar1 = profunctorStar dictFunctor;
    in
      
      { first = v: 
          let
            __pattern0 = __fail: 
              let
                f = v;
              in
                v1: 
                let
                  __pattern0 = __fail: 
                    if v1.__tag == "Tuple"
                      then 
                        let
                          s = v1.__field0;
                          x = v1.__field1;
                        in
                          map (v2: module."Data.Tuple".Tuple v2 x) (f s)
                      else __fail;
                  __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 72:26 - 72:65";
                in
                  __pattern0 __patternFail;
            __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 71:1 - 73:61";
          in
            __pattern0 __patternFail;
        second = v: 
          let
            __pattern0 = __fail: 
              let
                f = v;
              in
                v1: 
                let
                  __pattern0 = __fail: 
                    if v1.__tag == "Tuple"
                      then 
                        let
                          x = v1.__field0;
                          s = v1.__field1;
                        in
                          map (module."Data.Tuple".Tuple x) (f s)
                      else __fail;
                  __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 73:26 - 73:61";
                in
                  __pattern0 __patternFail;
            __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 71:1 - 73:61";
          in
            __pattern0 __patternFail;
        "Profunctor0" = _: profunctorStar1;
      };
  newtypeStar = {"Coercible0" = _: module."Prim".undefined;};
  invariantStar = dictInvariant: 
    let
      imap = module."Data.Functor.Invariant".imap dictInvariant;
    in
      
      { imap = f: g: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                g1 = g;
                h = v;
              in
                compose (imap f1 g1) h;
            __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 38:1 - 39:44";
          in
            __pattern0 __patternFail;
      };
  hoistStar = f: v: 
    let
      __pattern0 = __fail: 
        let
          f1 = f;
          g = v;
        in
          compose f1 g;
      __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 82:1 - 82:66";
    in
      __pattern0 __patternFail;
  functorStar = dictFunctor: 
    let
      map = module."Data.Functor".map dictFunctor;
    in
      
      { map = f: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                g = v;
              in
                compose (map f1) g;
            __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 35:1 - 36:38";
          in
            __pattern0 __patternFail;
      };
  distributiveStar = dictDistributive: 
    let
      collect = module."Data.Distributive".collect dictDistributive;
      functorStar1 = functorStar (dictDistributive."Functor0" module."Prim".undefined);
    in
      
      { distribute = dictFunctor: 
          let
            collect1 = collect dictFunctor;
          in
            f: a: collect1 
            ( v: 
              let
                __pattern0 = __fail: 
                  let
                    g = v;
                  in
                    g a;
                __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 65:38 - 65:54";
              in
                __pattern0 __patternFail
            ) f;
        collect = dictFunctor: 
          let
            map = module."Data.Functor".map dictFunctor;
          in
            f: compose (module."Data.Distributive".distribute (distributiveStar dictDistributive) dictFunctor) (map f);
        "Functor0" = _: functorStar1;
      };
  closedStar = dictDistributive: 
    let
      distribute = module."Data.Distributive".distribute dictDistributive module."Data.Functor".functorFn;
      profunctorStar1 = profunctorStar (dictDistributive."Functor0" module."Prim".undefined);
    in
      
      { closed = v: 
          let
            __pattern0 = __fail: 
              let
                f = v;
              in
                g: distribute (compose f g);
            __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 79:1 - 80:52";
          in
            __pattern0 __patternFail;
        "Profunctor0" = _: profunctorStar1;
      };
  choiceStar = dictApplicative: 
    let
      Functor0 = (dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined;
      map = module."Data.Functor".map Functor0;
      pure = module."Control.Applicative".pure dictApplicative;
      profunctorStar1 = profunctorStar Functor0;
    in
      
      { left = v: 
          let
            __pattern0 = __fail: 
              let
                f = v;
              in
                module."Data.Either".either (compose (map module."Data.Either".Left) f) (compose pure module."Data.Either".Right);
            __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 75:1 - 77:67";
          in
            __pattern0 __patternFail;
        right = v: 
          let
            __pattern0 = __fail: 
              let
                f = v;
              in
                module."Data.Either".either (compose pure module."Data.Either".Left) (compose (map module."Data.Either".Right) f);
            __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 75:1 - 77:67";
          in
            __pattern0 __patternFail;
        "Profunctor0" = _: profunctorStar1;
      };
  categoryStar = dictMonad: 
    let
      semigroupoidStar1 = semigroupoidStar (dictMonad."Bind1" module."Prim".undefined);
    in
      
      { identity = module."Control.Applicative".pure (dictMonad."Applicative0" module."Prim".undefined);
        "Semigroupoid0" = _: semigroupoidStar1;
      };
  applyStar = dictApply: 
    let
      apply = module."Control.Apply".apply dictApply;
      functorStar1 = functorStar (dictApply."Functor0" module."Prim".undefined);
    in
      
      { apply = v: v1: 
          let
            __pattern0 = __fail: 
              let
                f = v;
                g = v1;
              in
                a: apply (f a) (g a);
            __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 41:1 - 42:51";
          in
            __pattern0 __patternFail;
        "Functor0" = _: functorStar1;
      };
  bindStar = dictBind: 
    let
      bind = module."Control.Bind".bind dictBind;
      applyStar1 = applyStar (dictBind."Apply0" module."Prim".undefined);
    in
      
      { bind = v: f: 
          let
            __pattern0 = __fail: 
              let
                m = v;
                f1 = f;
              in
                x: bind (m x) 
                ( a: 
                  let
                    v1 = f1 a;
                  in
                    
                    let
                      __pattern0 = __fail: 
                        let
                          g = v1;
                        in
                          g x;
                      __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 48:46 - 48:71";
                    in
                      __pattern0 __patternFail
                );
            __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 47:1 - 48:71";
          in
            __pattern0 __patternFail;
        "Apply0" = _: applyStar1;
      };
  applicativeStar = dictApplicative: 
    let
      pure = module."Control.Applicative".pure dictApplicative;
      applyStar1 = applyStar (dictApplicative."Apply0" module."Prim".undefined);
    in
      
      { pure = a: v: pure a;
        "Apply0" = _: applyStar1;
      };
  monadStar = dictMonad: 
    let
      applicativeStar1 = applicativeStar (dictMonad."Applicative0" module."Prim".undefined);
      bindStar1 = bindStar (dictMonad."Bind1" module."Prim".undefined);
    in
      
      { "Applicative0" = _: applicativeStar1;
        "Bind1" = _: bindStar1;
      };
  altStar = dictAlt: 
    let
      alt = module."Control.Alt".alt dictAlt;
      functorStar1 = functorStar (dictAlt."Functor0" module."Prim".undefined);
    in
      
      { alt = v: v1: 
          let
            __pattern0 = __fail: 
              let
                f = v;
                g = v1;
              in
                a: alt (f a) (g a);
            __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 52:1 - 53:49";
          in
            __pattern0 __patternFail;
        "Functor0" = _: functorStar1;
      };
  plusStar = dictPlus: 
    let
      empty = module."Control.Plus".empty dictPlus;
      altStar1 = altStar (dictPlus."Alt0" module."Prim".undefined);
    in
      
      { empty = v: empty;
        "Alt0" = _: altStar1;
      };
  alternativeStar = dictAlternative: 
    let
      applicativeStar1 = applicativeStar (dictAlternative."Applicative0" module."Prim".undefined);
      plusStar1 = plusStar (dictAlternative."Plus1" module."Prim".undefined);
    in
      
      { "Applicative0" = _: applicativeStar1;
        "Plus1" = _: plusStar1;
      };
  monadPlusStar = dictMonadPlus: 
    let
      monadStar1 = monadStar (dictMonadPlus."Monad0" module."Prim".undefined);
      alternativeStar1 = alternativeStar (dictMonadPlus."Alternative1" module."Prim".undefined);
    in
      
      { "Monad0" = _: monadStar1;
        "Alternative1" = _: alternativeStar1;
      };
  monadZeroStar = dictMonadZero: 
    let
      monadStar1 = monadStar (dictMonadZero."Monad0" module."Prim".undefined);
      alternativeStar1 = alternativeStar (dictMonadZero."Alternative1" module."Prim".undefined);
    in
      
      { "Monad0" = _: monadStar1;
        "Alternative1" = _: alternativeStar1;
        "MonadZeroIsDeprecated2" = _: module."Prim".undefined;
      };
in
  {inherit Star hoistStar newtypeStar semigroupoidStar categoryStar functorStar invariantStar applyStar applicativeStar bindStar monadStar altStar plusStar alternativeStar monadZeroStar monadPlusStar distributiveStar profunctorStar strongStar choiceStar closedStar;}