
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Const" = import ../Data.Const;
      "Data.Either" = import ../Data.Either;
      "Data.Foldable" = import ../Data.Foldable;
      "Data.Function" = import ../Data.Function;
      "Data.Functor.App" = import ../Data.Functor.App;
      "Data.Functor.Compose" = import ../Data.Functor.Compose;
      "Data.Functor.Coproduct" = import ../Data.Functor.Coproduct;
      "Data.Functor.Product" = import ../Data.Functor.Product;
      "Data.FunctorWithIndex" = import ../Data.FunctorWithIndex;
      "Data.Identity" = import ../Data.Identity;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Maybe.First" = import ../Data.Maybe.First;
      "Data.Maybe.Last" = import ../Data.Maybe.Last;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Monoid.Additive" = import ../Data.Monoid.Additive;
      "Data.Monoid.Conj" = import ../Data.Monoid.Conj;
      "Data.Monoid.Disj" = import ../Data.Monoid.Disj;
      "Data.Monoid.Dual" = import ../Data.Monoid.Dual;
      "Data.Monoid.Endo" = import ../Data.Monoid.Endo;
      "Data.Monoid.Multiplicative" = import ../Data.Monoid.Multiplicative;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unit" = import ../Data.Unit;
      "Prelude" = import ../Prelude;
    };
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  foldr = module."Data.Foldable".foldr module."Data.Foldable".foldableMultiplicative;
  foldl = module."Data.Foldable".foldl module."Data.Foldable".foldableMultiplicative;
  foldMap = module."Data.Foldable".foldMap module."Data.Foldable".foldableMultiplicative;
  foldr1 = module."Data.Foldable".foldr module."Data.Foldable".foldableMaybe;
  foldl1 = module."Data.Foldable".foldl module."Data.Foldable".foldableMaybe;
  foldMap1 = module."Data.Foldable".foldMap module."Data.Foldable".foldableMaybe;
  foldr2 = module."Data.Foldable".foldr module."Data.Foldable".foldableLast;
  foldl2 = module."Data.Foldable".foldl module."Data.Foldable".foldableLast;
  foldMap2 = module."Data.Foldable".foldMap module."Data.Foldable".foldableLast;
  foldr3 = module."Data.Foldable".foldr module."Data.Foldable".foldableFirst;
  foldl3 = module."Data.Foldable".foldl module."Data.Foldable".foldableFirst;
  foldMap3 = module."Data.Foldable".foldMap module."Data.Foldable".foldableFirst;
  foldr4 = module."Data.Foldable".foldr module."Data.Foldable".foldableDual;
  foldl4 = module."Data.Foldable".foldl module."Data.Foldable".foldableDual;
  foldMap4 = module."Data.Foldable".foldMap module."Data.Foldable".foldableDual;
  foldr5 = module."Data.Foldable".foldr module."Data.Foldable".foldableDisj;
  foldl5 = module."Data.Foldable".foldl module."Data.Foldable".foldableDisj;
  foldMap5 = module."Data.Foldable".foldMap module."Data.Foldable".foldableDisj;
  foldr6 = module."Data.Foldable".foldr module."Data.Foldable".foldableConj;
  foldl6 = module."Data.Foldable".foldl module."Data.Foldable".foldableConj;
  foldMap6 = module."Data.Foldable".foldMap module."Data.Foldable".foldableConj;
  foldr7 = module."Data.Foldable".foldr module."Data.Foldable".foldableAdditive;
  foldl7 = module."Data.Foldable".foldl module."Data.Foldable".foldableAdditive;
  foldMap7 = module."Data.Foldable".foldMap module."Data.Foldable".foldableAdditive;
  foldr8 = module."Data.Foldable".foldr module."Data.Foldable".foldableArray;
  mapWithIndex = module."Data.FunctorWithIndex".mapWithIndex module."Data.FunctorWithIndex".functorWithIndexArray;
  foldl8 = module."Data.Foldable".foldl module."Data.Foldable".foldableArray;
  unwrap = module."Data.Newtype".unwrap module."Prim".undefined;
  monoidEndo = module."Data.Monoid.Endo".monoidEndo module."Control.Category".categoryFn;
  monoidDual = module."Data.Monoid.Dual".monoidDual monoidEndo;
  FoldableWithIndex-Dict = x: x;
  foldrWithIndex = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.foldrWithIndex;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 63:3 - 63:68";
    in
      __pattern0 __patternFail;
  traverseWithIndex_ = dictApplicative: 
    let
      applySecond = module."Control.Apply".applySecond (dictApplicative."Apply0" module."Prim".undefined);
      pure = module."Control.Applicative".pure dictApplicative;
    in
      dictFoldableWithIndex: 
      let
        foldrWithIndex1 = foldrWithIndex dictFoldableWithIndex;
      in
        f: foldrWithIndex1 (i: compose applySecond (f i)) (pure module."Data.Unit".unit);
  forWithIndex_ = dictApplicative: 
    let
      traverseWithIndex_1 = traverseWithIndex_ dictApplicative;
    in
      dictFoldableWithIndex: module."Data.Function".flip (traverseWithIndex_1 dictFoldableWithIndex);
  foldrDefault = dictFoldableWithIndex: 
    let
      foldrWithIndex1 = foldrWithIndex dictFoldableWithIndex;
    in
      f: foldrWithIndex1 (module."Data.Function".const f);
  foldlWithIndex = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.foldlWithIndex;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 64:3 - 64:68";
    in
      __pattern0 __patternFail;
  foldlDefault = dictFoldableWithIndex: 
    let
      foldlWithIndex1 = foldlWithIndex dictFoldableWithIndex;
    in
      f: foldlWithIndex1 (module."Data.Function".const f);
  foldableWithIndexTuple = 
    { foldrWithIndex = f: z: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  z1 = z;
                  x = v.__field1;
                in
                  f1 module."Data.Unit".unit x z1
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 172:1 - 175:44";
        in
          __pattern0 __patternFail;
      foldlWithIndex = f: z: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  z1 = z;
                  x = v.__field1;
                in
                  f1 module."Data.Unit".unit z1 x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 172:1 - 175:44";
        in
          __pattern0 __patternFail;
      foldMapWithIndex = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  x = v.__field1;
                in
                  f1 module."Data.Unit".unit x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 172:1 - 175:44";
        in
          __pattern0 __patternFail;
      "Foldable0" = _: module."Data.Foldable".foldableTuple;
    };
  foldableWithIndexMultiplicative = 
    { foldrWithIndex = f: foldr (f module."Data.Unit".unit);
      foldlWithIndex = f: foldl (f module."Data.Unit".unit);
      foldMapWithIndex = dictMonoid: 
        let
          foldMap8 = foldMap dictMonoid;
        in
          f: foldMap8 (f module."Data.Unit".unit);
      "Foldable0" = _: module."Data.Foldable".foldableMultiplicative;
    };
  foldableWithIndexMaybe = 
    { foldrWithIndex = f: foldr1 (f module."Data.Unit".unit);
      foldlWithIndex = f: foldl1 (f module."Data.Unit".unit);
      foldMapWithIndex = dictMonoid: 
        let
          foldMap8 = foldMap1 dictMonoid;
        in
          f: foldMap8 (f module."Data.Unit".unit);
      "Foldable0" = _: module."Data.Foldable".foldableMaybe;
    };
  foldableWithIndexLast = 
    { foldrWithIndex = f: foldr2 (f module."Data.Unit".unit);
      foldlWithIndex = f: foldl2 (f module."Data.Unit".unit);
      foldMapWithIndex = dictMonoid: 
        let
          foldMap8 = foldMap2 dictMonoid;
        in
          f: foldMap8 (f module."Data.Unit".unit);
      "Foldable0" = _: module."Data.Foldable".foldableLast;
    };
  foldableWithIndexIdentity = 
    { foldrWithIndex = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 module."Data.Unit".unit x z1;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 177:1 - 180:45";
        in
          __pattern0 __patternFail;
      foldlWithIndex = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 module."Data.Unit".unit z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 177:1 - 180:45";
        in
          __pattern0 __patternFail;
      foldMapWithIndex = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              f1 module."Data.Unit".unit x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 177:1 - 180:45";
        in
          __pattern0 __patternFail;
      "Foldable0" = _: module."Data.Foldable".foldableIdentity;
    };
  foldableWithIndexFirst = 
    { foldrWithIndex = f: foldr3 (f module."Data.Unit".unit);
      foldlWithIndex = f: foldl3 (f module."Data.Unit".unit);
      foldMapWithIndex = dictMonoid: 
        let
          foldMap8 = foldMap3 dictMonoid;
        in
          f: foldMap8 (f module."Data.Unit".unit);
      "Foldable0" = _: module."Data.Foldable".foldableFirst;
    };
  foldableWithIndexEither = 
    { foldrWithIndex = v: z: v1: 
        let
          __pattern0 = __fail: 
            if v1.__tag == "Left"
              then 
                let
                  z1 = z;
                in
                  z1
              else __fail;
          __pattern1 = __fail: 
            if v1.__tag == "Right"
              then 
                let
                  f = v;
                  z1 = z;
                  x = v1.__field0;
                in
                  f module."Data.Unit".unit x z1
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 164:1 - 170:42";
        in
          __pattern0 (__pattern1 __patternFail);
      foldlWithIndex = v: z: v1: 
        let
          __pattern0 = __fail: 
            if v1.__tag == "Left"
              then 
                let
                  z1 = z;
                in
                  z1
              else __fail;
          __pattern1 = __fail: 
            if v1.__tag == "Right"
              then 
                let
                  f = v;
                  z1 = z;
                  x = v1.__field0;
                in
                  f module."Data.Unit".unit z1 x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 164:1 - 170:42";
        in
          __pattern0 (__pattern1 __patternFail);
      foldMapWithIndex = dictMonoid: 
        let
          mempty = module."Data.Monoid".mempty dictMonoid;
        in
          v: v1: 
          let
            __pattern0 = __fail: if v1.__tag == "Left" then mempty else __fail;
            __pattern1 = __fail: 
              if v1.__tag == "Right"
                then 
                  let
                    f = v;
                    x = v1.__field0;
                  in
                    f module."Data.Unit".unit x
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 164:1 - 170:42";
          in
            __pattern0 (__pattern1 __patternFail);
      "Foldable0" = _: module."Data.Foldable".foldableEither;
    };
  foldableWithIndexDual = 
    { foldrWithIndex = f: foldr4 (f module."Data.Unit".unit);
      foldlWithIndex = f: foldl4 (f module."Data.Unit".unit);
      foldMapWithIndex = dictMonoid: 
        let
          foldMap8 = foldMap4 dictMonoid;
        in
          f: foldMap8 (f module."Data.Unit".unit);
      "Foldable0" = _: module."Data.Foldable".foldableDual;
    };
  foldableWithIndexDisj = 
    { foldrWithIndex = f: foldr5 (f module."Data.Unit".unit);
      foldlWithIndex = f: foldl5 (f module."Data.Unit".unit);
      foldMapWithIndex = dictMonoid: 
        let
          foldMap8 = foldMap5 dictMonoid;
        in
          f: foldMap8 (f module."Data.Unit".unit);
      "Foldable0" = _: module."Data.Foldable".foldableDisj;
    };
  foldableWithIndexConst = 
    { foldrWithIndex = v: z: v1: z;
      foldlWithIndex = v: z: v1: z;
      foldMapWithIndex = dictMonoid: 
        let
          mempty = module."Data.Monoid".mempty dictMonoid;
        in
          v: v1: mempty;
      "Foldable0" = _: module."Data.Foldable".foldableConst;
    };
  foldableWithIndexConj = 
    { foldrWithIndex = f: foldr6 (f module."Data.Unit".unit);
      foldlWithIndex = f: foldl6 (f module."Data.Unit".unit);
      foldMapWithIndex = dictMonoid: 
        let
          foldMap8 = foldMap6 dictMonoid;
        in
          f: foldMap8 (f module."Data.Unit".unit);
      "Foldable0" = _: module."Data.Foldable".foldableConj;
    };
  foldableWithIndexAdditive = 
    { foldrWithIndex = f: foldr7 (f module."Data.Unit".unit);
      foldlWithIndex = f: foldl7 (f module."Data.Unit".unit);
      foldMapWithIndex = dictMonoid: 
        let
          foldMap8 = foldMap7 dictMonoid;
        in
          f: foldMap8 (f module."Data.Unit".unit);
      "Foldable0" = _: module."Data.Foldable".foldableAdditive;
    };
  foldWithIndexM = dictFoldableWithIndex: 
    let
      foldlWithIndex1 = foldlWithIndex dictFoldableWithIndex;
    in
      dictMonad: 
      let
        bind = module."Control.Bind".bind (dictMonad."Bind1" module."Prim".undefined);
        pure = module."Control.Applicative".pure (dictMonad."Applicative0" module."Prim".undefined);
      in
        f: a0: foldlWithIndex1 (i: ma: b: bind ma (module."Data.Function".flip (f i) b)) (pure a0);
  foldMapWithIndexDefaultR = dictFoldableWithIndex: 
    let
      foldrWithIndex1 = foldrWithIndex dictFoldableWithIndex;
    in
      dictMonoid: 
      let
        append = module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined);
        mempty = module."Data.Monoid".mempty dictMonoid;
      in
        f: foldrWithIndex1 (i: x: acc: append (f i x) acc) mempty;
  foldableWithIndexArray = 
    { foldrWithIndex = f: z: compose 
        ( foldr8 
          ( v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Tuple"
                  then 
                    let
                      i = v.__field0;
                      x = v.__field1;
                    in
                      y: f i x y
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 120:31 - 120:56";
            in
              __pattern0 __patternFail
          ) z
        ) (mapWithIndex module."Data.Tuple".Tuple);
      foldlWithIndex = f: z: compose 
        ( foldl8 
          ( y: v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Tuple"
                  then 
                    let
                      i = v.__field0;
                      x = v.__field1;
                    in
                      f i y x
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 121:31 - 121:56";
            in
              __pattern0 __patternFail
          ) z
        ) (mapWithIndex module."Data.Tuple".Tuple);
      foldMapWithIndex = dictMonoid: foldMapWithIndexDefaultR foldableWithIndexArray dictMonoid;
      "Foldable0" = _: module."Data.Foldable".foldableArray;
    };
  foldMapWithIndexDefaultL = dictFoldableWithIndex: 
    let
      foldlWithIndex1 = foldlWithIndex dictFoldableWithIndex;
    in
      dictMonoid: 
      let
        append = module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined);
        mempty = module."Data.Monoid".mempty dictMonoid;
      in
        f: foldlWithIndex1 (i: acc: x: append acc (f i x)) mempty;
  foldMapWithIndex = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.foldMapWithIndex;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 65:3 - 65:72";
    in
      __pattern0 __patternFail;
  foldableWithIndexApp = dictFoldableWithIndex: 
    let
      foldrWithIndex1 = foldrWithIndex dictFoldableWithIndex;
      foldlWithIndex1 = foldlWithIndex dictFoldableWithIndex;
      foldMapWithIndex1 = foldMapWithIndex dictFoldableWithIndex;
      foldableApp = module."Data.Foldable".foldableApp (dictFoldableWithIndex."Foldable0" module."Prim".undefined);
    in
      
      { foldrWithIndex = f: z: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                z1 = z;
                x = v;
              in
                foldrWithIndex1 f1 z1 x;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 202:1 - 205:52";
          in
            __pattern0 __patternFail;
        foldlWithIndex = f: z: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                z1 = z;
                x = v;
              in
                foldlWithIndex1 f1 z1 x;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 202:1 - 205:52";
          in
            __pattern0 __patternFail;
        foldMapWithIndex = dictMonoid: 
          let
            foldMapWithIndex2 = foldMapWithIndex1 dictMonoid;
          in
            f: v: 
            let
              __pattern0 = __fail: 
                let
                  f1 = f;
                  x = v;
                in
                  foldMapWithIndex2 f1 x;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 202:1 - 205:52";
            in
              __pattern0 __patternFail;
        "Foldable0" = _: foldableApp;
      };
  foldableWithIndexCompose = dictFoldableWithIndex: 
    let
      foldrWithIndex1 = foldrWithIndex dictFoldableWithIndex;
      foldlWithIndex1 = foldlWithIndex dictFoldableWithIndex;
      foldMapWithIndex1 = foldMapWithIndex dictFoldableWithIndex;
      foldableCompose = module."Data.Foldable".foldableCompose (dictFoldableWithIndex."Foldable0" module."Prim".undefined);
    in
      dictFoldableWithIndex1: 
      let
        foldrWithIndex2 = foldrWithIndex dictFoldableWithIndex1;
        foldlWithIndex2 = foldlWithIndex dictFoldableWithIndex1;
        foldMapWithIndex2 = foldMapWithIndex dictFoldableWithIndex1;
        foldableCompose1 = foldableCompose (dictFoldableWithIndex1."Foldable0" module."Prim".undefined);
      in
        
        { foldrWithIndex = f: i: v: 
            let
              __pattern0 = __fail: 
                let
                  f1 = f;
                  i1 = i;
                  fga = v;
                in
                  foldrWithIndex1 (a: module."Data.Function".flip (foldrWithIndex2 (module."Data.Tuple".curry f1 a))) i1 fga;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 197:1 - 200:89";
            in
              __pattern0 __patternFail;
          foldlWithIndex = f: i: v: 
            let
              __pattern0 = __fail: 
                let
                  f1 = f;
                  i1 = i;
                  fga = v;
                in
                  foldlWithIndex1 (compose foldlWithIndex2 (module."Data.Tuple".curry f1)) i1 fga;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 197:1 - 200:89";
            in
              __pattern0 __patternFail;
          foldMapWithIndex = dictMonoid: 
            let
              foldMapWithIndex3 = foldMapWithIndex1 dictMonoid;
              foldMapWithIndex4 = foldMapWithIndex2 dictMonoid;
            in
              f: v: 
              let
                __pattern0 = __fail: 
                  let
                    f1 = f;
                    fga = v;
                  in
                    foldMapWithIndex3 (compose foldMapWithIndex4 (module."Data.Tuple".curry f1)) fga;
                __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 197:1 - 200:89";
              in
                __pattern0 __patternFail;
          "Foldable0" = _: foldableCompose1;
        };
  foldableWithIndexCoproduct = dictFoldableWithIndex: 
    let
      foldrWithIndex1 = foldrWithIndex dictFoldableWithIndex;
      foldlWithIndex1 = foldlWithIndex dictFoldableWithIndex;
      foldMapWithIndex1 = foldMapWithIndex dictFoldableWithIndex;
      foldableCoproduct = module."Data.Foldable".foldableCoproduct (dictFoldableWithIndex."Foldable0" module."Prim".undefined);
    in
      dictFoldableWithIndex1: 
      let
        foldrWithIndex2 = foldrWithIndex dictFoldableWithIndex1;
        foldlWithIndex2 = foldlWithIndex dictFoldableWithIndex1;
        foldMapWithIndex2 = foldMapWithIndex dictFoldableWithIndex1;
        foldableCoproduct1 = foldableCoproduct (dictFoldableWithIndex1."Foldable0" module."Prim".undefined);
      in
        
        { foldrWithIndex = f: z: module."Data.Functor.Coproduct".coproduct (foldrWithIndex1 (compose f module."Data.Either".Left) z) (foldrWithIndex2 (compose f module."Data.Either".Right) z);
          foldlWithIndex = f: z: module."Data.Functor.Coproduct".coproduct (foldlWithIndex1 (compose f module."Data.Either".Left) z) (foldlWithIndex2 (compose f module."Data.Either".Right) z);
          foldMapWithIndex = dictMonoid: 
            let
              foldMapWithIndex3 = foldMapWithIndex1 dictMonoid;
              foldMapWithIndex4 = foldMapWithIndex2 dictMonoid;
            in
              f: module."Data.Functor.Coproduct".coproduct (foldMapWithIndex3 (compose f module."Data.Either".Left)) (foldMapWithIndex4 (compose f module."Data.Either".Right));
          "Foldable0" = _: foldableCoproduct1;
        };
  foldableWithIndexProduct = dictFoldableWithIndex: 
    let
      foldrWithIndex1 = foldrWithIndex dictFoldableWithIndex;
      foldlWithIndex1 = foldlWithIndex dictFoldableWithIndex;
      foldMapWithIndex1 = foldMapWithIndex dictFoldableWithIndex;
      foldableProduct = module."Data.Foldable".foldableProduct (dictFoldableWithIndex."Foldable0" module."Prim".undefined);
    in
      dictFoldableWithIndex1: 
      let
        foldrWithIndex2 = foldrWithIndex dictFoldableWithIndex1;
        foldlWithIndex2 = foldlWithIndex dictFoldableWithIndex1;
        foldMapWithIndex2 = foldMapWithIndex dictFoldableWithIndex1;
        foldableProduct1 = foldableProduct (dictFoldableWithIndex1."Foldable0" module."Prim".undefined);
      in
        
        { foldrWithIndex = f: z: v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Tuple"
                  then 
                    let
                      f1 = f;
                      z1 = z;
                      fa = v.__field0;
                      ga = v.__field1;
                    in
                      foldrWithIndex1 (compose f1 module."Data.Either".Left) (foldrWithIndex2 (compose f1 module."Data.Either".Right) z1 ga) fa
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 187:1 - 190:117";
            in
              __pattern0 __patternFail;
          foldlWithIndex = f: z: v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Tuple"
                  then 
                    let
                      f1 = f;
                      z1 = z;
                      fa = v.__field0;
                      ga = v.__field1;
                    in
                      foldlWithIndex2 (compose f1 module."Data.Either".Right) (foldlWithIndex1 (compose f1 module."Data.Either".Left) z1 fa) ga
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 187:1 - 190:117";
            in
              __pattern0 __patternFail;
          foldMapWithIndex = dictMonoid: 
            let
              append = module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined);
              foldMapWithIndex3 = foldMapWithIndex1 dictMonoid;
              foldMapWithIndex4 = foldMapWithIndex2 dictMonoid;
            in
              f: v: 
              let
                __pattern0 = __fail: 
                  if v.__tag == "Tuple"
                    then 
                      let
                        f1 = f;
                        fa = v.__field0;
                        ga = v.__field1;
                      in
                        append (foldMapWithIndex3 (compose f1 module."Data.Either".Left) fa) (foldMapWithIndex4 (compose f1 module."Data.Either".Right) ga)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 187:1 - 190:117";
              in
                __pattern0 __patternFail;
          "Foldable0" = _: foldableProduct1;
        };
  foldlWithIndexDefault = dictFoldableWithIndex: 
    let
      foldMapWithIndex1 = foldMapWithIndex dictFoldableWithIndex monoidDual;
    in
      c: u: xs: unwrap (unwrap (foldMapWithIndex1 (i: compose module."Data.Monoid.Dual".Dual (compose module."Data.Monoid.Endo".Endo (module."Data.Function".flip (c i)))) xs)) u;
  foldrWithIndexDefault = dictFoldableWithIndex: 
    let
      foldMapWithIndex1 = foldMapWithIndex dictFoldableWithIndex monoidEndo;
    in
      c: u: xs: unwrap (foldMapWithIndex1 (i: compose module."Data.Monoid.Endo".Endo (c i)) xs) u;
  surroundMapWithIndex = dictFoldableWithIndex: 
    let
      foldMapWithIndex1 = foldMapWithIndex dictFoldableWithIndex monoidEndo;
    in
      dictSemigroup: 
      let
        append = module."Data.Semigroup".append dictSemigroup;
      in
        d: t: f: 
        let
          joined = i: a: m: append d (append (t i a) m);
        in
          unwrap (foldMapWithIndex1 joined f) d;
  foldMapDefault = dictFoldableWithIndex: 
    let
      foldMapWithIndex1 = foldMapWithIndex dictFoldableWithIndex;
    in
      dictMonoid: 
      let
        foldMapWithIndex2 = foldMapWithIndex1 dictMonoid;
      in
        f: foldMapWithIndex2 (module."Data.Function".const f);
  findWithIndex = dictFoldableWithIndex: 
    let
      foldlWithIndex1 = foldlWithIndex dictFoldableWithIndex;
    in
      p: 
      let
        go = v: v1: v2: 
          let
            __pattern0 = __fail: 
              if v1.__tag == "Nothing"
                then 
                  let
                    i = v;
                    x = v2;
                  in
                    
                    if p i x
                      then module."Data.Maybe".Just 
                        { index = i;
                          value = x;
                        }
                      else __fail
                else __fail;
            __pattern1 = __fail: 
              let
                r = v1;
              in
                r;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 324:5 - 328:42";
          in
            __pattern0 (__pattern1 __patternFail);
      in
        foldlWithIndex1 go module."Data.Maybe".Nothing;
  findMapWithIndex = dictFoldableWithIndex: 
    let
      foldlWithIndex1 = foldlWithIndex dictFoldableWithIndex;
    in
      f: 
      let
        go = v: v1: v2: 
          let
            __pattern0 = __fail: 
              if v1.__tag == "Nothing"
                then 
                  let
                    i = v;
                    x = v2;
                  in
                    f i x
                else __fail;
            __pattern1 = __fail: 
              let
                r = v1;
              in
                r;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 342:5 - 346:17";
          in
            __pattern0 (__pattern1 __patternFail);
      in
        foldlWithIndex1 go module."Data.Maybe".Nothing;
  anyWithIndex = dictFoldableWithIndex: 
    let
      foldMapWithIndex1 = foldMapWithIndex dictFoldableWithIndex;
    in
      dictHeytingAlgebra: 
      let
        foldMapWithIndex2 = foldMapWithIndex1 (module."Data.Monoid.Disj".monoidDisj dictHeytingAlgebra);
      in
        t: compose unwrap (foldMapWithIndex2 (i: compose module."Data.Monoid.Disj".Disj (t i)));
  allWithIndex = dictFoldableWithIndex: 
    let
      foldMapWithIndex1 = foldMapWithIndex dictFoldableWithIndex;
    in
      dictHeytingAlgebra: 
      let
        foldMapWithIndex2 = foldMapWithIndex1 (module."Data.Monoid.Conj".monoidConj dictHeytingAlgebra);
      in
        t: compose unwrap (foldMapWithIndex2 (i: compose module."Data.Monoid.Conj".Conj (t i)));
in
  {inherit foldrWithIndex foldlWithIndex foldMapWithIndex foldrWithIndexDefault foldlWithIndexDefault foldMapWithIndexDefaultR foldMapWithIndexDefaultL foldWithIndexM traverseWithIndex_ forWithIndex_ surroundMapWithIndex allWithIndex anyWithIndex findWithIndex findMapWithIndex foldrDefault foldlDefault foldMapDefault foldableWithIndexArray foldableWithIndexMaybe foldableWithIndexFirst foldableWithIndexLast foldableWithIndexAdditive foldableWithIndexDual foldableWithIndexDisj foldableWithIndexConj foldableWithIndexMultiplicative foldableWithIndexEither foldableWithIndexTuple foldableWithIndexIdentity foldableWithIndexConst foldableWithIndexProduct foldableWithIndexCoproduct foldableWithIndexCompose foldableWithIndexApp;}