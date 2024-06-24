
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Category" = import ../Control.Category;
      "Control.Comonad" = import ../Control.Comonad;
      "Control.Extend" = import ../Control.Extend;
      "Control.Monad" = import ../Control.Monad;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Distributive" = import ../Data.Distributive;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.Contravariant" = import ../Data.Functor.Contravariant;
      "Data.Functor.Invariant" = import ../Data.Functor.Invariant;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Profunctor" = import ../Data.Profunctor;
      "Data.Profunctor.Closed" = import ../Data.Profunctor.Closed;
      "Data.Profunctor.Strong" = import ../Data.Profunctor.Strong;
      "Data.Tuple" = import ../Data.Tuple;
      "Prelude" = import ../Prelude;
    };
  composeFlipped = module."Control.Semigroupoid".composeFlipped module."Control.Semigroupoid".semigroupoidFn;
  lcmap = module."Data.Profunctor".lcmap module."Data.Profunctor".profunctorFn;
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  Costar = x: x;
  semigroupoidCostar = dictExtend: 
    let
      composeCoKleisliFlipped = module."Control.Extend".composeCoKleisliFlipped dictExtend;
    in
      
      { compose = v: v1: 
          let
            __pattern0 = __fail: 
              let
                f = v;
                g = v1;
              in
                composeCoKleisliFlipped f g;
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 25:1 - 26:51";
          in
            __pattern0 __patternFail;
      };
  profunctorCostar = dictFunctor: 
    let
      map = module."Data.Functor".map dictFunctor;
    in
      
      { dimap = f: g: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                g1 = g;
                h = v;
              in
                composeFlipped (map f1) (composeFlipped h g1);
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 55:1 - 56:52";
          in
            __pattern0 __patternFail;
      };
  strongCostar = dictComonad: 
    let
      Functor0 = (dictComonad."Extend0" module."Prim".undefined)."Functor0" module."Prim".undefined;
      map = module."Data.Functor".map Functor0;
      extract = module."Control.Comonad".extract dictComonad;
      profunctorCostar1 = profunctorCostar Functor0;
    in
      
      { first = v: 
          let
            __pattern0 = __fail: 
              let
                f = v;
              in
                x: module."Data.Tuple".Tuple (f (map module."Data.Tuple".fst x)) (module."Data.Tuple".snd (extract x));
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 58:1 - 60:75";
          in
            __pattern0 __patternFail;
        second = v: 
          let
            __pattern0 = __fail: 
              let
                f = v;
              in
                x: module."Data.Tuple".Tuple (module."Data.Tuple".fst (extract x)) (f (map module."Data.Tuple".snd x));
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 58:1 - 60:75";
          in
            __pattern0 __patternFail;
        "Profunctor0" = _: profunctorCostar1;
      };
  newtypeCostar = {"Coercible0" = _: module."Prim".undefined;};
  hoistCostar = f: v: 
    let
      __pattern0 = __fail: 
        let
          f1 = f;
          g = v;
        in
          lcmap f1 g;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 65:1 - 65:72";
    in
      __pattern0 __patternFail;
  functorCostar = 
    { map = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              g = v;
            in
              compose f1 g;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 31:1 - 32:38";
        in
          __pattern0 __patternFail;
    };
  invariantCostar = {imap = module."Data.Functor.Invariant".imapF functorCostar;};
  distributiveCostar = 
    { distribute = dictFunctor: 
        let
          map = module."Data.Functor".map dictFunctor;
        in
          f: a: map 
          ( v: 
            let
              __pattern0 = __fail: 
                let
                  g = v;
                in
                  g a;
              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 49:36 - 49:54";
            in
              __pattern0 __patternFail
          ) f;
      collect = dictFunctor: 
        let
          map = module."Data.Functor".map dictFunctor;
        in
          f: compose (module."Data.Distributive".distribute distributiveCostar dictFunctor) (map f);
      "Functor0" = _: functorCostar;
    };
  closedCostar = dictFunctor: 
    let
      map = module."Data.Functor".map dictFunctor;
      profunctorCostar1 = profunctorCostar dictFunctor;
    in
      
      { closed = v: 
          let
            __pattern0 = __fail: 
              let
                f = v;
              in
                g: x: f (map (v1: v1 x) g);
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 62:1 - 63:55";
          in
            __pattern0 __patternFail;
        "Profunctor0" = _: profunctorCostar1;
      };
  categoryCostar = dictComonad: 
    let
      semigroupoidCostar1 = semigroupoidCostar (dictComonad."Extend0" module."Prim".undefined);
    in
      
      { identity = module."Control.Comonad".extract dictComonad;
        "Semigroupoid0" = _: semigroupoidCostar1;
      };
  bifunctorCostar = dictContravariant: 
    let
      cmap = module."Data.Functor.Contravariant".cmap dictContravariant;
    in
      
      { bimap = f: g: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                g1 = g;
                h = v;
              in
                composeFlipped (cmap f1) (composeFlipped h g1);
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 52:1 - 53:53";
          in
            __pattern0 __patternFail;
      };
  applyCostar = 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              g = v1;
            in
              a: f a (g a);
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 37:1 - 38:55";
        in
          __pattern0 __patternFail;
      "Functor0" = _: functorCostar;
    };
  bindCostar = 
    { bind = v: f: 
        let
          __pattern0 = __fail: 
            let
              m = v;
              f1 = f;
            in
              x: 
              let
                v1 = f1 (m x);
              in
                
                let
                  __pattern0 = __fail: 
                    let
                      g = v1;
                    in
                      g x;
                  __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 44:36 - 44:67";
                in
                  __pattern0 __patternFail;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 43:1 - 44:67";
        in
          __pattern0 __patternFail;
      "Apply0" = _: applyCostar;
    };
  applicativeCostar = 
    { pure = a: v: a;
      "Apply0" = _: applyCostar;
    };
  monadCostar = 
    { "Applicative0" = _: applicativeCostar;
      "Bind1" = _: bindCostar;
    };
in
  {inherit Costar hoistCostar newtypeCostar semigroupoidCostar categoryCostar functorCostar invariantCostar applyCostar applicativeCostar bindCostar monadCostar distributiveCostar bifunctorCostar profunctorCostar strongCostar closedCostar;}