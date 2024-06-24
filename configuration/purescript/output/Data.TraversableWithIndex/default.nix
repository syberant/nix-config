
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Const" = import ../Data.Const;
      "Data.Either" = import ../Data.Either;
      "Data.FoldableWithIndex" = import ../Data.FoldableWithIndex;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.App" = import ../Data.Functor.App;
      "Data.Functor.Compose" = import ../Data.Functor.Compose;
      "Data.Functor.Coproduct" = import ../Data.Functor.Coproduct;
      "Data.Functor.Product" = import ../Data.Functor.Product;
      "Data.FunctorWithIndex" = import ../Data.FunctorWithIndex;
      "Data.Identity" = import ../Data.Identity;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Maybe.First" = import ../Data.Maybe.First;
      "Data.Maybe.Last" = import ../Data.Maybe.Last;
      "Data.Monoid.Additive" = import ../Data.Monoid.Additive;
      "Data.Monoid.Conj" = import ../Data.Monoid.Conj;
      "Data.Monoid.Disj" = import ../Data.Monoid.Disj;
      "Data.Monoid.Dual" = import ../Data.Monoid.Dual;
      "Data.Monoid.Multiplicative" = import ../Data.Monoid.Multiplicative;
      "Data.Traversable" = import ../Data.Traversable;
      "Data.Traversable.Accum" = import ../Data.Traversable.Accum;
      "Data.Traversable.Accum.Internal" = import ../Data.Traversable.Accum.Internal;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unit" = import ../Data.Unit;
      "Prelude" = import ../Prelude;
    };
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  traverse = module."Data.Traversable".traverse module."Data.Traversable".traversableMultiplicative;
  traverse1 = module."Data.Traversable".traverse module."Data.Traversable".traversableMaybe;
  traverse2 = module."Data.Traversable".traverse module."Data.Traversable".traversableLast;
  traverse3 = module."Data.Traversable".traverse module."Data.Traversable".traversableFirst;
  traverse4 = module."Data.Traversable".traverse module."Data.Traversable".traversableDual;
  traverse5 = module."Data.Traversable".traverse module."Data.Traversable".traversableDisj;
  traverse6 = module."Data.Traversable".traverse module."Data.Traversable".traversableConj;
  traverse7 = module."Data.Traversable".traverse module."Data.Traversable".traversableAdditive;
  TraversableWithIndex-Dict = x: x;
  traverseWithIndexDefault = dictTraversableWithIndex: 
    let
      sequence = module."Data.Traversable".sequence (dictTraversableWithIndex."Traversable2" module."Prim".undefined);
      mapWithIndex = module."Data.FunctorWithIndex".mapWithIndex (dictTraversableWithIndex."FunctorWithIndex0" module."Prim".undefined);
    in
      dictApplicative: 
      let
        sequence1 = sequence dictApplicative;
      in
        f: compose sequence1 (mapWithIndex f);
  traverseWithIndex = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.traverseWithIndex;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/TraversableWithIndex.purs at 56:3 - 56:88";
    in
      __pattern0 __patternFail;
  traverseDefault = dictTraversableWithIndex: 
    let
      traverseWithIndex1 = traverseWithIndex dictTraversableWithIndex;
    in
      dictApplicative: 
      let
        traverseWithIndex2 = traverseWithIndex1 dictApplicative;
      in
        f: traverseWithIndex2 (module."Data.Function".const f);
  traversableWithIndexTuple = 
    { traverseWithIndex = dictApplicative: 
        let
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
        in
          f: v: 
          let
            __pattern0 = __fail: 
              if v.__tag == "Tuple"
                then 
                  let
                    f1 = f;
                    x = v.__field0;
                    y = v.__field1;
                  in
                    map (module."Data.Tuple".Tuple x) (f1 module."Data.Unit".unit y)
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/TraversableWithIndex.purs at 99:1 - 100:57";
          in
            __pattern0 __patternFail;
      "FunctorWithIndex0" = _: module."Data.FunctorWithIndex".functorWithIndexTuple;
      "FoldableWithIndex1" = _: module."Data.FoldableWithIndex".foldableWithIndexTuple;
      "Traversable2" = _: module."Data.Traversable".traversableTuple;
    };
  traversableWithIndexProduct = dictTraversableWithIndex: 
    let
      traverseWithIndex1 = traverseWithIndex dictTraversableWithIndex;
      functorWithIndexProduct = module."Data.FunctorWithIndex".functorWithIndexProduct (dictTraversableWithIndex."FunctorWithIndex0" module."Prim".undefined);
      foldableWithIndexProduct = module."Data.FoldableWithIndex".foldableWithIndexProduct (dictTraversableWithIndex."FoldableWithIndex1" module."Prim".undefined);
      traversableProduct = module."Data.Traversable".traversableProduct (dictTraversableWithIndex."Traversable2" module."Prim".undefined);
    in
      dictTraversableWithIndex1: 
      let
        traverseWithIndex2 = traverseWithIndex dictTraversableWithIndex1;
        functorWithIndexProduct1 = functorWithIndexProduct (dictTraversableWithIndex1."FunctorWithIndex0" module."Prim".undefined);
        foldableWithIndexProduct1 = foldableWithIndexProduct (dictTraversableWithIndex1."FoldableWithIndex1" module."Prim".undefined);
        traversableProduct1 = traversableProduct (dictTraversableWithIndex1."Traversable2" module."Prim".undefined);
      in
        
        { traverseWithIndex = dictApplicative: 
            let
              lift2 = module."Control.Apply".lift2 (dictApplicative."Apply0" module."Prim".undefined);
              traverseWithIndex3 = traverseWithIndex1 dictApplicative;
              traverseWithIndex4 = traverseWithIndex2 dictApplicative;
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
                        lift2 module."Data.Functor.Product".product (traverseWithIndex3 (compose f1 module."Data.Either".Left) fa) (traverseWithIndex4 (compose f1 module."Data.Either".Right) ga)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/TraversableWithIndex.purs at 108:1 - 109:135";
              in
                __pattern0 __patternFail;
          "FunctorWithIndex0" = _: functorWithIndexProduct1;
          "FoldableWithIndex1" = _: foldableWithIndexProduct1;
          "Traversable2" = _: traversableProduct1;
        };
  traversableWithIndexMultiplicative = 
    { traverseWithIndex = dictApplicative: 
        let
          traverse8 = traverse dictApplicative;
        in
          f: traverse8 (f module."Data.Unit".unit);
      "FunctorWithIndex0" = _: module."Data.FunctorWithIndex".functorWithIndexMultiplicative;
      "FoldableWithIndex1" = _: module."Data.FoldableWithIndex".foldableWithIndexMultiplicative;
      "Traversable2" = _: module."Data.Traversable".traversableMultiplicative;
    };
  traversableWithIndexMaybe = 
    { traverseWithIndex = dictApplicative: 
        let
          traverse8 = traverse1 dictApplicative;
        in
          f: traverse8 (f module."Data.Unit".unit);
      "FunctorWithIndex0" = _: module."Data.FunctorWithIndex".functorWithIndexMaybe;
      "FoldableWithIndex1" = _: module."Data.FoldableWithIndex".foldableWithIndexMaybe;
      "Traversable2" = _: module."Data.Traversable".traversableMaybe;
    };
  traversableWithIndexLast = 
    { traverseWithIndex = dictApplicative: 
        let
          traverse8 = traverse2 dictApplicative;
        in
          f: traverse8 (f module."Data.Unit".unit);
      "FunctorWithIndex0" = _: module."Data.FunctorWithIndex".functorWithIndexLast;
      "FoldableWithIndex1" = _: module."Data.FoldableWithIndex".foldableWithIndexLast;
      "Traversable2" = _: module."Data.Traversable".traversableLast;
    };
  traversableWithIndexIdentity = 
    { traverseWithIndex = dictApplicative: 
        let
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
        in
          f: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                x = v;
              in
                map module."Data.Identity".Identity (f1 module."Data.Unit".unit x);
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/TraversableWithIndex.purs at 102:1 - 103:59";
          in
            __pattern0 __patternFail;
      "FunctorWithIndex0" = _: module."Data.FunctorWithIndex".functorWithIndexIdentity;
      "FoldableWithIndex1" = _: module."Data.FoldableWithIndex".foldableWithIndexIdentity;
      "Traversable2" = _: module."Data.Traversable".traversableIdentity;
    };
  traversableWithIndexFirst = 
    { traverseWithIndex = dictApplicative: 
        let
          traverse8 = traverse3 dictApplicative;
        in
          f: traverse8 (f module."Data.Unit".unit);
      "FunctorWithIndex0" = _: module."Data.FunctorWithIndex".functorWithIndexFirst;
      "FoldableWithIndex1" = _: module."Data.FoldableWithIndex".foldableWithIndexFirst;
      "Traversable2" = _: module."Data.Traversable".traversableFirst;
    };
  traversableWithIndexEither = 
    { traverseWithIndex = dictApplicative: 
        let
          pure = module."Control.Applicative".pure dictApplicative;
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
        in
          v: v1: 
          let
            __pattern0 = __fail: 
              if v1.__tag == "Left"
                then 
                  let
                    x = v1.__field0;
                  in
                    pure (module."Data.Either".Left x)
                else __fail;
            __pattern1 = __fail: 
              if v1.__tag == "Right"
                then 
                  let
                    f = v;
                    x = v1.__field0;
                  in
                    map module."Data.Either".Right (f module."Data.Unit".unit x)
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/TraversableWithIndex.purs at 95:1 - 97:53";
          in
            __pattern0 (__pattern1 __patternFail);
      "FunctorWithIndex0" = _: module."Data.FunctorWithIndex".functorWithIndexEither;
      "FoldableWithIndex1" = _: module."Data.FoldableWithIndex".foldableWithIndexEither;
      "Traversable2" = _: module."Data.Traversable".traversableEither;
    };
  traversableWithIndexDual = 
    { traverseWithIndex = dictApplicative: 
        let
          traverse8 = traverse4 dictApplicative;
        in
          f: traverse8 (f module."Data.Unit".unit);
      "FunctorWithIndex0" = _: module."Data.FunctorWithIndex".functorWithIndexDual;
      "FoldableWithIndex1" = _: module."Data.FoldableWithIndex".foldableWithIndexDual;
      "Traversable2" = _: module."Data.Traversable".traversableDual;
    };
  traversableWithIndexDisj = 
    { traverseWithIndex = dictApplicative: 
        let
          traverse8 = traverse5 dictApplicative;
        in
          f: traverse8 (f module."Data.Unit".unit);
      "FunctorWithIndex0" = _: module."Data.FunctorWithIndex".functorWithIndexDisj;
      "FoldableWithIndex1" = _: module."Data.FoldableWithIndex".foldableWithIndexDisj;
      "Traversable2" = _: module."Data.Traversable".traversableDisj;
    };
  traversableWithIndexCoproduct = dictTraversableWithIndex: 
    let
      traverseWithIndex1 = traverseWithIndex dictTraversableWithIndex;
      functorWithIndexCoproduct = module."Data.FunctorWithIndex".functorWithIndexCoproduct (dictTraversableWithIndex."FunctorWithIndex0" module."Prim".undefined);
      foldableWithIndexCoproduct = module."Data.FoldableWithIndex".foldableWithIndexCoproduct (dictTraversableWithIndex."FoldableWithIndex1" module."Prim".undefined);
      traversableCoproduct = module."Data.Traversable".traversableCoproduct (dictTraversableWithIndex."Traversable2" module."Prim".undefined);
    in
      dictTraversableWithIndex1: 
      let
        traverseWithIndex2 = traverseWithIndex dictTraversableWithIndex1;
        functorWithIndexCoproduct1 = functorWithIndexCoproduct (dictTraversableWithIndex1."FunctorWithIndex0" module."Prim".undefined);
        foldableWithIndexCoproduct1 = foldableWithIndexCoproduct (dictTraversableWithIndex1."FoldableWithIndex1" module."Prim".undefined);
        traversableCoproduct1 = traversableCoproduct (dictTraversableWithIndex1."Traversable2" module."Prim".undefined);
      in
        
        { traverseWithIndex = dictApplicative: 
            let
              map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
              traverseWithIndex3 = traverseWithIndex1 dictApplicative;
              traverseWithIndex4 = traverseWithIndex2 dictApplicative;
            in
              f: module."Data.Functor.Coproduct".coproduct (compose (map (compose module."Data.Functor.Coproduct".Coproduct module."Data.Either".Left)) (traverseWithIndex3 (compose f module."Data.Either".Left))) (compose (map (compose module."Data.Functor.Coproduct".Coproduct module."Data.Either".Right)) (traverseWithIndex4 (compose f module."Data.Either".Right)));
          "FunctorWithIndex0" = _: functorWithIndexCoproduct1;
          "FoldableWithIndex1" = _: foldableWithIndexCoproduct1;
          "Traversable2" = _: traversableCoproduct1;
        };
  traversableWithIndexConst = 
    { traverseWithIndex = dictApplicative: 
        let
          pure = module."Control.Applicative".pure dictApplicative;
        in
          v: v1: 
          let
            __pattern0 = __fail: 
              let
                x = v1;
              in
                pure x;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/TraversableWithIndex.purs at 105:1 - 106:49";
          in
            __pattern0 __patternFail;
      "FunctorWithIndex0" = _: module."Data.FunctorWithIndex".functorWithIndexConst;
      "FoldableWithIndex1" = _: module."Data.FoldableWithIndex".foldableWithIndexConst;
      "Traversable2" = _: module."Data.Traversable".traversableConst;
    };
  traversableWithIndexConj = 
    { traverseWithIndex = dictApplicative: 
        let
          traverse8 = traverse6 dictApplicative;
        in
          f: traverse8 (f module."Data.Unit".unit);
      "FunctorWithIndex0" = _: module."Data.FunctorWithIndex".functorWithIndexConj;
      "FoldableWithIndex1" = _: module."Data.FoldableWithIndex".foldableWithIndexConj;
      "Traversable2" = _: module."Data.Traversable".traversableConj;
    };
  traversableWithIndexCompose = dictTraversableWithIndex: 
    let
      traverseWithIndex1 = traverseWithIndex dictTraversableWithIndex;
      functorWithIndexCompose = module."Data.FunctorWithIndex".functorWithIndexCompose (dictTraversableWithIndex."FunctorWithIndex0" module."Prim".undefined);
      foldableWithIndexCompose = module."Data.FoldableWithIndex".foldableWithIndexCompose (dictTraversableWithIndex."FoldableWithIndex1" module."Prim".undefined);
      traversableCompose = module."Data.Traversable".traversableCompose (dictTraversableWithIndex."Traversable2" module."Prim".undefined);
    in
      dictTraversableWithIndex1: 
      let
        traverseWithIndex2 = traverseWithIndex dictTraversableWithIndex1;
        functorWithIndexCompose1 = functorWithIndexCompose (dictTraversableWithIndex1."FunctorWithIndex0" module."Prim".undefined);
        foldableWithIndexCompose1 = foldableWithIndexCompose (dictTraversableWithIndex1."FoldableWithIndex1" module."Prim".undefined);
        traversableCompose1 = traversableCompose (dictTraversableWithIndex1."Traversable2" module."Prim".undefined);
      in
        
        { traverseWithIndex = dictApplicative: 
            let
              map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
              traverseWithIndex3 = traverseWithIndex1 dictApplicative;
              traverseWithIndex4 = traverseWithIndex2 dictApplicative;
            in
              f: v: 
              let
                __pattern0 = __fail: 
                  let
                    f1 = f;
                    fga = v;
                  in
                    map module."Data.Functor.Compose".Compose (traverseWithIndex3 (compose traverseWithIndex4 (module."Data.Tuple".curry f1)) fga);
                __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/TraversableWithIndex.purs at 116:1 - 117:106";
              in
                __pattern0 __patternFail;
          "FunctorWithIndex0" = _: functorWithIndexCompose1;
          "FoldableWithIndex1" = _: foldableWithIndexCompose1;
          "Traversable2" = _: traversableCompose1;
        };
  traversableWithIndexArray = 
    { traverseWithIndex = dictApplicative: traverseWithIndexDefault traversableWithIndexArray dictApplicative;
      "FunctorWithIndex0" = _: module."Data.FunctorWithIndex".functorWithIndexArray;
      "FoldableWithIndex1" = _: module."Data.FoldableWithIndex".foldableWithIndexArray;
      "Traversable2" = _: module."Data.Traversable".traversableArray;
    };
  traversableWithIndexApp = dictTraversableWithIndex: 
    let
      traverseWithIndex1 = traverseWithIndex dictTraversableWithIndex;
      functorWithIndexApp = module."Data.FunctorWithIndex".functorWithIndexApp (dictTraversableWithIndex."FunctorWithIndex0" module."Prim".undefined);
      foldableWithIndexApp = module."Data.FoldableWithIndex".foldableWithIndexApp (dictTraversableWithIndex."FoldableWithIndex1" module."Prim".undefined);
      traversableApp = module."Data.Traversable".traversableApp (dictTraversableWithIndex."Traversable2" module."Prim".undefined);
    in
      
      { traverseWithIndex = dictApplicative: 
          let
            map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
            traverseWithIndex2 = traverseWithIndex1 dictApplicative;
          in
            f: v: 
            let
              __pattern0 = __fail: 
                let
                  f1 = f;
                  x = v;
                in
                  map module."Data.Functor.App".App (traverseWithIndex2 f1 x);
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/TraversableWithIndex.purs at 119:1 - 120:62";
            in
              __pattern0 __patternFail;
        "FunctorWithIndex0" = _: functorWithIndexApp;
        "FoldableWithIndex1" = _: foldableWithIndexApp;
        "Traversable2" = _: traversableApp;
      };
  traversableWithIndexAdditive = 
    { traverseWithIndex = dictApplicative: 
        let
          traverse8 = traverse7 dictApplicative;
        in
          f: traverse8 (f module."Data.Unit".unit);
      "FunctorWithIndex0" = _: module."Data.FunctorWithIndex".functorWithIndexAdditive;
      "FoldableWithIndex1" = _: module."Data.FoldableWithIndex".foldableWithIndexAdditive;
      "Traversable2" = _: module."Data.Traversable".traversableAdditive;
    };
  mapAccumRWithIndex = dictTraversableWithIndex: 
    let
      traverseWithIndex1 = traverseWithIndex dictTraversableWithIndex module."Data.Traversable.Accum.Internal".applicativeStateR;
    in
      f: s0: xs: module."Data.Traversable.Accum.Internal".stateR (traverseWithIndex1 (i: a: s: f i s a) xs) s0;
  scanrWithIndex = dictTraversableWithIndex: 
    let
      mapAccumRWithIndex1 = mapAccumRWithIndex dictTraversableWithIndex;
    in
      f: b0: xs: 
      ( mapAccumRWithIndex1 
        ( i: b: a: 
          let
            b' = f i a b;
          in
            
            { accum = b';
              value = b';
            }
        ) b0 xs
      ).value;
  mapAccumLWithIndex = dictTraversableWithIndex: 
    let
      traverseWithIndex1 = traverseWithIndex dictTraversableWithIndex module."Data.Traversable.Accum.Internal".applicativeStateL;
    in
      f: s0: xs: module."Data.Traversable.Accum.Internal".stateL (traverseWithIndex1 (i: a: s: f i s a) xs) s0;
  scanlWithIndex = dictTraversableWithIndex: 
    let
      mapAccumLWithIndex1 = mapAccumLWithIndex dictTraversableWithIndex;
    in
      f: b0: xs: 
      ( mapAccumLWithIndex1 
        ( i: b: a: 
          let
            b' = f i b a;
          in
            
            { accum = b';
              value = b';
            }
        ) b0 xs
      ).value;
  forWithIndex = dictApplicative: dictTraversableWithIndex: module."Data.Function".flip (traverseWithIndex dictTraversableWithIndex dictApplicative);
in
  
  { inherit traverseWithIndex traverseWithIndexDefault forWithIndex scanlWithIndex mapAccumLWithIndex scanrWithIndex mapAccumRWithIndex traverseDefault traversableWithIndexArray traversableWithIndexMaybe traversableWithIndexFirst traversableWithIndexLast traversableWithIndexAdditive traversableWithIndexDual traversableWithIndexConj traversableWithIndexDisj traversableWithIndexMultiplicative traversableWithIndexEither traversableWithIndexTuple traversableWithIndexIdentity traversableWithIndexConst traversableWithIndexProduct traversableWithIndexCoproduct traversableWithIndexCompose traversableWithIndexApp;
    inherit (module."Data.Traversable.Accum");
  }