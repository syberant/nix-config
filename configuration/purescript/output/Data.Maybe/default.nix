
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Alternative" = import ../Control.Alternative;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Category" = import ../Control.Category;
      "Control.Extend" = import ../Control.Extend;
      "Control.Monad" = import ../Control.Monad;
      "Control.MonadZero" = import ../Control.MonadZero;
      "Control.Plus" = import ../Control.Plus;
      "Data.Bounded" = import ../Data.Bounded;
      "Data.Eq" = import ../Data.Eq;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.Invariant" = import ../Data.Functor.Invariant;
      "Data.Generic.Rep" = import ../Data.Generic.Rep;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Data.Unit" = import ../Data.Unit;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  identity = module."Control.Category".identity module."Control.Category".categoryFn;
  Nothing = {__tag = "Nothing";};
  Just = value0: 
    { __tag = "Just";
      __field0 = value0;
    };
  showMaybe = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              if v.__tag == "Just"
                then 
                  let
                    x = v.__field0;
                  in
                    append "(Just " (append (show x) ")")
                else __fail;
            __pattern1 = __fail: if v.__tag == "Nothing" then "Nothing" else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/maybe/master/src/Data/Maybe.purs at 216:1 - 218:28";
          in
            __pattern0 (__pattern1 __patternFail);
      };
  semigroupMaybe = dictSemigroup: 
    let
      append1 = module."Data.Semigroup".append dictSemigroup;
    in
      
      { append = v: v1: 
          let
            __pattern0 = __fail: 
              if v.__tag == "Nothing"
                then 
                  let
                    y = v1;
                  in
                    y
                else __fail;
            __pattern1 = __fail: 
              if v1.__tag == "Nothing"
                then 
                  let
                    x = v;
                  in
                    x
                else __fail;
            __pattern2 = __fail: 
              if v.__tag == "Just" && v1.__tag == "Just"
                then 
                  let
                    x = v.__field0;
                    y = v1.__field0;
                  in
                    Just (append1 x y)
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/maybe/master/src/Data/Maybe.purs at 185:1 - 188:43";
          in
            __pattern0 (__pattern1 (__pattern2 __patternFail));
      };
  optional = dictAlt: 
    let
      alt = module."Control.Alt".alt dictAlt;
      map1 = module."Data.Functor".map (dictAlt."Functor0" module."Prim".undefined);
    in
      dictApplicative: 
      let
        pure = module."Control.Applicative".pure dictApplicative;
      in
        a: alt (map1 Just a) (pure Nothing);
  monoidMaybe = dictSemigroup: 
    let
      semigroupMaybe1 = semigroupMaybe dictSemigroup;
    in
      
      { mempty = Nothing;
        "Semigroup0" = _: semigroupMaybe1;
      };
  maybe' = v: v1: v2: 
    let
      __pattern0 = __fail: 
        if v2.__tag == "Nothing"
          then 
            let
              g = v;
            in
              g module."Data.Unit".unit
          else __fail;
      __pattern1 = __fail: 
        if v2.__tag == "Just"
          then 
            let
              f = v1;
              a = v2.__field0;
            in
              f a
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/maybe/master/src/Data/Maybe.purs at 243:1 - 243:62";
    in
      __pattern0 (__pattern1 __patternFail);
  maybe = v: v1: v2: 
    let
      __pattern0 = __fail: 
        if v2.__tag == "Nothing"
          then 
            let
              b = v;
            in
              b
          else __fail;
      __pattern1 = __fail: 
        if v2.__tag == "Just"
          then 
            let
              f = v1;
              a = v2.__field0;
            in
              f a
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/maybe/master/src/Data/Maybe.purs at 230:1 - 230:51";
    in
      __pattern0 (__pattern1 __patternFail);
  isNothing = maybe true (module."Data.Function".const false);
  isJust = maybe false (module."Data.Function".const true);
  genericMaybe = 
    { to = x: 
        let
          __pattern0 = __fail: if x.__tag == "Inl" then Nothing else __fail;
          __pattern1 = __fail: 
            if x.__tag == "Inr"
              then 
                let
                  arg = x.__field0;
                in
                  Just arg
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/maybe/master/src/Data/Maybe.purs at 220:1 - 220:52";
        in
          __pattern0 (__pattern1 __patternFail);
      from = x: 
        let
          __pattern0 = __fail: if x.__tag == "Nothing" then module."Data.Generic.Rep".Inl module."Data.Generic.Rep".NoArguments else __fail;
          __pattern1 = __fail: 
            if x.__tag == "Just"
              then 
                let
                  arg = x.__field0;
                in
                  module."Data.Generic.Rep".Inr arg
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/maybe/master/src/Data/Maybe.purs at 220:1 - 220:52";
        in
          __pattern0 (__pattern1 __patternFail);
    };
  functorMaybe = 
    { map = v: v1: 
        let
          __pattern0 = __fail: 
            if v1.__tag == "Just"
              then 
                let
                  fn = v;
                  x = v1.__field0;
                in
                  Just (fn x)
              else __fail;
          __pattern1 = __fail: Nothing;
          __patternFail = builtins.throw "Pattern match failure in .spago/maybe/master/src/Data/Maybe.purs at 33:1 - 35:28";
        in
          __pattern0 (__pattern1 __patternFail);
    };
  map = module."Data.Functor".map functorMaybe;
  invariantMaybe = {imap = module."Data.Functor.Invariant".imapF functorMaybe;};
  fromMaybe' = a: maybe' a identity;
  fromMaybe = a: maybe a identity;
  fromJust = _: v: 
    ( _: 
      let
        __pattern0 = __fail: 
          if v.__tag == "Just"
            then 
              let
                x = v.__field0;
              in
                x
            else __fail;
        __patternFail = builtins.throw "Pattern match failure in .spago/maybe/master/src/Data/Maybe.purs at 281:1 - 281:46";
      in
        __pattern0 __patternFail
    ) module."Prim".undefined;
  extendMaybe = 
    { extend = v: v1: 
        let
          __pattern0 = __fail: if v1.__tag == "Nothing" then Nothing else __fail;
          __pattern1 = __fail: 
            let
              f = v;
              x = v1;
            in
              Just (f x);
          __patternFail = builtins.throw "Pattern match failure in .spago/maybe/master/src/Data/Maybe.purs at 167:1 - 169:33";
        in
          __pattern0 (__pattern1 __patternFail);
      "Functor0" = _: functorMaybe;
    };
  eqMaybe = dictEq: 
    let
      eq = module."Data.Eq".eq dictEq;
    in
      
      { eq = x: y: 
          let
            __pattern0 = __fail: if x.__tag == "Nothing" && y.__tag == "Nothing" then true else __fail;
            __pattern1 = __fail: 
              if x.__tag == "Just" && y.__tag == "Just"
                then 
                  let
                    l = x.__field0;
                    r = y.__field0;
                  in
                    eq l r
                else __fail;
            __pattern2 = __fail: false;
            __patternFail = builtins.throw "Pattern match failure in .spago/maybe/master/src/Data/Maybe.purs at 0:0 - 0:0";
          in
            __pattern0 (__pattern1 (__pattern2 __patternFail));
      };
  ordMaybe = dictOrd: 
    let
      compare = module."Data.Ord".compare dictOrd;
      eqMaybe1 = eqMaybe (dictOrd."Eq0" module."Prim".undefined);
    in
      
      { compare = x: y: 
          let
            __pattern0 = __fail: if x.__tag == "Nothing" && y.__tag == "Nothing" then module."Data.Ordering".EQ else __fail;
            __pattern1 = __fail: if x.__tag == "Nothing" then module."Data.Ordering".LT else __fail;
            __pattern2 = __fail: if y.__tag == "Nothing" then module."Data.Ordering".GT else __fail;
            __pattern3 = __fail: 
              if x.__tag == "Just" && y.__tag == "Just"
                then 
                  let
                    l = x.__field0;
                    r = y.__field0;
                  in
                    compare l r
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/maybe/master/src/Data/Maybe.purs at 0:0 - 0:0";
          in
            __pattern0 (__pattern1 (__pattern2 (__pattern3 __patternFail)));
        "Eq0" = _: eqMaybe1;
      };
  eq1Maybe = {eq1 = dictEq: module."Data.Eq".eq (eqMaybe dictEq);};
  ord1Maybe = 
    { compare1 = dictOrd: module."Data.Ord".compare (ordMaybe dictOrd);
      "Eq10" = _: eq1Maybe;
    };
  boundedMaybe = dictBounded: 
    let
      ordMaybe1 = ordMaybe (dictBounded."Ord0" module."Prim".undefined);
    in
      
      { top = Just (module."Data.Bounded".top dictBounded);
        bottom = Nothing;
        "Ord0" = _: ordMaybe1;
      };
  applyMaybe = 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Just"
              then 
                let
                  fn = v.__field0;
                  x = v1;
                in
                  map fn x
              else __fail;
          __pattern1 = __fail: if v.__tag == "Nothing" then Nothing else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/maybe/master/src/Data/Maybe.purs at 68:1 - 70:30";
        in
          __pattern0 (__pattern1 __patternFail);
      "Functor0" = _: functorMaybe;
    };
  bindMaybe = 
    { bind = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Just"
              then 
                let
                  x = v.__field0;
                  k = v1;
                in
                  k x
              else __fail;
          __pattern1 = __fail: if v.__tag == "Nothing" then Nothing else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/maybe/master/src/Data/Maybe.purs at 126:1 - 128:28";
        in
          __pattern0 (__pattern1 __patternFail);
      "Apply0" = _: applyMaybe;
    };
  applicativeMaybe = 
    { pure = Just;
      "Apply0" = _: applyMaybe;
    };
  monadMaybe = 
    { "Applicative0" = _: applicativeMaybe;
      "Bind1" = _: bindMaybe;
    };
  altMaybe = 
    { alt = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Nothing"
              then 
                let
                  r = v1;
                in
                  r
              else __fail;
          __pattern1 = __fail: 
            let
              l = v;
            in
              l;
          __patternFail = builtins.throw "Pattern match failure in .spago/maybe/master/src/Data/Maybe.purs at 103:1 - 105:20";
        in
          __pattern0 (__pattern1 __patternFail);
      "Functor0" = _: functorMaybe;
    };
  plusMaybe = 
    { empty = Nothing;
      "Alt0" = _: altMaybe;
    };
  alternativeMaybe = 
    { "Applicative0" = _: applicativeMaybe;
      "Plus1" = _: plusMaybe;
    };
  monadZeroMaybe = 
    { "Monad0" = _: monadMaybe;
      "Alternative1" = _: alternativeMaybe;
      "MonadZeroIsDeprecated2" = _: module."Prim".undefined;
    };
in
  {inherit Nothing Just maybe maybe' fromMaybe fromMaybe' isJust isNothing fromJust optional functorMaybe applyMaybe applicativeMaybe altMaybe plusMaybe alternativeMaybe bindMaybe monadMaybe monadZeroMaybe extendMaybe invariantMaybe semigroupMaybe monoidMaybe eqMaybe eq1Maybe ordMaybe ord1Maybe boundedMaybe showMaybe genericMaybe;}