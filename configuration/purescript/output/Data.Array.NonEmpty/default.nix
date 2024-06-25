
let
  module = 
    { "Control.Alternative" = import ../Control.Alternative;
      "Control.Bind" = import ../Control.Bind;
      "Control.Lazy" = import ../Control.Lazy;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Array" = import ../Data.Array;
      "Data.Array.NonEmpty.Internal" = import ../Data.Array.NonEmpty.Internal;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Boolean" = import ../Data.Boolean;
      "Data.Eq" = import ../Data.Eq;
      "Data.Foldable" = import ../Data.Foldable;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.NonEmpty" = import ../Data.NonEmpty;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ring" = import ../Data.Ring;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Semigroup.Foldable" = import ../Data.Semigroup.Foldable;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unfoldable" = import ../Data.Unfoldable;
      "Data.Unfoldable1" = import ../Data.Unfoldable1;
      "Partial.Unsafe" = import ../Partial.Unsafe;
      "Prelude" = import ../Prelude;
      "Prim.TypeError" = import ../Prim.TypeError;
      "Unsafe.Coerce" = import ../Unsafe.Coerce;
    };
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  max = module."Data.Ord".max module."Data.Ord".ordInt;
  intercalate1 = module."Data.Semigroup.Foldable".intercalate module."Data.Array.NonEmpty.Internal".foldable1NonEmptyArray;
  greaterThan = module."Data.Ord".greaterThan module."Data.Ord".ordInt;
  foldMap11 = module."Data.Semigroup.Foldable".foldMap1 module."Data.Array.NonEmpty.Internal".foldable1NonEmptyArray;
  fold11 = module."Data.Semigroup.Foldable".fold1 module."Data.Array.NonEmpty.Internal".foldable1NonEmptyArray;
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupArray;
  fromJust = module."Data.Maybe".fromJust module."Prim".undefined;
  unsafeIndex1 = module."Data.Array".unsafeIndex module."Prim".undefined;
  lessThan = module."Data.Ord".lessThan module."Data.Ord".ordInt;
  sub = module."Data.Ring".sub module."Data.Ring".ringInt;
  add = module."Data.Semiring".add module."Data.Semiring".semiringInt;
  unsafeFromArrayF = module."Unsafe.Coerce".unsafeCoerce;
  unsafeFromArray = module."Data.Array.NonEmpty.Internal".NonEmptyArray;
  toArray = v: 
    let
      __pattern0 = __fail: 
        let
          xs = v;
        in
          xs;
      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/NonEmpty.purs at 174:1 - 174:48";
    in
      __pattern0 __patternFail;
  unionBy' = eq: xs: compose unsafeFromArray (module."Data.Array".unionBy eq (toArray xs));
  union' = dictEq: unionBy' (module."Data.Eq".eq dictEq);
  unionBy = eq: xs: compose (unionBy' eq xs) toArray;
  union = dictEq: unionBy (module."Data.Eq".eq dictEq);
  unzip = compose (module."Data.Bifunctor".bimap module."Data.Bifunctor".bifunctorTuple unsafeFromArray unsafeFromArray) (compose module."Data.Array".unzip toArray);
  updateAt = i: x: compose unsafeFromArrayF (compose (module."Data.Array".updateAt i x) toArray);
  zip = xs: ys: unsafeFromArray (module."Data.Array".zip (toArray xs) (toArray ys));
  zipWith = f: xs: ys: unsafeFromArray (module."Data.Array".zipWith f (toArray xs) (toArray ys));
  zipWithA = dictApplicative: 
    let
      zipWithA1 = module."Data.Array".zipWithA dictApplicative;
    in
      f: xs: ys: unsafeFromArrayF (zipWithA1 f (toArray xs) (toArray ys));
  splitAt = i: xs: module."Data.Array".splitAt i (toArray xs);
  some = dictAlternative: 
    let
      some1 = module."Data.Array".some dictAlternative;
    in
      dictLazy: compose unsafeFromArrayF (some1 dictLazy);
  snoc' = xs: x: unsafeFromArray (module."Data.Array".snoc xs x);
  snoc = xs: x: unsafeFromArray (module."Data.Array".snoc (toArray xs) x);
  singleton = compose unsafeFromArray module."Data.Array".singleton;
  replicate = i: x: unsafeFromArray (module."Data.Array".replicate (max 1 i) x);
  range = x: y: unsafeFromArray (module."Data.Array".range x y);
  modifyAt = i: f: compose unsafeFromArrayF (compose (module."Data.Array".modifyAt i f) toArray);
  intersectBy' = eq: xs: module."Data.Array".intersectBy eq (toArray xs);
  intersectBy = eq: xs: compose (intersectBy' eq xs) toArray;
  intersect' = dictEq: intersectBy' (module."Data.Eq".eq dictEq);
  intersect = dictEq: intersectBy (module."Data.Eq".eq dictEq);
  intercalate = dictSemigroup: intercalate1 dictSemigroup;
  insertAt = i: x: compose unsafeFromArrayF (compose (module."Data.Array".insertAt i x) toArray);
  fromFoldable1 = dictFoldable1: compose unsafeFromArray (module."Data.Array".fromFoldable (dictFoldable1."Foldable0" module."Prim".undefined));
  fromArray = xs: 
    let
      __pattern0 = __fail: 
        let
          xs1 = xs;
        in
          if greaterThan (module."Data.Array".length xs1) 0 then module."Data.Maybe".Just (unsafeFromArray xs1) else if module."Data.Boolean".otherwise then module."Data.Maybe".Nothing else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/NonEmpty.purs at 159:1 - 159:58";
    in
      __pattern0 __patternFail;
  fromFoldable = dictFoldable: compose fromArray (module."Data.Array".fromFoldable dictFoldable);
  foldr1 = module."Data.Semigroup.Foldable".foldr1 module."Data.Array.NonEmpty.Internal".foldable1NonEmptyArray;
  foldl1 = module."Data.Semigroup.Foldable".foldl1 module."Data.Array.NonEmpty.Internal".foldable1NonEmptyArray;
  foldMap1 = dictSemigroup: foldMap11 dictSemigroup;
  fold1 = dictSemigroup: fold11 dictSemigroup;
  difference' = dictEq: 
    let
      difference1 = module."Data.Array".difference dictEq;
    in
      xs: difference1 (toArray xs);
  cons' = x: xs: unsafeFromArray (module."Data.Array".cons x xs);
  fromNonEmpty = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "NonEmpty"
          then 
            let
              x = v.__field0;
              xs = v.__field1;
            in
              cons' x xs
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/NonEmpty.purs at 171:1 - 171:62";
    in
      __pattern0 __patternFail;
  concatMap = module."Data.Function".flip (module."Control.Bind".bind module."Data.Array.NonEmpty.Internal".bindNonEmptyArray);
  concat = compose unsafeFromArray (compose module."Data.Array".concat (compose toArray (module."Data.Functor".map module."Data.Array.NonEmpty.Internal".functorNonEmptyArray toArray)));
  appendArray = xs: ys: unsafeFromArray (append (toArray xs) ys);
  alterAt = i: f: compose (module."Data.Array".alterAt i f) toArray;
  adaptMaybe = f: module."Partial.Unsafe".unsafePartial (_: compose fromJust (compose f toArray));
  head = adaptMaybe module."Data.Array".head;
  init = adaptMaybe module."Data.Array".init;
  last = adaptMaybe module."Data.Array".last;
  tail = adaptMaybe module."Data.Array".tail;
  uncons = adaptMaybe module."Data.Array".uncons;
  toNonEmpty = module."Control.Semigroupoid".composeFlipped module."Control.Semigroupoid".semigroupoidFn uncons 
    ( v: 
      let
        __pattern0 = __fail: 
          let
            x = v.head;
            xs = v.tail;
          in
            module."Data.NonEmpty".NonEmpty x xs;
        __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/NonEmpty.purs at 178:25 - 178:56";
      in
        __pattern0 __patternFail
    );
  unsnoc = adaptMaybe module."Data.Array".unsnoc;
  adaptAny = f: compose f toArray;
  all = p: adaptAny (module."Data.Array".all p);
  any = p: adaptAny (module."Data.Array".any p);
  catMaybes = adaptAny module."Data.Array".catMaybes;
  delete = dictEq: 
    let
      delete1 = module."Data.Array".delete dictEq;
    in
      x: adaptAny (delete1 x);
  deleteAt = i: adaptAny (module."Data.Array".deleteAt i);
  deleteBy = f: x: adaptAny (module."Data.Array".deleteBy f x);
  difference = dictEq: 
    let
      difference'1 = difference' dictEq;
    in
      xs: adaptAny (difference'1 xs);
  drop = i: adaptAny (module."Data.Array".drop i);
  dropEnd = i: adaptAny (module."Data.Array".dropEnd i);
  dropWhile = f: adaptAny (module."Data.Array".dropWhile f);
  elem = dictEq: 
    let
      elem1 = module."Data.Array".elem dictEq;
    in
      x: adaptAny (elem1 x);
  elemIndex = dictEq: 
    let
      elemIndex1 = module."Data.Array".elemIndex dictEq;
    in
      x: adaptAny (elemIndex1 x);
  elemLastIndex = dictEq: 
    let
      elemLastIndex1 = module."Data.Array".elemLastIndex dictEq;
    in
      x: adaptAny (elemLastIndex1 x);
  filter = f: adaptAny (module."Data.Array".filter f);
  filterA = dictApplicative: 
    let
      filterA1 = module."Data.Array".filterA dictApplicative;
    in
      f: adaptAny (filterA1 f);
  find = p: adaptAny (module."Data.Array".find p);
  findIndex = p: adaptAny (module."Data.Array".findIndex p);
  findLastIndex = x: adaptAny (module."Data.Array".findLastIndex x);
  findMap = p: adaptAny (module."Data.Array".findMap p);
  foldM = dictMonad: 
    let
      foldM1 = module."Data.Array".foldM dictMonad;
    in
      f: acc: adaptAny (foldM1 f acc);
  index = adaptAny module."Data.Array".index;
  length = adaptAny module."Data.Array".length;
  mapMaybe = f: adaptAny (module."Data.Array".mapMaybe f);
  notElem = dictEq: 
    let
      notElem1 = module."Data.Array".notElem dictEq;
    in
      x: adaptAny (notElem1 x);
  partition = f: adaptAny (module."Data.Array".partition f);
  slice = start: end: adaptAny (module."Data.Array".slice start end);
  span = f: adaptAny (module."Data.Array".span f);
  take = i: adaptAny (module."Data.Array".take i);
  takeEnd = i: adaptAny (module."Data.Array".takeEnd i);
  takeWhile = f: adaptAny (module."Data.Array".takeWhile f);
  toUnfoldable = dictUnfoldable: adaptAny (module."Data.Array".toUnfoldable dictUnfoldable);
  unsafeAdapt = f: compose unsafeFromArray (adaptAny f);
  cons = x: unsafeAdapt (module."Data.Array".cons x);
  group = dictEq: unsafeAdapt (module."Data.Array".group dictEq);
  group' = _: dictOrd: unsafeAdapt (module."Data.Array".groupAll dictOrd);
  groupAllBy = op: unsafeAdapt (module."Data.Array".groupAllBy op);
  groupAll = dictOrd: groupAllBy (module."Data.Ord".compare dictOrd);
  groupBy = op: unsafeAdapt (module."Data.Array".groupBy op);
  insert = dictOrd: 
    let
      insert1 = module."Data.Array".insert dictOrd;
    in
      x: unsafeAdapt (insert1 x);
  insertBy = f: x: unsafeAdapt (module."Data.Array".insertBy f x);
  intersperse = x: unsafeAdapt (module."Data.Array".intersperse x);
  mapWithIndex = f: unsafeAdapt (module."Data.Array".mapWithIndex f);
  modifyAtIndices = dictFoldable: 
    let
      modifyAtIndices1 = module."Data.Array".modifyAtIndices dictFoldable;
    in
      is: f: unsafeAdapt (modifyAtIndices1 is f);
  nub = dictOrd: unsafeAdapt (module."Data.Array".nub dictOrd);
  nubBy = f: unsafeAdapt (module."Data.Array".nubBy f);
  nubByEq = f: unsafeAdapt (module."Data.Array".nubByEq f);
  nubEq = dictEq: unsafeAdapt (module."Data.Array".nubEq dictEq);
  reverse = unsafeAdapt module."Data.Array".reverse;
  scanl = f: x: unsafeAdapt (module."Data.Array".scanl f x);
  scanr = f: x: unsafeAdapt (module."Data.Array".scanr f x);
  sort = dictOrd: unsafeAdapt (module."Data.Array".sort dictOrd);
  sortBy = f: unsafeAdapt (module."Data.Array".sortBy f);
  sortWith = dictOrd: 
    let
      sortWith1 = module."Data.Array".sortWith dictOrd;
    in
      f: unsafeAdapt (sortWith1 f);
  updateAtIndices = dictFoldable: 
    let
      updateAtIndices1 = module."Data.Array".updateAtIndices dictFoldable;
    in
      pairs: unsafeAdapt (updateAtIndices1 pairs);
  unsafeIndex = _: adaptAny unsafeIndex1;
  unsafeIndex2 = unsafeIndex module."Prim".undefined;
  toUnfoldable1 = dictUnfoldable1: 
    let
      unfoldr1 = module."Data.Unfoldable1".unfoldr1 dictUnfoldable1;
    in
      xs: 
      let
        len = length xs;
        f = i: module."Data.Tuple".Tuple (module."Partial.Unsafe".unsafePartial (_: unsafeIndex2) xs i) 
          ( 
            let
              __pattern0 = __fail: if lessThan i (sub len 1) then module."Data.Maybe".Just (add i 1) else __fail;
              __pattern1 = __fail: module."Data.Maybe".Nothing;
              __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/NonEmpty.purs at 194:11 - 194:58";
            in
              __pattern0 (__pattern1 __patternFail)
          );
      in
        unfoldr1 f 0;
in
  
  { inherit fromArray fromNonEmpty toArray toNonEmpty fromFoldable fromFoldable1 toUnfoldable toUnfoldable1 singleton range replicate some length cons cons' snoc snoc' appendArray insert insertBy head last tail init uncons unsnoc index elem notElem elemIndex elemLastIndex find findMap findIndex findLastIndex insertAt deleteAt updateAt updateAtIndices modifyAt modifyAtIndices alterAt intersperse reverse concat concatMap filter partition splitAt filterA mapMaybe catMaybes mapWithIndex foldl1 foldr1 foldMap1 fold1 intercalate scanl scanr sort sortBy sortWith slice take takeEnd takeWhile drop dropEnd dropWhile span group groupAll group' groupBy groupAllBy nub nubBy nubEq nubByEq union union' unionBy unionBy' delete deleteBy difference difference' intersect intersect' intersectBy intersectBy' zipWith zipWithA zip unzip any all foldM unsafeIndex;
    inherit (module."Data.Array.NonEmpty.Internal");
  }