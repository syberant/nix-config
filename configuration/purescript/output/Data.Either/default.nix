
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Extend" = import ../Control.Extend;
      "Control.Monad" = import ../Control.Monad;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Bounded" = import ../Data.Bounded;
      "Data.Eq" = import ../Data.Eq;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.Invariant" = import ../Data.Functor.Invariant;
      "Data.Generic.Rep" = import ../Data.Generic.Rep;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Data.Unit" = import ../Data.Unit;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  Left = value0: 
    { __tag = "Left";
      __field0 = value0;
    };
  Right = value0: 
    { __tag = "Right";
      __field0 = value0;
    };
  showEither = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      dictShow1: 
      let
        show1 = module."Data.Show".show dictShow1;
      in
        
        { show = v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Left"
                  then 
                    let
                      x = v.__field0;
                    in
                      append "(Left " (append (show x) ")")
                  else __fail;
              __pattern1 = __fail: 
                if v.__tag == "Right"
                  then 
                    let
                      y = v.__field0;
                    in
                      append "(Right " (append (show1 y) ")")
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 173:1 - 175:46";
            in
              __pattern0 (__pattern1 __patternFail);
        };
  note' = f: module."Data.Maybe".maybe' (compose Left f) Right;
  note = a: module."Data.Maybe".maybe (Left a) Right;
  genericEither = 
    { to = x: 
        let
          __pattern0 = __fail: 
            if x.__tag == "Inl"
              then 
                let
                  arg = x.__field0;
                in
                  Left arg
              else __fail;
          __pattern1 = __fail: 
            if x.__tag == "Inr"
              then 
                let
                  arg = x.__field0;
                in
                  Right arg
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 33:1 - 33:56";
        in
          __pattern0 (__pattern1 __patternFail);
      from = x: 
        let
          __pattern0 = __fail: 
            if x.__tag == "Left"
              then 
                let
                  arg = x.__field0;
                in
                  module."Data.Generic.Rep".Inl arg
              else __fail;
          __pattern1 = __fail: 
            if x.__tag == "Right"
              then 
                let
                  arg = x.__field0;
                in
                  module."Data.Generic.Rep".Inr arg
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 33:1 - 33:56";
        in
          __pattern0 (__pattern1 __patternFail);
    };
  functorEither = 
    { map = f: m: 
        let
          __pattern0 = __fail: 
            if m.__tag == "Left"
              then 
                let
                  v = m.__field0;
                in
                  Left v
              else __fail;
          __pattern1 = __fail: 
            if m.__tag == "Right"
              then 
                let
                  v = m.__field0;
                in
                  Right (f v)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 0:0 - 0:0";
        in
          __pattern0 (__pattern1 __patternFail);
    };
  map = module."Data.Functor".map functorEither;
  invariantEither = {imap = module."Data.Functor.Invariant".imapF functorEither;};
  fromRight' = v: v1: 
    let
      __pattern0 = __fail: 
        if v1.__tag == "Right"
          then 
            let
              b = v1.__field0;
            in
              b
          else __fail;
      __pattern1 = __fail: 
        let
          default = v;
        in
          default module."Data.Unit".unit;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 252:1 - 252:57";
    in
      __pattern0 (__pattern1 __patternFail);
  fromRight = v: v1: 
    let
      __pattern0 = __fail: 
        if v1.__tag == "Right"
          then 
            let
              b = v1.__field0;
            in
              b
          else __fail;
      __pattern1 = __fail: 
        let
          default = v;
        in
          default;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 243:1 - 243:46";
    in
      __pattern0 (__pattern1 __patternFail);
  fromLeft' = v: v1: 
    let
      __pattern0 = __fail: 
        if v1.__tag == "Left"
          then 
            let
              a = v1.__field0;
            in
              a
          else __fail;
      __pattern1 = __fail: 
        let
          default = v;
        in
          default module."Data.Unit".unit;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 236:1 - 236:56";
    in
      __pattern0 (__pattern1 __patternFail);
  fromLeft = v: v1: 
    let
      __pattern0 = __fail: 
        if v1.__tag == "Left"
          then 
            let
              a = v1.__field0;
            in
              a
          else __fail;
      __pattern1 = __fail: 
        let
          default = v;
        in
          default;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 227:1 - 227:45";
    in
      __pattern0 (__pattern1 __patternFail);
  extendEither = 
    { extend = v: v1: 
        let
          __pattern0 = __fail: 
            if v1.__tag == "Left"
              then 
                let
                  y = v1.__field0;
                in
                  Left y
              else __fail;
          __pattern1 = __fail: 
            let
              f = v;
              x = v1;
            in
              Right (f x);
          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 166:1 - 168:35";
        in
          __pattern0 (__pattern1 __patternFail);
      "Functor0" = _: functorEither;
    };
  eqEither = dictEq: 
    let
      eq = module."Data.Eq".eq dictEq;
    in
      dictEq1: 
      let
        eq1 = module."Data.Eq".eq dictEq1;
      in
        
        { eq = x: y: 
            let
              __pattern0 = __fail: 
                if x.__tag == "Left" && y.__tag == "Left"
                  then 
                    let
                      l = x.__field0;
                      r = y.__field0;
                    in
                      eq l r
                  else __fail;
              __pattern1 = __fail: 
                if x.__tag == "Right" && y.__tag == "Right"
                  then 
                    let
                      l = x.__field0;
                      r = y.__field0;
                    in
                      eq1 l r
                  else __fail;
              __pattern2 = __fail: false;
              __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 0:0 - 0:0";
            in
              __pattern0 (__pattern1 (__pattern2 __patternFail));
        };
  ordEither = dictOrd: 
    let
      compare = module."Data.Ord".compare dictOrd;
      eqEither1 = eqEither (dictOrd."Eq0" module."Prim".undefined);
    in
      dictOrd1: 
      let
        compare1 = module."Data.Ord".compare dictOrd1;
        eqEither2 = eqEither1 (dictOrd1."Eq0" module."Prim".undefined);
      in
        
        { compare = x: y: 
            let
              __pattern0 = __fail: 
                if x.__tag == "Left" && y.__tag == "Left"
                  then 
                    let
                      l = x.__field0;
                      r = y.__field0;
                    in
                      compare l r
                  else __fail;
              __pattern1 = __fail: if x.__tag == "Left" then module."Data.Ordering".LT else __fail;
              __pattern2 = __fail: if y.__tag == "Left" then module."Data.Ordering".GT else __fail;
              __pattern3 = __fail: 
                if x.__tag == "Right" && y.__tag == "Right"
                  then 
                    let
                      l = x.__field0;
                      r = y.__field0;
                    in
                      compare1 l r
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 0:0 - 0:0";
            in
              __pattern0 (__pattern1 (__pattern2 (__pattern3 __patternFail)));
          "Eq0" = _: eqEither2;
        };
  eq1Either = dictEq: 
    let
      eqEither1 = eqEither dictEq;
    in
      {eq1 = dictEq1: module."Data.Eq".eq (eqEither1 dictEq1);};
  ord1Either = dictOrd: 
    let
      ordEither1 = ordEither dictOrd;
      eq1Either1 = eq1Either (dictOrd."Eq0" module."Prim".undefined);
    in
      
      { compare1 = dictOrd1: module."Data.Ord".compare (ordEither1 dictOrd1);
        "Eq10" = _: eq1Either1;
      };
  either = v: v1: v2: 
    let
      __pattern0 = __fail: 
        if v2.__tag == "Left"
          then 
            let
              f = v;
              a = v2.__field0;
            in
              f a
          else __fail;
      __pattern1 = __fail: 
        if v2.__tag == "Right"
          then 
            let
              g = v1;
              b = v2.__field0;
            in
              g b
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 208:1 - 208:64";
    in
      __pattern0 (__pattern1 __patternFail);
  hush = either (module."Data.Function".const module."Data.Maybe".Nothing) module."Data.Maybe".Just;
  isLeft = either (module."Data.Function".const true) (module."Data.Function".const false);
  isRight = either (module."Data.Function".const false) (module."Data.Function".const true);
  choose = dictAlt: 
    let
      alt = module."Control.Alt".alt dictAlt;
      map1 = module."Data.Functor".map (dictAlt."Functor0" module."Prim".undefined);
    in
      a: b: alt (map1 Left a) (map1 Right b);
  boundedEither = dictBounded: 
    let
      bottom = module."Data.Bounded".bottom dictBounded;
      ordEither1 = ordEither (dictBounded."Ord0" module."Prim".undefined);
    in
      dictBounded1: 
      let
        ordEither2 = ordEither1 (dictBounded1."Ord0" module."Prim".undefined);
      in
        
        { top = Right (module."Data.Bounded".top dictBounded1);
          bottom = Left bottom;
          "Ord0" = _: ordEither2;
        };
  applyEither = 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Left"
              then 
                let
                  e = v.__field0;
                in
                  Left e
              else __fail;
          __pattern1 = __fail: 
            if v.__tag == "Right"
              then 
                let
                  f = v.__field0;
                  r = v1;
                in
                  map f r
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 70:1 - 72:30";
        in
          __pattern0 (__pattern1 __patternFail);
      "Functor0" = _: functorEither;
    };
  apply = module."Control.Apply".apply applyEither;
  bindEither = 
    { bind = either (e: v: Left e) (a: f: f a);
      "Apply0" = _: applyEither;
    };
  semigroupEither = dictSemigroup: 
    let
      append1 = module."Data.Semigroup".append dictSemigroup;
    in
      {append = x: y: apply (map append1 x) y;};
  applicativeEither = 
    { pure = Right;
      "Apply0" = _: applyEither;
    };
  monadEither = 
    { "Applicative0" = _: applicativeEither;
      "Bind1" = _: bindEither;
    };
  altEither = 
    { alt = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Left"
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
          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 105:1 - 107:21";
        in
          __pattern0 (__pattern1 __patternFail);
      "Functor0" = _: functorEither;
    };
in
  {inherit Left Right either choose isLeft isRight fromLeft fromLeft' fromRight fromRight' note note' hush functorEither genericEither invariantEither applyEither applicativeEither altEither bindEither monadEither extendEither showEither eqEither eq1Either ordEither ord1Either boundedEither semigroupEither;}