
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Exists" = import ../Data.Exists;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.Invariant" = import ../Data.Functor.Invariant;
      "Data.Profunctor" = import ../Data.Profunctor;
      "Prelude" = import ../Prelude;
    };
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  identity = module."Control.Category".identity module."Control.Category".categoryFn;
  SplitF = value0: value1: value2: 
    { __tag = "SplitF";
      __field0 = value0;
      __field1 = value1;
      __field2 = value2;
    };
  Split = x: x;
  unSplit = f: v: 
    let
      __pattern0 = __fail: 
        let
          f1 = f;
          e = v;
        in
          module."Data.Exists".runExists 
          ( v1: 
            let
              __pattern0 = __fail: 
                if v1.__tag == "SplitF"
                  then 
                    let
                      g = v1.__field0;
                      h = v1.__field1;
                      fx = v1.__field2;
                    in
                      f1 g h fx
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Split.purs at 30:34 - 30:62";
            in
              __pattern0 __patternFail
          ) e;
      __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Split.purs at 29:1 - 29:92";
    in
      __pattern0 __patternFail;
  split = f: g: fx: module."Data.Exists".mkExists (SplitF f g fx);
  profunctorSplit = {dimap = f: g: unSplit (h: i: split (compose h f) (compose g i));};
  lowerSplit = dictInvariant: unSplit (module."Data.Function".flip (module."Data.Functor.Invariant".imap dictInvariant));
  liftSplit = split identity identity;
  hoistSplit = nat: unSplit (f: g: compose (split f g) nat);
  functorSplit = {map = f: unSplit (g: h: fx: split g (compose f h) fx);};
in
  {inherit split unSplit liftSplit lowerSplit hoistSplit functorSplit profunctorSplit;}