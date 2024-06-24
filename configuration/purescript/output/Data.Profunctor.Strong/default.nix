
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Functor" = import ../Data.Functor;
      "Data.Profunctor" = import ../Data.Profunctor;
      "Data.Tuple" = import ../Data.Tuple;
      "Prelude" = import ../Prelude;
    };
  identity = module."Control.Category".identity module."Control.Category".categoryFn;
  Strong-Dict = x: x;
  strongFn = 
    { first = a2b: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  a2b1 = a2b;
                  a = v.__field0;
                  c = v.__field1;
                in
                  module."Data.Tuple".Tuple (a2b1 a) c
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Strong.purs at 32:1 - 34:17";
        in
          __pattern0 __patternFail;
      second = module."Data.Functor".map module."Data.Tuple".functorTuple;
      "Profunctor0" = _: module."Data.Profunctor".profunctorFn;
    };
  second = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.second;
      __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Strong.purs at 30:3 - 30:61";
    in
      __pattern0 __patternFail;
  first = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.first;
      __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Strong.purs at 29:3 - 29:60";
    in
      __pattern0 __patternFail;
  splitStrong = dictCategory: 
    let
      composeFlipped = module."Control.Semigroupoid".composeFlipped (dictCategory."Semigroupoid0" module."Prim".undefined);
    in
      dictStrong: 
      let
        first1 = first dictStrong;
        second1 = second dictStrong;
      in
        l: r: composeFlipped (first1 l) (second1 r);
  fanout = dictCategory: 
    let
      identity1 = module."Control.Category".identity dictCategory;
      composeFlipped = module."Control.Semigroupoid".composeFlipped (dictCategory."Semigroupoid0" module."Prim".undefined);
      splitStrong1 = splitStrong dictCategory;
    in
      dictStrong: 
      let
        dimap = module."Data.Profunctor".dimap (dictStrong."Profunctor0" module."Prim".undefined);
        splitStrong2 = splitStrong1 dictStrong;
      in
        l: r: 
        let
          split = dimap identity (a: module."Data.Tuple".Tuple a a) identity1;
        in
          composeFlipped split (splitStrong2 l r);
in
  {inherit first second splitStrong fanout strongFn;}