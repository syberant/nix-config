
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Newtype" = import ../Data.Newtype;
      "Prelude" = import ../Prelude;
    };
  composeFlipped = module."Control.Semigroupoid".composeFlipped module."Control.Semigroupoid".semigroupoidFn;
  identity = module."Control.Category".identity module."Control.Category".categoryFn;
  wrap = module."Data.Newtype".wrap module."Prim".undefined;
  unwrap = module."Data.Newtype".unwrap module."Prim".undefined;
  Profunctor-Dict = x: x;
  profunctorFn = {dimap = a2b: c2d: b2c: composeFlipped a2b (composeFlipped b2c c2d);};
  dimap = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.dimap;
      __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor.purs at 23:3 - 23:66";
    in
      __pattern0 __patternFail;
  lcmap = dictProfunctor: 
    let
      dimap1 = dimap dictProfunctor;
    in
      a2b: dimap1 a2b identity;
  rmap = dictProfunctor: 
    let
      dimap1 = dimap dictProfunctor;
    in
      b2c: dimap1 identity b2c;
  unwrapIso = dictProfunctor: 
    let
      dimap1 = dimap dictProfunctor;
    in
      _: dimap1 wrap unwrap;
  wrapIso = dictProfunctor: 
    let
      dimap1 = dimap dictProfunctor;
    in
      _: v: dimap1 unwrap wrap;
  arr = dictCategory: 
    let
      identity1 = module."Control.Category".identity dictCategory;
    in
      dictProfunctor: 
      let
        rmap1 = rmap dictProfunctor;
      in
        f: rmap1 f identity1;
in
  {inherit dimap lcmap rmap arr unwrapIso wrapIso profunctorFn;}