
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Either" = import ../Data.Either;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Profunctor" = import ../Data.Profunctor;
      "Prelude" = import ../Prelude;
    };
  identity = module."Control.Category".identity module."Control.Category".categoryFn;
  Choice-Dict = x: x;
  right = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.right;
      __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Choice.purs at 30:3 - 30:62";
    in
      __pattern0 __patternFail;
  left = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.left;
      __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Choice.purs at 29:3 - 29:61";
    in
      __pattern0 __patternFail;
  splitChoice = dictCategory: 
    let
      composeFlipped = module."Control.Semigroupoid".composeFlipped (dictCategory."Semigroupoid0" module."Prim".undefined);
    in
      dictChoice: 
      let
        left1 = left dictChoice;
        right1 = right dictChoice;
      in
        l: r: composeFlipped (left1 l) (right1 r);
  fanin = dictCategory: 
    let
      identity1 = module."Control.Category".identity dictCategory;
      composeFlipped = module."Control.Semigroupoid".composeFlipped (dictCategory."Semigroupoid0" module."Prim".undefined);
      splitChoice1 = splitChoice dictCategory;
    in
      dictChoice: 
      let
        dimap = module."Data.Profunctor".dimap (dictChoice."Profunctor0" module."Prim".undefined);
        splitChoice2 = splitChoice1 dictChoice;
      in
        l: r: 
        let
          join = dimap (module."Data.Either".either identity identity) identity identity1;
        in
          composeFlipped (splitChoice2 l r) join;
  choiceFn = 
    { left = v: v1: 
        let
          __pattern0 = __fail: 
            if v1.__tag == "Left"
              then 
                let
                  a2b = v;
                  a = v1.__field0;
                in
                  module."Data.Either".Left (a2b a)
              else __fail;
          __pattern1 = __fail: 
            if v1.__tag == "Right"
              then 
                let
                  c = v1.__field0;
                in
                  module."Data.Either".Right c
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Choice.purs at 32:1 - 35:16";
        in
          __pattern0 (__pattern1 __patternFail);
      right = module."Data.Functor".map module."Data.Either".functorEither;
      "Profunctor0" = _: module."Data.Profunctor".profunctorFn;
    };
in
  {inherit left right splitChoice fanin choiceFn;}