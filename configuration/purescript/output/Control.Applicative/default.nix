
let
  module = 
    { "Control.Apply" = import ../Control.Apply;
      "Data.Functor" = import ../Data.Functor;
      "Data.Unit" = import ../Data.Unit;
      "Type.Proxy" = import ../Type.Proxy;
    };
  Applicative-Dict = x: x;
  pure = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.pure;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Control/Applicative.purs at 34:3 - 34:29";
    in
      __pattern0 __patternFail;
  unless = dictApplicative: 
    let
      pure1 = pure dictApplicative;
    in
      v: v1: 
      let
        __pattern0 = __fail: 
          if !v
            then 
              let
                m = v1;
              in
                m
            else __fail;
        __pattern1 = __fail: if v then pure1 module."Data.Unit".unit else __fail;
        __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Control/Applicative.purs at 66:1 - 66:65";
      in
        __pattern0 (__pattern1 __patternFail);
  when = dictApplicative: 
    let
      pure1 = pure dictApplicative;
    in
      v: v1: 
      let
        __pattern0 = __fail: 
          if v
            then 
              let
                m = v1;
              in
                m
            else __fail;
        __pattern1 = __fail: if !v then pure1 module."Data.Unit".unit else __fail;
        __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Control/Applicative.purs at 61:1 - 61:63";
      in
        __pattern0 (__pattern1 __patternFail);
  liftA1 = dictApplicative: 
    let
      apply = module."Control.Apply".apply (dictApplicative."Apply0" module."Prim".undefined);
      pure1 = pure dictApplicative;
    in
      f: a: apply (pure1 f) a;
  applicativeProxy = 
    { pure = v: module."Type.Proxy".Proxy;
      "Apply0" = _: module."Control.Apply".applyProxy;
    };
  applicativeFn = 
    { pure = x: v: x;
      "Apply0" = _: module."Control.Apply".applyFn;
    };
  applicativeArray = 
    { pure = x: [x];
      "Apply0" = _: module."Control.Apply".applyArray;
    };
in
  
  { inherit pure liftA1 unless when applicativeFn applicativeArray applicativeProxy;
    inherit (module."Control.Apply") apply;
    inherit (module."Data.Functor") map void;
  }