
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Const" = import ../Data.Const;
      "Data.Either" = import ../Data.Either;
      "Data.Foldable" = import ../Data.Foldable;
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
      "Data.Traversable.Accum" = import ../Data.Traversable.Accum;
      "Data.Traversable.Accum.Internal" = import ../Data.Traversable.Accum.Internal;
      "Data.Tuple" = import ../Data.Tuple;
      "Prelude" = import ../Prelude;
    };
  foreign = import ./foreign.nix;
  traverseArrayImpl = foreign.traverseArrayImpl;
  identity = module."Control.Category".identity module."Control.Category".categoryFn;
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  Traversable-Dict = x: x;
  traverse = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.traverse;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 80:3 - 80:74";
    in
      __pattern0 __patternFail;
  traversableTuple = 
    { traverse = dictApplicative: 
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
                    map (module."Data.Tuple".Tuple x) (f1 y)
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 155:1 - 157:39";
          in
            __pattern0 __patternFail;
      sequence = dictApplicative: 
        let
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
        in
          v: 
          let
            __pattern0 = __fail: 
              if v.__tag == "Tuple"
                then 
                  let
                    x = v.__field0;
                    y = v.__field1;
                  in
                    map (module."Data.Tuple".Tuple x) y
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 155:1 - 157:39";
          in
            __pattern0 __patternFail;
      "Functor0" = _: module."Data.Tuple".functorTuple;
      "Foldable1" = _: module."Data.Foldable".foldableTuple;
    };
  traversableMultiplicative = 
    { traverse = dictApplicative: 
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
                map module."Data.Monoid.Multiplicative".Multiplicative (f1 x);
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 145:1 - 147:53";
          in
            __pattern0 __patternFail;
      sequence = dictApplicative: 
        let
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
        in
          v: 
          let
            __pattern0 = __fail: 
              let
                x = v;
              in
                map module."Data.Monoid.Multiplicative".Multiplicative x;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 145:1 - 147:53";
          in
            __pattern0 __patternFail;
      "Functor0" = _: module."Data.Monoid.Multiplicative".functorMultiplicative;
      "Foldable1" = _: module."Data.Foldable".foldableMultiplicative;
    };
  traversableMaybe = 
    { traverse = dictApplicative: 
        let
          pure = module."Control.Applicative".pure dictApplicative;
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
        in
          v: v1: 
          let
            __pattern0 = __fail: if v1.__tag == "Nothing" then pure module."Data.Maybe".Nothing else __fail;
            __pattern1 = __fail: 
              if v1.__tag == "Just"
                then 
                  let
                    f = v;
                    x = v1.__field0;
                  in
                    map module."Data.Maybe".Just (f x)
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 115:1 - 119:33";
          in
            __pattern0 (__pattern1 __patternFail);
      sequence = dictApplicative: 
        let
          pure = module."Control.Applicative".pure dictApplicative;
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
        in
          v: 
          let
            __pattern0 = __fail: if v.__tag == "Nothing" then pure module."Data.Maybe".Nothing else __fail;
            __pattern1 = __fail: 
              if v.__tag == "Just"
                then 
                  let
                    x = v.__field0;
                  in
                    map module."Data.Maybe".Just x
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 115:1 - 119:33";
          in
            __pattern0 (__pattern1 __patternFail);
      "Functor0" = _: module."Data.Maybe".functorMaybe;
      "Foldable1" = _: module."Data.Foldable".foldableMaybe;
    };
  traverse1 = traverse traversableMaybe;
  traversableIdentity = 
    { traverse = dictApplicative: 
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
                map module."Data.Identity".Identity (f1 x);
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 159:1 - 161:41";
          in
            __pattern0 __patternFail;
      sequence = dictApplicative: 
        let
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
        in
          v: 
          let
            __pattern0 = __fail: 
              let
                x = v;
              in
                map module."Data.Identity".Identity x;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 159:1 - 161:41";
          in
            __pattern0 __patternFail;
      "Functor0" = _: module."Data.Identity".functorIdentity;
      "Foldable1" = _: module."Data.Foldable".foldableIdentity;
    };
  traversableEither = 
    { traverse = dictApplicative: 
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
                    map module."Data.Either".Right (f x)
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 149:1 - 153:36";
          in
            __pattern0 (__pattern1 __patternFail);
      sequence = dictApplicative: 
        let
          pure = module."Control.Applicative".pure dictApplicative;
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
        in
          v: 
          let
            __pattern0 = __fail: 
              if v.__tag == "Left"
                then 
                  let
                    x = v.__field0;
                  in
                    pure (module."Data.Either".Left x)
                else __fail;
            __pattern1 = __fail: 
              if v.__tag == "Right"
                then 
                  let
                    x = v.__field0;
                  in
                    map module."Data.Either".Right x
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 149:1 - 153:36";
          in
            __pattern0 (__pattern1 __patternFail);
      "Functor0" = _: module."Data.Either".functorEither;
      "Foldable1" = _: module."Data.Foldable".foldableEither;
    };
  traversableDual = 
    { traverse = dictApplicative: 
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
                map module."Data.Monoid.Dual".Dual (f1 x);
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 133:1 - 135:33";
          in
            __pattern0 __patternFail;
      sequence = dictApplicative: 
        let
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
        in
          v: 
          let
            __pattern0 = __fail: 
              let
                x = v;
              in
                map module."Data.Monoid.Dual".Dual x;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 133:1 - 135:33";
          in
            __pattern0 __patternFail;
      "Functor0" = _: module."Data.Monoid.Dual".functorDual;
      "Foldable1" = _: module."Data.Foldable".foldableDual;
    };
  traversableDisj = 
    { traverse = dictApplicative: 
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
                map module."Data.Monoid.Disj".Disj (f1 x);
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 141:1 - 143:33";
          in
            __pattern0 __patternFail;
      sequence = dictApplicative: 
        let
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
        in
          v: 
          let
            __pattern0 = __fail: 
              let
                x = v;
              in
                map module."Data.Monoid.Disj".Disj x;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 141:1 - 143:33";
          in
            __pattern0 __patternFail;
      "Functor0" = _: module."Data.Monoid.Disj".functorDisj;
      "Foldable1" = _: module."Data.Foldable".foldableDisj;
    };
  traversableConst = 
    { traverse = dictApplicative: 
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
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 163:1 - 165:38";
          in
            __pattern0 __patternFail;
      sequence = dictApplicative: 
        let
          pure = module."Control.Applicative".pure dictApplicative;
        in
          v: 
          let
            __pattern0 = __fail: 
              let
                x = v;
              in
                pure x;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 163:1 - 165:38";
          in
            __pattern0 __patternFail;
      "Functor0" = _: module."Data.Const".functorConst;
      "Foldable1" = _: module."Data.Foldable".foldableConst;
    };
  traversableConj = 
    { traverse = dictApplicative: 
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
                map module."Data.Monoid.Conj".Conj (f1 x);
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 137:1 - 139:33";
          in
            __pattern0 __patternFail;
      sequence = dictApplicative: 
        let
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
        in
          v: 
          let
            __pattern0 = __fail: 
              let
                x = v;
              in
                map module."Data.Monoid.Conj".Conj x;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 137:1 - 139:33";
          in
            __pattern0 __patternFail;
      "Functor0" = _: module."Data.Monoid.Conj".functorConj;
      "Foldable1" = _: module."Data.Foldable".foldableConj;
    };
  traversableCompose = dictTraversable: 
    let
      traverse2 = traverse dictTraversable;
      functorCompose = module."Data.Functor.Compose".functorCompose (dictTraversable."Functor0" module."Prim".undefined);
      foldableCompose = module."Data.Foldable".foldableCompose (dictTraversable."Foldable1" module."Prim".undefined);
    in
      dictTraversable1: 
      let
        traverse3 = traverse dictTraversable1;
        functorCompose1 = functorCompose (dictTraversable1."Functor0" module."Prim".undefined);
        foldableCompose1 = foldableCompose (dictTraversable1."Foldable1" module."Prim".undefined);
      in
        
        { traverse = dictApplicative: 
            let
              map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
              traverse4 = traverse2 dictApplicative;
              traverse5 = traverse3 dictApplicative;
            in
              f: v: 
              let
                __pattern0 = __fail: 
                  let
                    f1 = f;
                    fga = v;
                  in
                    map module."Data.Functor.Compose".Compose (traverse4 (traverse5 f1) fga);
                __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 179:1 - 181:31";
              in
                __pattern0 __patternFail;
          sequence = dictApplicative: traverse (traversableCompose dictTraversable dictTraversable1) dictApplicative identity;
          "Functor0" = _: functorCompose1;
          "Foldable1" = _: foldableCompose1;
        };
  traversableAdditive = 
    { traverse = dictApplicative: 
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
                map module."Data.Monoid.Additive".Additive (f1 x);
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 129:1 - 131:41";
          in
            __pattern0 __patternFail;
      sequence = dictApplicative: 
        let
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
        in
          v: 
          let
            __pattern0 = __fail: 
              let
                x = v;
              in
                map module."Data.Monoid.Additive".Additive x;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 129:1 - 131:41";
          in
            __pattern0 __patternFail;
      "Functor0" = _: module."Data.Monoid.Additive".functorAdditive;
      "Foldable1" = _: module."Data.Foldable".foldableAdditive;
    };
  sequenceDefault = dictTraversable: 
    let
      traverse2 = traverse dictTraversable;
    in
      dictApplicative: traverse2 dictApplicative identity;
  traversableArray = 
    { traverse = dictApplicative: 
        let
          Apply0 = dictApplicative."Apply0" module."Prim".undefined;
        in
          traverseArrayImpl (module."Control.Apply".apply Apply0) (module."Data.Functor".map (Apply0."Functor0" module."Prim".undefined)) (module."Control.Applicative".pure dictApplicative);
      sequence = dictApplicative: sequenceDefault traversableArray dictApplicative;
      "Functor0" = _: module."Data.Functor".functorArray;
      "Foldable1" = _: module."Data.Foldable".foldableArray;
    };
  sequence = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.sequence;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 81:3 - 81:62";
    in
      __pattern0 __patternFail;
  sequence1 = sequence traversableMaybe;
  traversableApp = dictTraversable: 
    let
      traverse2 = traverse dictTraversable;
      sequence2 = sequence dictTraversable;
      functorApp = module."Data.Functor.App".functorApp (dictTraversable."Functor0" module."Prim".undefined);
      foldableApp = module."Data.Foldable".foldableApp (dictTraversable."Foldable1" module."Prim".undefined);
    in
      
      { traverse = dictApplicative: 
          let
            map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
            traverse3 = traverse2 dictApplicative;
          in
            f: v: 
            let
              __pattern0 = __fail: 
                let
                  f1 = f;
                  x = v;
                in
                  map module."Data.Functor.App".App (traverse3 f1 x);
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 183:1 - 185:40";
            in
              __pattern0 __patternFail;
        sequence = dictApplicative: 
          let
            map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
            sequence3 = sequence2 dictApplicative;
          in
            v: 
            let
              __pattern0 = __fail: 
                let
                  x = v;
                in
                  map module."Data.Functor.App".App (sequence3 x);
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 183:1 - 185:40";
            in
              __pattern0 __patternFail;
        "Functor0" = _: functorApp;
        "Foldable1" = _: foldableApp;
      };
  traversableCoproduct = dictTraversable: 
    let
      traverse2 = traverse dictTraversable;
      sequence2 = sequence dictTraversable;
      functorCoproduct = module."Data.Functor.Coproduct".functorCoproduct (dictTraversable."Functor0" module."Prim".undefined);
      foldableCoproduct = module."Data.Foldable".foldableCoproduct (dictTraversable."Foldable1" module."Prim".undefined);
    in
      dictTraversable1: 
      let
        traverse3 = traverse dictTraversable1;
        sequence3 = sequence dictTraversable1;
        functorCoproduct1 = functorCoproduct (dictTraversable1."Functor0" module."Prim".undefined);
        foldableCoproduct1 = foldableCoproduct (dictTraversable1."Foldable1" module."Prim".undefined);
      in
        
        { traverse = dictApplicative: 
            let
              map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
              traverse4 = traverse2 dictApplicative;
              traverse5 = traverse3 dictApplicative;
            in
              f: module."Data.Functor.Coproduct".coproduct (compose (map (compose module."Data.Functor.Coproduct".Coproduct module."Data.Either".Left)) (traverse4 f)) (compose (map (compose module."Data.Functor.Coproduct".Coproduct module."Data.Either".Right)) (traverse5 f));
          sequence = dictApplicative: 
            let
              map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
            in
              module."Data.Functor.Coproduct".coproduct (compose (map (compose module."Data.Functor.Coproduct".Coproduct module."Data.Either".Left)) (sequence2 dictApplicative)) (compose (map (compose module."Data.Functor.Coproduct".Coproduct module."Data.Either".Right)) (sequence3 dictApplicative));
          "Functor0" = _: functorCoproduct1;
          "Foldable1" = _: foldableCoproduct1;
        };
  traversableFirst = 
    { traverse = dictApplicative: 
        let
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
          traverse2 = traverse1 dictApplicative;
        in
          f: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                x = v;
              in
                map module."Data.Maybe.First".First (traverse2 f1 x);
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 121:1 - 123:44";
          in
            __pattern0 __patternFail;
      sequence = dictApplicative: 
        let
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
          sequence2 = sequence1 dictApplicative;
        in
          v: 
          let
            __pattern0 = __fail: 
              let
                x = v;
              in
                map module."Data.Maybe.First".First (sequence2 x);
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 121:1 - 123:44";
          in
            __pattern0 __patternFail;
      "Functor0" = _: module."Data.Maybe.First".functorFirst;
      "Foldable1" = _: module."Data.Foldable".foldableFirst;
    };
  traversableLast = 
    { traverse = dictApplicative: 
        let
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
          traverse2 = traverse1 dictApplicative;
        in
          f: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                x = v;
              in
                map module."Data.Maybe.Last".Last (traverse2 f1 x);
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 125:1 - 127:42";
          in
            __pattern0 __patternFail;
      sequence = dictApplicative: 
        let
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
          sequence2 = sequence1 dictApplicative;
        in
          v: 
          let
            __pattern0 = __fail: 
              let
                x = v;
              in
                map module."Data.Maybe.Last".Last (sequence2 x);
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 125:1 - 127:42";
          in
            __pattern0 __patternFail;
      "Functor0" = _: module."Data.Maybe.Last".functorLast;
      "Foldable1" = _: module."Data.Foldable".foldableLast;
    };
  traversableProduct = dictTraversable: 
    let
      traverse2 = traverse dictTraversable;
      sequence2 = sequence dictTraversable;
      functorProduct = module."Data.Functor.Product".functorProduct (dictTraversable."Functor0" module."Prim".undefined);
      foldableProduct = module."Data.Foldable".foldableProduct (dictTraversable."Foldable1" module."Prim".undefined);
    in
      dictTraversable1: 
      let
        traverse3 = traverse dictTraversable1;
        sequence3 = sequence dictTraversable1;
        functorProduct1 = functorProduct (dictTraversable1."Functor0" module."Prim".undefined);
        foldableProduct1 = foldableProduct (dictTraversable1."Foldable1" module."Prim".undefined);
      in
        
        { traverse = dictApplicative: 
            let
              lift2 = module."Control.Apply".lift2 (dictApplicative."Apply0" module."Prim".undefined);
              traverse4 = traverse2 dictApplicative;
              traverse5 = traverse3 dictApplicative;
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
                        lift2 module."Data.Functor.Product".product (traverse4 f1 fa) (traverse5 f1 ga)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 167:1 - 169:79";
              in
                __pattern0 __patternFail;
          sequence = dictApplicative: 
            let
              lift2 = module."Control.Apply".lift2 (dictApplicative."Apply0" module."Prim".undefined);
              sequence4 = sequence2 dictApplicative;
              sequence5 = sequence3 dictApplicative;
            in
              v: 
              let
                __pattern0 = __fail: 
                  if v.__tag == "Tuple"
                    then 
                      let
                        fa = v.__field0;
                        ga = v.__field1;
                      in
                        lift2 module."Data.Functor.Product".product (sequence4 fa) (sequence5 ga)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 167:1 - 169:79";
              in
                __pattern0 __patternFail;
          "Functor0" = _: functorProduct1;
          "Foldable1" = _: foldableProduct1;
        };
  traverseDefault = dictTraversable: 
    let
      sequence2 = sequence dictTraversable;
      map = module."Data.Functor".map (dictTraversable."Functor0" module."Prim".undefined);
    in
      dictApplicative: 
      let
        sequence3 = sequence2 dictApplicative;
      in
        f: ta: sequence3 (map f ta);
  mapAccumR = dictTraversable: 
    let
      traverse2 = traverse dictTraversable module."Data.Traversable.Accum.Internal".applicativeStateR;
    in
      f: s0: xs: module."Data.Traversable.Accum.Internal".stateR (traverse2 (a: s: f s a) xs) s0;
  scanr = dictTraversable: 
    let
      mapAccumR1 = mapAccumR dictTraversable;
    in
      f: b0: xs: 
      ( mapAccumR1 
        ( b: a: 
          let
            b' = f a b;
          in
            
            { accum = b';
              value = b';
            }
        ) b0 xs
      ).value;
  mapAccumL = dictTraversable: 
    let
      traverse2 = traverse dictTraversable module."Data.Traversable.Accum.Internal".applicativeStateL;
    in
      f: s0: xs: module."Data.Traversable.Accum.Internal".stateL (traverse2 (a: s: f s a) xs) s0;
  scanl = dictTraversable: 
    let
      mapAccumL1 = mapAccumL dictTraversable;
    in
      f: b0: xs: 
      ( mapAccumL1 
        ( b: a: 
          let
            b' = f b a;
          in
            
            { accum = b';
              value = b';
            }
        ) b0 xs
      ).value;
  for = dictApplicative: dictTraversable: 
    let
      traverse2 = traverse dictTraversable dictApplicative;
    in
      x: f: traverse2 f x;
in
  
  { inherit traverse sequence traverseDefault sequenceDefault for scanl scanr mapAccumL mapAccumR traversableArray traversableMaybe traversableFirst traversableLast traversableAdditive traversableDual traversableConj traversableDisj traversableMultiplicative traversableEither traversableTuple traversableIdentity traversableConst traversableProduct traversableCoproduct traversableCompose traversableApp;
    inherit (module."Data.Foldable") all and any elem find fold foldMap foldMapDefaultL foldMapDefaultR foldl foldlDefault foldr foldrDefault for_ intercalate maximum maximumBy minimum minimumBy notElem oneOf or- sequence_ sum traverse_;
    inherit (module."Data.Traversable.Accum");
  }