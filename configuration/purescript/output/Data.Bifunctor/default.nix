
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Data.Const" = import ../Data.Const;
      "Data.Either" = import ../Data.Either;
      "Data.Tuple" = import ../Data.Tuple;
    };
  identity = module."Control.Category".identity module."Control.Category".categoryFn;
  Bifunctor-Dict = x: x;
  bimap = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.bimap;
      __patternFail = builtins.throw "Pattern match failure in .spago/bifunctors/master/src/Data/Bifunctor.purs at 22:3 - 22:66";
    in
      __pattern0 __patternFail;
  lmap = dictBifunctor: 
    let
      bimap1 = bimap dictBifunctor;
    in
      f: bimap1 f identity;
  rmap = dictBifunctor: bimap dictBifunctor identity;
  bifunctorTuple = 
    { bimap = f: g: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  g1 = g;
                  x = v.__field0;
                  y = v.__field1;
                in
                  module."Data.Tuple".Tuple (f1 x) (g1 y)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/bifunctors/master/src/Data/Bifunctor.purs at 36:1 - 37:44";
        in
          __pattern0 __patternFail;
    };
  bifunctorEither = 
    { bimap = v: v1: v2: 
        let
          __pattern0 = __fail: 
            if v2.__tag == "Left"
              then 
                let
                  f = v;
                  l = v2.__field0;
                in
                  module."Data.Either".Left (f l)
              else __fail;
          __pattern1 = __fail: 
            if v2.__tag == "Right"
              then 
                let
                  g = v1;
                  r = v2.__field0;
                in
                  module."Data.Either".Right (g r)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/bifunctors/master/src/Data/Bifunctor.purs at 32:1 - 34:36";
        in
          __pattern0 (__pattern1 __patternFail);
    };
  bifunctorConst = 
    { bimap = f: v: v1: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              a = v1;
            in
              f1 a;
          __patternFail = builtins.throw "Pattern match failure in .spago/bifunctors/master/src/Data/Bifunctor.purs at 39:1 - 40:36";
        in
          __pattern0 __patternFail;
    };
in
  {inherit bimap lmap rmap bifunctorEither bifunctorTuple bifunctorConst;}