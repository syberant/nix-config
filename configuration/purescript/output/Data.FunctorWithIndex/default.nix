
let
  module = 
    { "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Const" = import ../Data.Const;
      "Data.Either" = import ../Data.Either;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.App" = import ../Data.Functor.App;
      "Data.Functor.Compose" = import ../Data.Functor.Compose;
      "Data.Functor.Coproduct" = import ../Data.Functor.Coproduct;
      "Data.Functor.Product" = import ../Data.Functor.Product;
      "Data.Identity" = import ../Data.Identity;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Maybe.First" = import ../Data.Maybe.First;
      "Data.Maybe.Last" = import ../Data.Maybe.Last;
      "Data.Monoid.Additive" = import ../Data.Monoid.Additive;
      "Data.Monoid.Conj" = import ../Data.Monoid.Conj;
      "Data.Monoid.Disj" = import ../Data.Monoid.Disj;
      "Data.Monoid.Dual" = import ../Data.Monoid.Dual;
      "Data.Monoid.Multiplicative" = import ../Data.Monoid.Multiplicative;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unit" = import ../Data.Unit;
      "Prelude" = import ../Prelude;
    };
  foreign = import ./foreign.nix;
  mapWithIndexArray = foreign.mapWithIndexArray;
  map = module."Data.Functor".map module."Data.Tuple".functorTuple;
  bimap = module."Data.Bifunctor".bimap module."Data.Bifunctor".bifunctorTuple;
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  map1 = module."Data.Functor".map module."Data.Monoid.Multiplicative".functorMultiplicative;
  map2 = module."Data.Functor".map module."Data.Maybe".functorMaybe;
  map3 = module."Data.Functor".map module."Data.Maybe.Last".functorLast;
  map4 = module."Data.Functor".map module."Data.Maybe.First".functorFirst;
  map5 = module."Data.Functor".map module."Data.Either".functorEither;
  map6 = module."Data.Functor".map module."Data.Monoid.Dual".functorDual;
  map7 = module."Data.Functor".map module."Data.Monoid.Disj".functorDisj;
  bimap1 = module."Data.Bifunctor".bimap module."Data.Bifunctor".bifunctorEither;
  map8 = module."Data.Functor".map module."Data.Monoid.Conj".functorConj;
  map9 = module."Data.Functor".map module."Data.Monoid.Additive".functorAdditive;
  FunctorWithIndex-Dict = x: x;
  mapWithIndex = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.mapWithIndex;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FunctorWithIndex.purs at 36:3 - 36:58";
    in
      __pattern0 __patternFail;
  mapDefault = dictFunctorWithIndex: 
    let
      mapWithIndex1 = mapWithIndex dictFunctorWithIndex;
    in
      f: mapWithIndex1 (module."Data.Function".const f);
  functorWithIndexTuple = 
    { mapWithIndex = f: map (f module."Data.Unit".unit);
      "Functor0" = _: module."Data.Tuple".functorTuple;
    };
  functorWithIndexProduct = dictFunctorWithIndex: 
    let
      mapWithIndex1 = mapWithIndex dictFunctorWithIndex;
      functorProduct = module."Data.Functor.Product".functorProduct (dictFunctorWithIndex."Functor0" module."Prim".undefined);
    in
      dictFunctorWithIndex1: 
      let
        mapWithIndex2 = mapWithIndex dictFunctorWithIndex1;
        functorProduct1 = functorProduct (dictFunctorWithIndex1."Functor0" module."Prim".undefined);
      in
        
        { mapWithIndex = f: v: 
            let
              __pattern0 = __fail: 
                let
                  f1 = f;
                  fga = v;
                in
                  bimap (mapWithIndex1 (compose f1 module."Data.Either".Left)) (mapWithIndex2 (compose f1 module."Data.Either".Right)) fga;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FunctorWithIndex.purs at 79:1 - 80:110";
            in
              __pattern0 __patternFail;
          "Functor0" = _: functorProduct1;
        };
  functorWithIndexMultiplicative = 
    { mapWithIndex = f: map1 (f module."Data.Unit".unit);
      "Functor0" = _: module."Data.Monoid.Multiplicative".functorMultiplicative;
    };
  functorWithIndexMaybe = 
    { mapWithIndex = f: map2 (f module."Data.Unit".unit);
      "Functor0" = _: module."Data.Maybe".functorMaybe;
    };
  functorWithIndexLast = 
    { mapWithIndex = f: map3 (f module."Data.Unit".unit);
      "Functor0" = _: module."Data.Maybe.Last".functorLast;
    };
  functorWithIndexIdentity = 
    { mapWithIndex = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              a = v;
            in
              f1 module."Data.Unit".unit a;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FunctorWithIndex.purs at 73:1 - 74:52";
        in
          __pattern0 __patternFail;
      "Functor0" = _: module."Data.Identity".functorIdentity;
    };
  functorWithIndexFirst = 
    { mapWithIndex = f: map4 (f module."Data.Unit".unit);
      "Functor0" = _: module."Data.Maybe.First".functorFirst;
    };
  functorWithIndexEither = 
    { mapWithIndex = f: map5 (f module."Data.Unit".unit);
      "Functor0" = _: module."Data.Either".functorEither;
    };
  functorWithIndexDual = 
    { mapWithIndex = f: map6 (f module."Data.Unit".unit);
      "Functor0" = _: module."Data.Monoid.Dual".functorDual;
    };
  functorWithIndexDisj = 
    { mapWithIndex = f: map7 (f module."Data.Unit".unit);
      "Functor0" = _: module."Data.Monoid.Disj".functorDisj;
    };
  functorWithIndexCoproduct = dictFunctorWithIndex: 
    let
      mapWithIndex1 = mapWithIndex dictFunctorWithIndex;
      functorCoproduct = module."Data.Functor.Coproduct".functorCoproduct (dictFunctorWithIndex."Functor0" module."Prim".undefined);
    in
      dictFunctorWithIndex1: 
      let
        mapWithIndex2 = mapWithIndex dictFunctorWithIndex1;
        functorCoproduct1 = functorCoproduct (dictFunctorWithIndex1."Functor0" module."Prim".undefined);
      in
        
        { mapWithIndex = f: v: 
            let
              __pattern0 = __fail: 
                let
                  f1 = f;
                  e = v;
                in
                  bimap1 (mapWithIndex1 (compose f1 module."Data.Either".Left)) (mapWithIndex2 (compose f1 module."Data.Either".Right)) e;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FunctorWithIndex.purs at 82:1 - 83:110";
            in
              __pattern0 __patternFail;
          "Functor0" = _: functorCoproduct1;
        };
  functorWithIndexConst = 
    { mapWithIndex = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v1;
            in
              x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FunctorWithIndex.purs at 76:1 - 77:37";
        in
          __pattern0 __patternFail;
      "Functor0" = _: module."Data.Const".functorConst;
    };
  functorWithIndexConj = 
    { mapWithIndex = f: map8 (f module."Data.Unit".unit);
      "Functor0" = _: module."Data.Monoid.Conj".functorConj;
    };
  functorWithIndexCompose = dictFunctorWithIndex: 
    let
      mapWithIndex1 = mapWithIndex dictFunctorWithIndex;
      functorCompose = module."Data.Functor.Compose".functorCompose (dictFunctorWithIndex."Functor0" module."Prim".undefined);
    in
      dictFunctorWithIndex1: 
      let
        mapWithIndex2 = mapWithIndex dictFunctorWithIndex1;
        functorCompose1 = functorCompose (dictFunctorWithIndex1."Functor0" module."Prim".undefined);
      in
        
        { mapWithIndex = f: v: 
            let
              __pattern0 = __fail: 
                let
                  f1 = f;
                  fga = v;
                in
                  mapWithIndex1 (compose mapWithIndex2 (module."Data.Tuple".curry f1)) fga;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FunctorWithIndex.purs at 85:1 - 86:87";
            in
              __pattern0 __patternFail;
          "Functor0" = _: functorCompose1;
        };
  functorWithIndexArray = 
    { mapWithIndex = mapWithIndexArray;
      "Functor0" = _: module."Data.Functor".functorArray;
    };
  functorWithIndexApp = dictFunctorWithIndex: 
    let
      mapWithIndex1 = mapWithIndex dictFunctorWithIndex;
      functorApp = module."Data.Functor.App".functorApp (dictFunctorWithIndex."Functor0" module."Prim".undefined);
    in
      
      { mapWithIndex = f: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                x = v;
              in
                mapWithIndex1 f1 x;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FunctorWithIndex.purs at 88:1 - 89:50";
          in
            __pattern0 __patternFail;
        "Functor0" = _: functorApp;
      };
  functorWithIndexAdditive = 
    { mapWithIndex = f: map9 (f module."Data.Unit".unit);
      "Functor0" = _: module."Data.Monoid.Additive".functorAdditive;
    };
in
  {inherit mapWithIndex mapDefault functorWithIndexArray functorWithIndexMaybe functorWithIndexFirst functorWithIndexLast functorWithIndexAdditive functorWithIndexDual functorWithIndexConj functorWithIndexDisj functorWithIndexMultiplicative functorWithIndexEither functorWithIndexTuple functorWithIndexIdentity functorWithIndexConst functorWithIndexProduct functorWithIndexCoproduct functorWithIndexCompose functorWithIndexApp;}