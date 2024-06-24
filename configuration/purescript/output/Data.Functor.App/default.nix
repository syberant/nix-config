
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Alternative" = import ../Control.Alternative;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Comonad" = import ../Control.Comonad;
      "Control.Extend" = import ../Control.Extend;
      "Control.Lazy" = import ../Control.Lazy;
      "Control.Monad" = import ../Control.Monad;
      "Control.MonadPlus" = import ../Control.MonadPlus;
      "Control.MonadZero" = import ../Control.MonadZero;
      "Control.Plus" = import ../Control.Plus;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor" = import ../Data.Functor;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
      "Unsafe.Coerce" = import ../Unsafe.Coerce;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  App = x: x;
  showApp = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                fa = v;
              in
                append "(App " (append (show fa) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/App.purs at 36:1 - 37:44";
          in
            __pattern0 __patternFail;
      };
  semigroupApp = dictApply: 
    let
      lift2 = module."Control.Apply".lift2 dictApply;
    in
      dictSemigroup: 
      let
        append1 = module."Data.Semigroup".append dictSemigroup;
      in
        
        { append = v: v1: 
            let
              __pattern0 = __fail: 
                let
                  fa1 = v;
                  fa2 = v1;
                in
                  lift2 append1 fa1 fa2;
              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/App.purs at 39:1 - 40:58";
            in
              __pattern0 __patternFail;
        };
  plusApp = dictPlus: dictPlus;
  newtypeApp = {"Coercible0" = _: module."Prim".undefined;};
  monoidApp = dictApplicative: 
    let
      pure = module."Control.Applicative".pure dictApplicative;
      semigroupApp1 = semigroupApp (dictApplicative."Apply0" module."Prim".undefined);
    in
      dictMonoid: 
      let
        semigroupApp2 = semigroupApp1 (dictMonoid."Semigroup0" module."Prim".undefined);
      in
        
        { mempty = pure (module."Data.Monoid".mempty dictMonoid);
          "Semigroup0" = _: semigroupApp2;
        };
  monadPlusApp = dictMonadPlus: dictMonadPlus;
  monadApp = dictMonad: dictMonad;
  lazyApp = dictLazy: dictLazy;
  hoistLowerApp = module."Unsafe.Coerce".unsafeCoerce;
  hoistLiftApp = module."Unsafe.Coerce".unsafeCoerce;
  hoistApp = f: v: 
    let
      __pattern0 = __fail: 
        let
          f1 = f;
          fa = v;
        in
          f1 fa;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/App.purs at 21:1 - 21:51";
    in
      __pattern0 __patternFail;
  functorApp = dictFunctor: dictFunctor;
  extendApp = dictExtend: dictExtend;
  eqApp = dictEq1: 
    let
      eq1 = module."Data.Eq".eq1 dictEq1;
    in
      dictEq: 
      let
        eq11 = eq1 dictEq;
      in
        
        { eq = x: y: 
            let
              __pattern0 = __fail: 
                let
                  l = x;
                  r = y;
                in
                  eq11 l r;
              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/App.purs at 0:0 - 0:0";
            in
              __pattern0 __patternFail;
        };
  ordApp = dictOrd1: 
    let
      compare1 = module."Data.Ord".compare1 dictOrd1;
      eqApp1 = eqApp (dictOrd1."Eq10" module."Prim".undefined);
    in
      dictOrd: 
      let
        compare11 = compare1 dictOrd;
        eqApp2 = eqApp1 (dictOrd."Eq0" module."Prim".undefined);
      in
        
        { compare = x: y: 
            let
              __pattern0 = __fail: 
                let
                  l = x;
                  r = y;
                in
                  compare11 l r;
              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/App.purs at 0:0 - 0:0";
            in
              __pattern0 __patternFail;
          "Eq0" = _: eqApp2;
        };
  eq1App = dictEq1: 
    let
      eqApp1 = eqApp dictEq1;
    in
      {eq1 = dictEq: module."Data.Eq".eq (eqApp1 dictEq);};
  ord1App = dictOrd1: 
    let
      ordApp1 = ordApp dictOrd1;
      eq1App1 = eq1App (dictOrd1."Eq10" module."Prim".undefined);
    in
      
      { compare1 = dictOrd: module."Data.Ord".compare (ordApp1 dictOrd);
        "Eq10" = _: eq1App1;
      };
  comonadApp = dictComonad: dictComonad;
  bindApp = dictBind: dictBind;
  applyApp = dictApply: dictApply;
  applicativeApp = dictApplicative: dictApplicative;
  alternativeApp = dictAlternative: dictAlternative;
  monadZeroApp = dictMonadZero: 
    let
      monadApp1 = monadApp (dictMonadZero."Monad0" module."Prim".undefined);
      alternativeApp1 = alternativeApp (dictMonadZero."Alternative1" module."Prim".undefined);
    in
      
      { "Monad0" = _: monadApp1;
        "Alternative1" = _: alternativeApp1;
        "MonadZeroIsDeprecated2" = _: module."Prim".undefined;
      };
  altApp = dictAlt: dictAlt;
in
  {inherit App hoistApp hoistLiftApp hoistLowerApp newtypeApp eqApp eq1App ordApp ord1App showApp semigroupApp monoidApp monadZeroApp functorApp applyApp applicativeApp bindApp monadApp altApp plusApp alternativeApp monadPlusApp lazyApp extendApp comonadApp;}