
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Category" = import ../Control.Category;
      "Control.Plus" = import ../Control.Plus;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Const" = import ../Data.Const;
      "Data.Either" = import ../Data.Either;
      "Data.Eq" = import ../Data.Eq;
      "Data.Function" = import ../Data.Function;
      "Data.Functor.App" = import ../Data.Functor.App;
      "Data.Functor.Compose" = import ../Data.Functor.Compose;
      "Data.Functor.Coproduct" = import ../Data.Functor.Coproduct;
      "Data.Functor.Product" = import ../Data.Functor.Product;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
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
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unit" = import ../Data.Unit;
      "Prelude" = import ../Prelude;
    };
  foreign = import ./foreign.nix;
  foldrArray = foreign.foldrArray;
  foldlArray = foreign.foldlArray;
  eq = module."Data.Eq".eq module."Data.Eq".eqInt;
  add = module."Data.Semiring".add module."Data.Semiring".semiringInt;
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  identity = module."Control.Category".identity module."Control.Category".categoryFn;
  eq1 = module."Data.Eq".eq module."Data.Ordering".eqOrdering;
  unwrap = module."Data.Newtype".unwrap module."Prim".undefined;
  monoidEndo = module."Data.Monoid.Endo".monoidEndo module."Control.Category".categoryFn;
  monoidDual = module."Data.Monoid.Dual".monoidDual monoidEndo;
  alaF = module."Data.Newtype".alaF module."Prim".undefined module."Prim".undefined module."Prim".undefined module."Prim".undefined;
  not = module."Data.HeytingAlgebra".not module."Data.HeytingAlgebra".heytingAlgebraBoolean;
  Foldable-Dict = x: x;
  foldr = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.foldr;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 74:3 - 74:54";
    in
      __pattern0 __patternFail;
  indexr = dictFoldable: 
    let
      foldr2 = foldr dictFoldable;
    in
      idx: 
      let
        go = a: cursor: 
          let
            __pattern0 = __fail: if cursor.elem.__tag == "Just" then cursor else __fail;
            __pattern1 = __fail: 
              let
                __pattern0 = __fail: 
                  if eq cursor.pos idx
                    then 
                      { elem = module."Data.Maybe".Just a;
                        pos = cursor.pos;
                      }
                    else __fail;
                __pattern1 = __fail: 
                  { pos = add cursor.pos 1;
                    elem = cursor.elem;
                  };
                __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 413:9 - 415:58";
              in
                __pattern0 (__pattern1 __patternFail);
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 410:5 - 415:58";
          in
            __pattern0 (__pattern1 __patternFail);
      in
        compose (v: v.elem) 
        ( foldr2 go 
          { elem = module."Data.Maybe".Nothing;
            pos = 0;
          }
        );
  null = dictFoldable: foldr dictFoldable (v: v1: false) true;
  oneOf = dictFoldable: 
    let
      foldr2 = foldr dictFoldable;
    in
      dictPlus: foldr2 (module."Control.Alt".alt (dictPlus."Alt0" module."Prim".undefined)) (module."Control.Plus".empty dictPlus);
  oneOfMap = dictFoldable: 
    let
      foldr2 = foldr dictFoldable;
    in
      dictPlus: 
      let
        alt = module."Control.Alt".alt (dictPlus."Alt0" module."Prim".undefined);
        empty = module."Control.Plus".empty dictPlus;
      in
        f: foldr2 (compose alt f) empty;
  traverse_ = dictApplicative: 
    let
      applySecond = module."Control.Apply".applySecond (dictApplicative."Apply0" module."Prim".undefined);
      pure = module."Control.Applicative".pure dictApplicative;
    in
      dictFoldable: 
      let
        foldr2 = foldr dictFoldable;
      in
        f: foldr2 (compose applySecond f) (pure module."Data.Unit".unit);
  for_ = dictApplicative: 
    let
      traverse_1 = traverse_ dictApplicative;
    in
      dictFoldable: module."Data.Function".flip (traverse_1 dictFoldable);
  sequence_ = dictApplicative: 
    let
      traverse_1 = traverse_ dictApplicative;
    in
      dictFoldable: traverse_1 dictFoldable identity;
  foldl = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.foldl;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 75:3 - 75:54";
    in
      __pattern0 __patternFail;
  indexl = dictFoldable: 
    let
      foldl2 = foldl dictFoldable;
    in
      idx: 
      let
        go = cursor: a: 
          let
            __pattern0 = __fail: if cursor.elem.__tag == "Just" then cursor else __fail;
            __pattern1 = __fail: 
              let
                __pattern0 = __fail: 
                  if eq cursor.pos idx
                    then 
                      { elem = module."Data.Maybe".Just a;
                        pos = cursor.pos;
                      }
                    else __fail;
                __pattern1 = __fail: 
                  { pos = add cursor.pos 1;
                    elem = cursor.elem;
                  };
                __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 401:9 - 403:58";
              in
                __pattern0 (__pattern1 __patternFail);
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 398:5 - 403:58";
          in
            __pattern0 (__pattern1 __patternFail);
      in
        compose (v: v.elem) 
        ( foldl2 go 
          { elem = module."Data.Maybe".Nothing;
            pos = 0;
          }
        );
  intercalate = dictFoldable: 
    let
      foldl2 = foldl dictFoldable;
    in
      dictMonoid: 
      let
        append = module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined);
        mempty = module."Data.Monoid".mempty dictMonoid;
      in
        sep: xs: 
        let
          go = v: x: 
            let
              __pattern0 = __fail: 
                if v.init
                  then 
                    let
                      x1 = x;
                    in
                      
                      { init = false;
                        acc = x1;
                      }
                  else __fail;
              __pattern1 = __fail: 
                let
                  acc = v.acc;
                  x1 = x;
                in
                  
                  { init = false;
                    acc = append acc (append sep x1);
                  };
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 311:3 - 311:48";
            in
              __pattern0 (__pattern1 __patternFail);
        in
          
          ( foldl2 go 
            { init = true;
              acc = mempty;
            } xs
          ).acc;
  length = dictFoldable: 
    let
      foldl2 = foldl dictFoldable;
    in
      dictSemiring: 
      let
        add1 = module."Data.Semiring".add dictSemiring;
        one = module."Data.Semiring".one dictSemiring;
      in
        foldl2 (c: v: add1 one c) (module."Data.Semiring".zero dictSemiring);
  maximumBy = dictFoldable: 
    let
      foldl2 = foldl dictFoldable;
    in
      cmp: 
      let
        max' = v: v1: 
          let
            __pattern0 = __fail: 
              if v.__tag == "Nothing"
                then 
                  let
                    x = v1;
                  in
                    module."Data.Maybe".Just x
                else __fail;
            __pattern1 = __fail: 
              if v.__tag == "Just"
                then 
                  let
                    x = v.__field0;
                    y = v1;
                  in
                    module."Data.Maybe".Just 
                    ( 
                      let
                        __pattern0 = __fail: if eq1 (cmp x y) module."Data.Ordering".GT then x else __fail;
                        __pattern1 = __fail: y;
                        __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 442:27 - 442:57";
                      in
                        __pattern0 (__pattern1 __patternFail)
                    )
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 441:3 - 441:27";
          in
            __pattern0 (__pattern1 __patternFail);
      in
        foldl2 max' module."Data.Maybe".Nothing;
  maximum = dictOrd: 
    let
      compare = module."Data.Ord".compare dictOrd;
    in
      dictFoldable: maximumBy dictFoldable compare;
  minimumBy = dictFoldable: 
    let
      foldl2 = foldl dictFoldable;
    in
      cmp: 
      let
        min' = v: v1: 
          let
            __pattern0 = __fail: 
              if v.__tag == "Nothing"
                then 
                  let
                    x = v1;
                  in
                    module."Data.Maybe".Just x
                else __fail;
            __pattern1 = __fail: 
              if v.__tag == "Just"
                then 
                  let
                    x = v.__field0;
                    y = v1;
                  in
                    module."Data.Maybe".Just 
                    ( 
                      let
                        __pattern0 = __fail: if eq1 (cmp x y) module."Data.Ordering".LT then x else __fail;
                        __pattern1 = __fail: y;
                        __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 455:27 - 455:57";
                      in
                        __pattern0 (__pattern1 __patternFail)
                    )
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 454:3 - 454:27";
          in
            __pattern0 (__pattern1 __patternFail);
      in
        foldl2 min' module."Data.Maybe".Nothing;
  minimum = dictOrd: 
    let
      compare = module."Data.Ord".compare dictOrd;
    in
      dictFoldable: minimumBy dictFoldable compare;
  product = dictFoldable: 
    let
      foldl2 = foldl dictFoldable;
    in
      dictSemiring: foldl2 (module."Data.Semiring".mul dictSemiring) (module."Data.Semiring".one dictSemiring);
  sum = dictFoldable: 
    let
      foldl2 = foldl dictFoldable;
    in
      dictSemiring: foldl2 (module."Data.Semiring".add dictSemiring) (module."Data.Semiring".zero dictSemiring);
  foldableTuple = 
    { foldr = f: z: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  z1 = z;
                  x = v.__field1;
                in
                  f1 x z1
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 189:1 - 192:30";
        in
          __pattern0 __patternFail;
      foldl = f: z: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  z1 = z;
                  x = v.__field1;
                in
                  f1 z1 x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 189:1 - 192:30";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  x = v.__field1;
                in
                  f1 x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 189:1 - 192:30";
        in
          __pattern0 __patternFail;
    };
  foldableMultiplicative = 
    { foldr = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 x z1;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 176:1 - 179:37";
        in
          __pattern0 __patternFail;
      foldl = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 176:1 - 179:37";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 176:1 - 179:37";
        in
          __pattern0 __patternFail;
    };
  foldableMaybe = 
    { foldr = v: z: v1: 
        let
          __pattern0 = __fail: 
            if v1.__tag == "Nothing"
              then 
                let
                  z1 = z;
                in
                  z1
              else __fail;
          __pattern1 = __fail: 
            if v1.__tag == "Just"
              then 
                let
                  f = v;
                  z1 = z;
                  x = v1.__field0;
                in
                  f x z1
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 138:1 - 144:27";
        in
          __pattern0 (__pattern1 __patternFail);
      foldl = v: z: v1: 
        let
          __pattern0 = __fail: 
            if v1.__tag == "Nothing"
              then 
                let
                  z1 = z;
                in
                  z1
              else __fail;
          __pattern1 = __fail: 
            if v1.__tag == "Just"
              then 
                let
                  f = v;
                  z1 = z;
                  x = v1.__field0;
                in
                  f z1 x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 138:1 - 144:27";
        in
          __pattern0 (__pattern1 __patternFail);
      foldMap = dictMonoid: 
        let
          mempty = module."Data.Monoid".mempty dictMonoid;
        in
          v: v1: 
          let
            __pattern0 = __fail: if v1.__tag == "Nothing" then mempty else __fail;
            __pattern1 = __fail: 
              if v1.__tag == "Just"
                then 
                  let
                    f = v;
                    x = v1.__field0;
                  in
                    f x
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 138:1 - 144:27";
          in
            __pattern0 (__pattern1 __patternFail);
    };
  foldr1 = foldr foldableMaybe;
  foldl1 = foldl foldableMaybe;
  foldableIdentity = 
    { foldr = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 x z1;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 194:1 - 197:31";
        in
          __pattern0 __patternFail;
      foldl = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 194:1 - 197:31";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 194:1 - 197:31";
        in
          __pattern0 __patternFail;
    };
  foldableEither = 
    { foldr = v: z: v1: 
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
                  f x z1
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 181:1 - 187:28";
        in
          __pattern0 (__pattern1 __patternFail);
      foldl = v: z: v1: 
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
                  f z1 x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 181:1 - 187:28";
        in
          __pattern0 (__pattern1 __patternFail);
      foldMap = dictMonoid: 
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
                    f x
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 181:1 - 187:28";
          in
            __pattern0 (__pattern1 __patternFail);
    };
  foldableDual = 
    { foldr = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 x z1;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 161:1 - 164:27";
        in
          __pattern0 __patternFail;
      foldl = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 161:1 - 164:27";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 161:1 - 164:27";
        in
          __pattern0 __patternFail;
    };
  foldableDisj = 
    { foldr = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 x z1;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 166:1 - 169:27";
        in
          __pattern0 __patternFail;
      foldl = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 166:1 - 169:27";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 166:1 - 169:27";
        in
          __pattern0 __patternFail;
    };
  foldableConst = 
    { foldr = v: z: v1: z;
      foldl = v: z: v1: z;
      foldMap = dictMonoid: 
        let
          mempty = module."Data.Monoid".mempty dictMonoid;
        in
          v: v1: mempty;
    };
  foldableConj = 
    { foldr = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 x z1;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 171:1 - 174:27";
        in
          __pattern0 __patternFail;
      foldl = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 171:1 - 174:27";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 171:1 - 174:27";
        in
          __pattern0 __patternFail;
    };
  foldableAdditive = 
    { foldr = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 x z1;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 156:1 - 159:31";
        in
          __pattern0 __patternFail;
      foldl = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 156:1 - 159:31";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 156:1 - 159:31";
        in
          __pattern0 __patternFail;
    };
  foldMapDefaultR = dictFoldable: 
    let
      foldr2 = foldr dictFoldable;
    in
      dictMonoid: 
      let
        append = module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined);
        mempty = module."Data.Monoid".mempty dictMonoid;
      in
        f: foldr2 (x: acc: append (f x) acc) mempty;
  foldableArray = 
    { foldr = foldrArray;
      foldl = foldlArray;
      foldMap = dictMonoid: foldMapDefaultR foldableArray dictMonoid;
    };
  foldMapDefaultL = dictFoldable: 
    let
      foldl2 = foldl dictFoldable;
    in
      dictMonoid: 
      let
        append = module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined);
        mempty = module."Data.Monoid".mempty dictMonoid;
      in
        f: foldl2 (acc: x: append acc (f x)) mempty;
  foldMap = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.foldMap;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 76:3 - 76:58";
    in
      __pattern0 __patternFail;
  foldMap1 = foldMap foldableMaybe;
  foldableApp = dictFoldable: 
    let
      foldr2 = foldr dictFoldable;
      foldl2 = foldl dictFoldable;
      foldMap2 = foldMap dictFoldable;
    in
      
      { foldr = f: i: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                i1 = i;
                x = v;
              in
                foldr2 f1 i1 x;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 219:1 - 222:34";
          in
            __pattern0 __patternFail;
        foldl = f: i: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                i1 = i;
                x = v;
              in
                foldl2 f1 i1 x;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 219:1 - 222:34";
          in
            __pattern0 __patternFail;
        foldMap = dictMonoid: 
          let
            foldMap3 = foldMap2 dictMonoid;
          in
            f: v: 
            let
              __pattern0 = __fail: 
                let
                  f1 = f;
                  x = v;
                in
                  foldMap3 f1 x;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 219:1 - 222:34";
            in
              __pattern0 __patternFail;
      };
  foldableCompose = dictFoldable: 
    let
      foldr2 = foldr dictFoldable;
      foldl2 = foldl dictFoldable;
      foldMap2 = foldMap dictFoldable;
    in
      dictFoldable1: 
      let
        foldr3 = foldr dictFoldable1;
        foldl3 = foldl dictFoldable1;
        foldMap3 = foldMap dictFoldable1;
      in
        
        { foldr = f: i: v: 
            let
              __pattern0 = __fail: 
                let
                  f1 = f;
                  i1 = i;
                  fga = v;
                in
                  foldr2 (module."Data.Function".flip (foldr3 f1)) i1 fga;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 214:1 - 217:52";
            in
              __pattern0 __patternFail;
          foldl = f: i: v: 
            let
              __pattern0 = __fail: 
                let
                  f1 = f;
                  i1 = i;
                  fga = v;
                in
                  foldl2 (foldl3 f1) i1 fga;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 214:1 - 217:52";
            in
              __pattern0 __patternFail;
          foldMap = dictMonoid: 
            let
              foldMap4 = foldMap2 dictMonoid;
              foldMap5 = foldMap3 dictMonoid;
            in
              f: v: 
              let
                __pattern0 = __fail: 
                  let
                    f1 = f;
                    fga = v;
                  in
                    foldMap4 (foldMap5 f1) fga;
                __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 214:1 - 217:52";
              in
                __pattern0 __patternFail;
        };
  foldableCoproduct = dictFoldable: 
    let
      foldr2 = foldr dictFoldable;
      foldl2 = foldl dictFoldable;
      foldMap2 = foldMap dictFoldable;
    in
      dictFoldable1: 
      let
        foldr3 = foldr dictFoldable1;
        foldl3 = foldl dictFoldable1;
        foldMap3 = foldMap dictFoldable1;
      in
        
        { foldr = f: z: module."Data.Functor.Coproduct".coproduct (foldr2 f z) (foldr3 f z);
          foldl = f: z: module."Data.Functor.Coproduct".coproduct (foldl2 f z) (foldl3 f z);
          foldMap = dictMonoid: 
            let
              foldMap4 = foldMap2 dictMonoid;
              foldMap5 = foldMap3 dictMonoid;
            in
              f: module."Data.Functor.Coproduct".coproduct (foldMap4 f) (foldMap5 f);
        };
  foldableFirst = 
    { foldr = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              foldr1 f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 146:1 - 149:36";
        in
          __pattern0 __patternFail;
      foldl = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              foldl1 f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 146:1 - 149:36";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: 
        let
          foldMap2 = foldMap1 dictMonoid;
        in
          f: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                x = v;
              in
                foldMap2 f1 x;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 146:1 - 149:36";
          in
            __pattern0 __patternFail;
    };
  foldableLast = 
    { foldr = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              foldr1 f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 151:1 - 154:35";
        in
          __pattern0 __patternFail;
      foldl = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              foldl1 f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 151:1 - 154:35";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: 
        let
          foldMap2 = foldMap1 dictMonoid;
        in
          f: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                x = v;
              in
                foldMap2 f1 x;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 151:1 - 154:35";
          in
            __pattern0 __patternFail;
    };
  foldableProduct = dictFoldable: 
    let
      foldr2 = foldr dictFoldable;
      foldl2 = foldl dictFoldable;
      foldMap2 = foldMap dictFoldable;
    in
      dictFoldable1: 
      let
        foldr3 = foldr dictFoldable1;
        foldl3 = foldl dictFoldable1;
        foldMap3 = foldMap dictFoldable1;
      in
        
        { foldr = f: z: v: 
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
                      foldr2 f1 (foldr3 f1 z1 ga) fa
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 204:1 - 207:67";
            in
              __pattern0 __patternFail;
          foldl = f: z: v: 
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
                      foldl3 f1 (foldl2 f1 z1 fa) ga
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 204:1 - 207:67";
            in
              __pattern0 __patternFail;
          foldMap = dictMonoid: 
            let
              append = module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined);
              foldMap4 = foldMap2 dictMonoid;
              foldMap5 = foldMap3 dictMonoid;
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
                        append (foldMap4 f1 fa) (foldMap5 f1 ga)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 204:1 - 207:67";
              in
                __pattern0 __patternFail;
        };
  foldlDefault = dictFoldable: 
    let
      foldMap2 = foldMap dictFoldable monoidDual;
    in
      c: u: xs: unwrap (unwrap (foldMap2 (compose module."Data.Monoid.Dual".Dual (compose module."Data.Monoid.Endo".Endo (module."Data.Function".flip c))) xs)) u;
  foldrDefault = dictFoldable: 
    let
      foldMap2 = foldMap dictFoldable monoidEndo;
    in
      c: u: xs: unwrap (foldMap2 (compose module."Data.Monoid.Endo".Endo c) xs) u;
  lookup = dictFoldable: 
    let
      foldMap2 = foldMap dictFoldable module."Data.Maybe.First".monoidFirst;
    in
      dictEq: 
      let
        eq2 = module."Data.Eq".eq dictEq;
      in
        a: compose unwrap 
        ( foldMap2 
          ( v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Tuple"
                  then 
                    let
                      a' = v.__field0;
                      b = v.__field1;
                    in
                      
                      let
                        __pattern0 = __fail: if eq2 a a' then module."Data.Maybe".Just b else __fail;
                        __pattern1 = __fail: module."Data.Maybe".Nothing;
                        __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 471:55 - 471:90";
                      in
                        __pattern0 (__pattern1 __patternFail)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 471:31 - 471:91";
            in
              __pattern0 __patternFail
          )
        );
  surroundMap = dictFoldable: 
    let
      foldMap2 = foldMap dictFoldable monoidEndo;
    in
      dictSemigroup: 
      let
        append = module."Data.Semigroup".append dictSemigroup;
      in
        d: t: f: 
        let
          joined = a: m: append d (append (t a) m);
        in
          unwrap (foldMap2 joined f) d;
  surround = dictFoldable: 
    let
      surroundMap1 = surroundMap dictFoldable;
    in
      dictSemigroup: 
      let
        surroundMap2 = surroundMap1 dictSemigroup;
      in
        d: surroundMap2 d identity;
  foldM = dictFoldable: 
    let
      foldl2 = foldl dictFoldable;
    in
      dictMonad: 
      let
        bind = module."Control.Bind".bind (dictMonad."Bind1" module."Prim".undefined);
        pure = module."Control.Applicative".pure (dictMonad."Applicative0" module."Prim".undefined);
      in
        f: b0: foldl2 (b: a: bind b (module."Data.Function".flip f a)) (pure b0);
  fold = dictFoldable: 
    let
      foldMap2 = foldMap dictFoldable;
    in
      dictMonoid: foldMap2 dictMonoid identity;
  findMap = dictFoldable: 
    let
      foldl2 = foldl dictFoldable;
    in
      p: 
      let
        go = v: v1: 
          let
            __pattern0 = __fail: 
              if v.__tag == "Nothing"
                then 
                  let
                    x = v1;
                  in
                    p x
                else __fail;
            __pattern1 = __fail: 
              let
                r = v;
              in
                r;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 428:3 - 428:21";
          in
            __pattern0 (__pattern1 __patternFail);
      in
        foldl2 go module."Data.Maybe".Nothing;
  find = dictFoldable: 
    let
      foldl2 = foldl dictFoldable;
    in
      p: 
      let
        go = v: v1: 
          let
            __pattern0 = __fail: 
              if v.__tag == "Nothing"
                then 
                  let
                    x = v1;
                  in
                    if p x then module."Data.Maybe".Just x else __fail
                else __fail;
            __pattern1 = __fail: 
              let
                r = v;
              in
                r;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 421:3 - 421:30";
          in
            __pattern0 (__pattern1 __patternFail);
      in
        foldl2 go module."Data.Maybe".Nothing;
  any = dictFoldable: 
    let
      foldMap2 = foldMap dictFoldable;
    in
      dictHeytingAlgebra: alaF module."Data.Monoid.Disj".Disj (foldMap2 (module."Data.Monoid.Disj".monoidDisj dictHeytingAlgebra));
  elem = dictFoldable: 
    let
      any1 = any dictFoldable module."Data.HeytingAlgebra".heytingAlgebraBoolean;
    in
      dictEq: compose any1 (module."Data.Eq".eq dictEq);
  notElem = dictFoldable: 
    let
      elem1 = elem dictFoldable;
    in
      dictEq: 
      let
        elem2 = elem1 dictEq;
      in
        x: compose not (elem2 x);
  or- = dictFoldable: 
    let
      any1 = any dictFoldable;
    in
      dictHeytingAlgebra: any1 dictHeytingAlgebra identity;
  all = dictFoldable: 
    let
      foldMap2 = foldMap dictFoldable;
    in
      dictHeytingAlgebra: alaF module."Data.Monoid.Conj".Conj (foldMap2 (module."Data.Monoid.Conj".monoidConj dictHeytingAlgebra));
  and = dictFoldable: 
    let
      all1 = all dictFoldable;
    in
      dictHeytingAlgebra: all1 dictHeytingAlgebra identity;
in
  {inherit foldr foldl foldMap foldrDefault foldlDefault foldMapDefaultL foldMapDefaultR fold foldM traverse_ for_ sequence_ oneOf oneOfMap intercalate surroundMap surround and or- all any sum product elem notElem indexl indexr find findMap maximum maximumBy minimum minimumBy null length lookup foldableArray foldableMaybe foldableFirst foldableLast foldableAdditive foldableDual foldableDisj foldableConj foldableMultiplicative foldableEither foldableTuple foldableIdentity foldableConst foldableProduct foldableCoproduct foldableCompose foldableApp;}