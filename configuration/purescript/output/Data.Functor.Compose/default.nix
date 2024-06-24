
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Alternative" = import ../Control.Alternative;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Plus" = import ../Control.Plus;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Eq" = import ../Data.Eq;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.App" = import ../Data.Functor.App;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  Compose = x: x;
  showCompose = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                fga = v;
              in
                append "(Compose " (append (show fga) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Compose.purs at 40:1 - 41:54";
          in
            __pattern0 __patternFail;
      };
  newtypeCompose = {"Coercible0" = _: module."Prim".undefined;};
  functorCompose = dictFunctor: 
    let
      map = module."Data.Functor".map dictFunctor;
    in
      dictFunctor1: 
      let
        map1 = module."Data.Functor".map dictFunctor1;
      in
        
        { map = f: v: 
            let
              __pattern0 = __fail: 
                let
                  f1 = f;
                  fga = v;
                in
                  map (map1 f1) fga;
              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Compose.purs at 43:1 - 44:48";
            in
              __pattern0 __patternFail;
        };
  eqCompose = dictEq1: 
    let
      eq1 = module."Data.Eq".eq1 dictEq1;
    in
      dictEq11: 
      let
        eqApp = module."Data.Functor.App".eqApp dictEq11;
      in
        dictEq: 
        let
          eq11 = eq1 (eqApp dictEq);
        in
          
          { eq = v: v1: 
              let
                __pattern0 = __fail: 
                  let
                    fga1 = v;
                    fga2 = v1;
                  in
                    eq11 (module."Data.Functor.App".hoistLiftApp fga1) (module."Data.Functor.App".hoistLiftApp fga2);
                __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Compose.purs at 28:1 - 30:48";
              in
                __pattern0 __patternFail;
          };
  ordCompose = dictOrd1: 
    let
      compare1 = module."Data.Ord".compare1 dictOrd1;
      eqCompose1 = eqCompose (dictOrd1."Eq10" module."Prim".undefined);
    in
      dictOrd11: 
      let
        ordApp = module."Data.Functor.App".ordApp dictOrd11;
        eqCompose2 = eqCompose1 (dictOrd11."Eq10" module."Prim".undefined);
      in
        dictOrd: 
        let
          compare11 = compare1 (ordApp dictOrd);
          eqCompose3 = eqCompose2 (dictOrd."Eq0" module."Prim".undefined);
        in
          
          { compare = v: v1: 
              let
                __pattern0 = __fail: 
                  let
                    fga1 = v;
                    fga2 = v1;
                  in
                    compare11 (module."Data.Functor.App".hoistLiftApp fga1) (module."Data.Functor.App".hoistLiftApp fga2);
                __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Compose.purs at 34:1 - 36:53";
              in
                __pattern0 __patternFail;
            "Eq0" = _: eqCompose3;
          };
  eq1Compose = dictEq1: 
    let
      eqCompose1 = eqCompose dictEq1;
    in
      dictEq11: 
      let
        eqCompose2 = eqCompose1 dictEq11;
      in
        {eq1 = dictEq: module."Data.Eq".eq (eqCompose2 dictEq);};
  ord1Compose = dictOrd1: 
    let
      ordCompose1 = ordCompose dictOrd1;
      eq1Compose1 = eq1Compose (dictOrd1."Eq10" module."Prim".undefined);
    in
      dictOrd11: 
      let
        ordCompose2 = ordCompose1 dictOrd11;
        eq1Compose2 = eq1Compose1 (dictOrd11."Eq10" module."Prim".undefined);
      in
        
        { compare1 = dictOrd: module."Data.Ord".compare (ordCompose2 dictOrd);
          "Eq10" = _: eq1Compose2;
        };
  bihoistCompose = dictFunctor: 
    let
      map = module."Data.Functor".map dictFunctor;
    in
      natF: natG: v: 
      let
        __pattern0 = __fail: 
          let
            natF1 = natF;
            natG1 = natG;
            fga = v;
          in
            natF1 (map natG1 fga);
        __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Compose.purs at 17:1 - 23:17";
      in
        __pattern0 __patternFail;
  applyCompose = dictApply: 
    let
      apply = module."Control.Apply".apply dictApply;
      Functor0 = dictApply."Functor0" module."Prim".undefined;
      map = module."Data.Functor".map Functor0;
      functorCompose1 = functorCompose Functor0;
    in
      dictApply1: 
      let
        apply1 = module."Control.Apply".apply dictApply1;
        functorCompose2 = functorCompose1 (dictApply1."Functor0" module."Prim".undefined);
      in
        
        { apply = v: v1: 
            let
              __pattern0 = __fail: 
                let
                  f = v;
                  x = v1;
                in
                  apply (map apply1 f) x;
              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Compose.purs at 46:1 - 47:62";
            in
              __pattern0 __patternFail;
          "Functor0" = _: functorCompose2;
        };
  applicativeCompose = dictApplicative: 
    let
      pure = module."Control.Applicative".pure dictApplicative;
      applyCompose1 = applyCompose (dictApplicative."Apply0" module."Prim".undefined);
    in
      dictApplicative1: 
      let
        applyCompose2 = applyCompose1 (dictApplicative1."Apply0" module."Prim".undefined);
      in
        
        { pure = compose Compose (compose pure (module."Control.Applicative".pure dictApplicative1));
          "Apply0" = _: applyCompose2;
        };
  altCompose = dictAlt: 
    let
      alt = module."Control.Alt".alt dictAlt;
      functorCompose1 = functorCompose (dictAlt."Functor0" module."Prim".undefined);
    in
      dictFunctor: 
      let
        functorCompose2 = functorCompose1 dictFunctor;
      in
        
        { alt = v: v1: 
            let
              __pattern0 = __fail: 
                let
                  a = v;
                  b = v1;
                in
                  alt a b;
              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Compose.purs at 52:1 - 53:50";
            in
              __pattern0 __patternFail;
          "Functor0" = _: functorCompose2;
        };
  plusCompose = dictPlus: 
    let
      empty = module."Control.Plus".empty dictPlus;
      altCompose1 = altCompose (dictPlus."Alt0" module."Prim".undefined);
    in
      dictFunctor: 
      let
        altCompose2 = altCompose1 dictFunctor;
      in
        
        { empty = empty;
          "Alt0" = _: altCompose2;
        };
  alternativeCompose = dictAlternative: 
    let
      applicativeCompose1 = applicativeCompose (dictAlternative."Applicative0" module."Prim".undefined);
      plusCompose1 = plusCompose (dictAlternative."Plus1" module."Prim".undefined);
    in
      dictApplicative: 
      let
        applicativeCompose2 = applicativeCompose1 dictApplicative;
        plusCompose2 = plusCompose1 ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
      in
        
        { "Applicative0" = _: applicativeCompose2;
          "Plus1" = _: plusCompose2;
        };
in
  {inherit Compose bihoistCompose newtypeCompose eqCompose eq1Compose ordCompose ord1Compose showCompose functorCompose applyCompose applicativeCompose altCompose plusCompose alternativeCompose;}