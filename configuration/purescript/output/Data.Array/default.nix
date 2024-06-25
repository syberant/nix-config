
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Alternative" = import ../Control.Alternative;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Category" = import ../Control.Category;
      "Control.Lazy" = import ../Control.Lazy;
      "Control.Monad.ST" = import ../Control.Monad.ST;
      "Control.Monad.ST.Internal" = import ../Control.Monad.ST.Internal;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Array.NonEmpty.Internal" = import ../Data.Array.NonEmpty.Internal;
      "Data.Array.ST" = import ../Data.Array.ST;
      "Data.Array.ST.Iterator" = import ../Data.Array.ST.Iterator;
      "Data.Boolean" = import ../Data.Boolean;
      "Data.Eq" = import ../Data.Eq;
      "Data.Foldable" = import ../Data.Foldable;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Ring" = import ../Data.Ring;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Traversable" = import ../Data.Traversable;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unfoldable" = import ../Data.Unfoldable;
      "Partial.Unsafe" = import ../Partial.Unsafe;
      "Prelude" = import ../Prelude;
      "Prim.TypeError" = import ../Prim.TypeError;
    };
  foreign = import ./foreign.nix;
  fromFoldableImpl = foreign.fromFoldableImpl;
  range = foreign.range;
  replicate = foreign.replicate;
  length = foreign.length;
  unconsImpl = foreign.unconsImpl;
  indexImpl = foreign.indexImpl;
  findMapImpl = foreign.findMapImpl;
  findIndexImpl = foreign.findIndexImpl;
  findLastIndexImpl = foreign.findLastIndexImpl;
  _insertAt = foreign._insertAt;
  _deleteAt = foreign._deleteAt;
  _updateAt = foreign._updateAt;
  reverse = foreign.reverse;
  concat = foreign.concat;
  filter = foreign.filter;
  partition = foreign.partition;
  scanl = foreign.scanl;
  scanr = foreign.scanr;
  sortByImpl = foreign.sortByImpl;
  slice = foreign.slice;
  zipWith = foreign.zipWith;
  any = foreign.any;
  all = foreign.all;
  unsafeIndexImpl = foreign.unsafeIndexImpl;
  sequence = module."Data.Traversable".sequence module."Data.Traversable".traversableArray;
  traverse_ = module."Data.Foldable".traverse_ module."Control.Monad.ST.Internal".applicativeST;
  lessThan = module."Data.Ord".lessThan module."Data.Ord".ordInt;
  add = module."Data.Semiring".add module."Data.Semiring".semiringInt;
  lessThanOrEq = module."Data.Ord".lessThanOrEq module."Data.Ord".ordInt;
  negate = module."Data.Ring".negate module."Data.Ring".ringInt;
  eq = module."Data.Eq".eq module."Data.Eq".eqInt;
  bind = module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST;
  discard = module."Control.Bind".discard module."Control.Bind".discardUnit module."Control.Monad.ST.Internal".bindST;
  map = module."Data.Functor".map module."Control.Monad.ST.Internal".functorST;
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  not = module."Data.HeytingAlgebra".not module."Data.HeytingAlgebra".heytingAlgebraBoolean;
  when = module."Control.Applicative".when module."Control.Monad.ST.Internal".applicativeST;
  void = module."Data.Functor".void module."Control.Monad.ST.Internal".functorST;
  sub = module."Data.Ring".sub module."Data.Ring".ringInt;
  pure = module."Control.Applicative".pure module."Control.Monad.ST.Internal".applicativeST;
  intercalate1 = module."Data.Foldable".intercalate module."Data.Foldable".foldableArray;
  zero = module."Data.Semiring".zero module."Data.Semiring".semiringInt;
  one = module."Data.Semiring".one module."Data.Semiring".semiringInt;
  apply = module."Control.Apply".apply module."Data.Maybe".applyMaybe;
  map1 = module."Data.Functor".map module."Data.Maybe".functorMaybe;
  map2 = module."Data.Functor".map module."Data.Functor".functorArray;
  fromJust = module."Data.Maybe".fromJust module."Prim".undefined;
  notEq = module."Data.Eq".notEq module."Data.Ordering".eqOrdering;
  eq1 = module."Data.Eq".eq module."Data.Ordering".eqOrdering;
  foldMap1 = module."Data.Foldable".foldMap module."Data.Foldable".foldableArray;
  fold1 = module."Data.Foldable".fold module."Data.Foldable".foldableArray;
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupArray;
  composeFlipped = module."Control.Semigroupoid".composeFlipped module."Control.Semigroupoid".semigroupoidFn;
  traverse = module."Data.Traversable".traverse module."Data.Traversable".traversableArray;
  zipWithA = dictApplicative: 
    let
      sequence1 = sequence dictApplicative;
    in
      f: xs: ys: sequence1 (zipWith f xs ys);
  zip = zipWith module."Data.Tuple".Tuple;
  updateAtIndices = dictFoldable: 
    let
      traverse_1 = traverse_ dictFoldable;
    in
      us: xs: module."Control.Monad.ST.Internal".run 
      ( module."Data.Array.ST".withArray 
        ( res: traverse_1 
          ( v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Tuple"
                  then 
                    let
                      i = v.__field0;
                      a = v.__field1;
                    in
                      module."Data.Array.ST".poke i a res
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 756:45 - 756:77";
            in
              __pattern0 __patternFail
          ) us
        ) xs
      );
  updateAt = _updateAt module."Data.Maybe".Just module."Data.Maybe".Nothing;
  unsafeIndex = _: unsafeIndexImpl;
  unsafeIndex1 = unsafeIndex module."Prim".undefined;
  uncons = unconsImpl (module."Data.Function".const module."Data.Maybe".Nothing) 
    ( x: xs: module."Data.Maybe".Just 
      { head = x;
        tail = xs;
      }
    );
  toUnfoldable = dictUnfoldable: 
    let
      unfoldr = module."Data.Unfoldable".unfoldr dictUnfoldable;
    in
      xs: 
      let
        len = length xs;
        f = i: 
          let
            __pattern0 = __fail: 
              let
                i1 = i;
              in
                if lessThan i1 len then module."Data.Maybe".Just (module."Data.Tuple".Tuple (module."Partial.Unsafe".unsafePartial (_: unsafeIndex1 xs i1)) (add i1 1)) else if module."Data.Boolean".otherwise then module."Data.Maybe".Nothing else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 158:3 - 160:26";
          in
            __pattern0 __patternFail;
      in
        unfoldr f 0;
  take = n: xs: 
    let
      __pattern0 = __fail: if lessThan n 1 then [] else __fail;
      __pattern1 = __fail: slice 0 n xs;
      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 876:13 - 876:47";
    in
      __pattern0 (__pattern1 __patternFail);
  tail = unconsImpl (module."Data.Function".const module."Data.Maybe".Nothing) (v: xs: module."Data.Maybe".Just xs);
  splitAt = i: xs: 
    let
      __pattern0 = __fail: 
        let
          i1 = i;
          xs1 = xs;
        in
          
          if lessThanOrEq i1 0
            then 
              { before = [];
                after = xs1;
              }
            else __fail;
      __pattern1 = __fail: 
        let
          i1 = i;
          xs1 = xs;
        in
          
          { before = slice 0 i1 xs1;
            after = slice i1 (length xs1) xs1;
          };
      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 692:1 - 692:79";
    in
      __pattern0 (__pattern1 __patternFail);
  sortBy = comp: sortByImpl comp 
    ( v: 
      let
        __pattern0 = __fail: if v.__tag == "GT" then 1 else __fail;
        __pattern1 = __fail: if v.__tag == "EQ" then 0 else __fail;
        __pattern2 = __fail: if v.__tag == "LT" then negate 1 else __fail;
        __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 831:31 - 834:11";
      in
        __pattern0 (__pattern1 (__pattern2 __patternFail))
    );
  sortWith = dictOrd: 
    let
      comparing = module."Data.Ord".comparing dictOrd;
    in
      f: sortBy (comparing f);
  sortWith1 = sortWith module."Data.Ord".ordInt;
  sort = dictOrd: 
    let
      compare = module."Data.Ord".compare dictOrd;
    in
      xs: sortBy compare xs;
  snoc = xs: x: module."Control.Monad.ST.Internal".run (module."Data.Array.ST".withArray (module."Data.Array.ST".push x) xs);
  singleton = a: [a];
  null = xs: eq (length xs) 0;
  nubByEq = eq2: xs: module."Control.Monad.ST.Internal".run (bind module."Data.Array.ST".new (arr: discard (module."Control.Monad.ST.Internal".foreach xs (x: bind (map (compose not (any (v: eq2 v x))) (module."Data.Array.ST".unsafeFreeze arr)) (e: when e (void (module."Data.Array.ST".push x arr))))) (_: module."Data.Array.ST".unsafeFreeze arr)));
  nubEq = dictEq: nubByEq (module."Data.Eq".eq dictEq);
  modifyAtIndices = dictFoldable: 
    let
      traverse_1 = traverse_ dictFoldable;
    in
      is: f: xs: module."Control.Monad.ST.Internal".run (module."Data.Array.ST".withArray (res: traverse_1 (i: module."Data.Array.ST".modify i f res) is) xs);
  mapWithIndex = f: xs: zipWith f (range 0 (sub (length xs) 1)) xs;
  intersperse = a: arr: 
    let
      v = length arr;
    in
      
      let
        __pattern0 = __fail: 
          let
            len = v;
          in
            
            if lessThan len 2
              then arr
              else 
                if module."Data.Boolean".otherwise
                  then module."Data.Array.ST".run 
                    ( 
                      let
                        unsafeGetElem = idx: module."Partial.Unsafe".unsafePartial (_: unsafeIndex1 arr idx);
                      in
                        bind module."Data.Array.ST".new (out: bind (module."Data.Array.ST".push (unsafeGetElem 0) out) (_: discard (module."Control.Monad.ST.Internal".for 1 len (idx: bind (module."Data.Array.ST".push a out) (_: void (module."Data.Array.ST".push (unsafeGetElem idx) out)))) (_: pure out)))
                    )
                  else __fail;
        __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 613:21 - 622:19";
      in
        __pattern0 __patternFail;
  intercalate = dictMonoid: intercalate1 dictMonoid;
  insertAt = _insertAt module."Data.Maybe".Just module."Data.Maybe".Nothing;
  init = xs: 
    let
      __pattern0 = __fail: 
        let
          xs1 = xs;
        in
          if null xs1 then module."Data.Maybe".Nothing else if module."Data.Boolean".otherwise then module."Data.Maybe".Just (slice zero (sub (length xs1) one) xs1) else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 340:1 - 340:45";
    in
      __pattern0 __patternFail;
  index = indexImpl module."Data.Maybe".Just module."Data.Maybe".Nothing;
  last = xs: index xs (sub (length xs) 1);
  unsnoc = xs: apply 
    ( map1 
      ( v: v1: 
        { init = v;
          last = v1;
        }
      ) (init xs)
    ) (last xs);
  modifyAt = i: f: xs: 
    let
      go = x: updateAt i (f x) xs;
    in
      module."Data.Maybe".maybe module."Data.Maybe".Nothing go (index xs i);
  span = p: arr: 
    let
      go = i: 
        let
          v = index arr i;
        in
          
          let
            __pattern0 = __fail: 
              if v.__tag == "Just"
                then 
                  let
                    x = v.__field0;
                  in
                    
                    let
                      __pattern0 = __fail: if p x then go (add i 1) else __fail;
                      __pattern1 = __fail: module."Data.Maybe".Just i;
                      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 967:17 - 967:51";
                    in
                      __pattern0 (__pattern1 __patternFail)
                else __fail;
            __pattern1 = __fail: if v.__tag == "Nothing" then module."Data.Maybe".Nothing else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 966:5 - 968:25";
          in
            __pattern0 (__pattern1 __patternFail);
      breakIndex = go 0;
    in
      
      let
        __pattern0 = __fail: 
          if breakIndex.__tag == "Just" && breakIndex.__field0 == 0
            then 
              { init = [];
                rest = arr;
              }
            else __fail;
        __pattern1 = __fail: 
          if breakIndex.__tag == "Just"
            then 
              let
                i = breakIndex.__field0;
              in
                
                { init = slice 0 i arr;
                  rest = slice i (length arr) arr;
                }
            else __fail;
        __pattern2 = __fail: 
          if breakIndex.__tag == "Nothing"
            then 
              { init = arr;
                rest = [];
              }
            else __fail;
        __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 953:3 - 959:30";
      in
        __pattern0 (__pattern1 (__pattern2 __patternFail));
  takeWhile = p: xs: (span p xs).init;
  unzip = xs: module."Control.Monad.ST.Internal".run 
    ( bind module."Data.Array.ST".new 
      ( fsts: bind module."Data.Array.ST".new 
        ( snds: bind (module."Data.Array.ST.Iterator".iterator (v: index xs v)) 
          ( iter: discard 
            ( module."Data.Array.ST.Iterator".iterate iter 
              ( v: 
                let
                  __pattern0 = __fail: 
                    if v.__tag == "Tuple"
                      then 
                        let
                          fst = v.__field0;
                          snd = v.__field1;
                        in
                          discard (void (module."Data.Array.ST".push fst fsts)) (_: void (module."Data.Array.ST".push snd snds))
                      else __fail;
                  __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 1229:23 - 1231:31";
                in
                  __pattern0 __patternFail
              )
            ) (_: bind (module."Data.Array.ST".unsafeFreeze fsts) (fsts': bind (module."Data.Array.ST".unsafeFreeze snds) (snds': pure (module."Data.Tuple".Tuple fsts' snds'))))
          )
        )
      )
    );
  head = xs: index xs 0;
  nubBy = comp: xs: 
    let
      indexedAndSorted = sortBy (x: y: comp (module."Data.Tuple".snd x) (module."Data.Tuple".snd y)) (mapWithIndex module."Data.Tuple".Tuple xs);
    in
      
      let
        v = head indexedAndSorted;
      in
        
        let
          __pattern0 = __fail: if v.__tag == "Nothing" then [] else __fail;
          __pattern1 = __fail: 
            if v.__tag == "Just"
              then 
                let
                  x = v.__field0;
                in
                  map2 module."Data.Tuple".snd 
                  ( sortWith1 module."Data.Tuple".fst 
                    ( module."Control.Monad.ST.Internal".run 
                      ( bind (module."Data.Array.ST".unsafeThaw (singleton x)) 
                        ( result: discard 
                          ( module."Control.Monad.ST.Internal".foreach indexedAndSorted 
                            ( v1: 
                              let
                                __pattern0 = __fail: 
                                  if v1.__tag == "Tuple"
                                    then 
                                      let
                                        pair = v1;
                                        x' = v1.__field1;
                                      in
                                        bind (map (compose module."Data.Tuple".snd (module."Partial.Unsafe".unsafePartial (_: compose fromJust last))) (module."Data.Array.ST".unsafeFreeze result)) (lst: when (notEq (comp lst x') module."Data.Ordering".EQ) (void (module."Data.Array.ST".push pair result)))
                                    else __fail;
                                __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 1055:34 - 1057:62";
                              in
                                __pattern0 __patternFail
                            )
                          ) (_: module."Data.Array.ST".unsafeFreeze result)
                        )
                      )
                    )
                  )
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 1050:17 - 1058:29";
        in
          __pattern0 (__pattern1 __patternFail);
  nub = dictOrd: nubBy (module."Data.Ord".compare dictOrd);
  groupBy = op: xs: module."Control.Monad.ST.Internal".run (bind module."Data.Array.ST".new (result: bind (module."Data.Array.ST.Iterator".iterator (v: index xs v)) (iter: discard (module."Data.Array.ST.Iterator".iterate iter (x: void (bind module."Data.Array.ST".new (sub1: bind (module."Data.Array.ST".push x sub1) (_: discard (module."Data.Array.ST.Iterator".pushWhile (op x) iter sub1) (_: bind (module."Data.Array.ST".unsafeFreeze sub1) (grp: module."Data.Array.ST".push grp result))))))) (_: module."Data.Array.ST".unsafeFreeze result))));
  groupAllBy = cmp: compose (groupBy (x: y: eq1 (cmp x y) module."Data.Ordering".EQ)) (sortBy cmp);
  groupAll = dictOrd: groupAllBy (module."Data.Ord".compare dictOrd);
  group' = _: dictOrd: groupAll dictOrd;
  group = dictEq: 
    let
      eq2 = module."Data.Eq".eq dictEq;
    in
      xs: groupBy eq2 xs;
  fromFoldable = dictFoldable: fromFoldableImpl (module."Data.Foldable".foldr dictFoldable);
  foldr = module."Data.Foldable".foldr module."Data.Foldable".foldableArray;
  foldl = module."Data.Foldable".foldl module."Data.Foldable".foldableArray;
  foldMap = dictMonoid: foldMap1 dictMonoid;
  foldM = dictMonad: 
    let
      pure1 = module."Control.Applicative".pure (dictMonad."Applicative0" module."Prim".undefined);
      bind1 = module."Control.Bind".bind (dictMonad."Bind1" module."Prim".undefined);
    in
      f: b: unconsImpl (v: pure1 b) (a: as: bind1 (f b a) (b': foldM dictMonad f b' as));
  fold = dictMonoid: fold1 dictMonoid;
  findMap = findMapImpl module."Data.Maybe".Nothing module."Data.Maybe".isJust;
  findLastIndex = findLastIndexImpl module."Data.Maybe".Just module."Data.Maybe".Nothing;
  insertBy = cmp: x: ys: 
    let
      i = module."Data.Maybe".maybe 0 (v: add v 1) (findLastIndex (y: eq1 (cmp x y) module."Data.Ordering".GT) ys);
    in
      module."Partial.Unsafe".unsafePartial (_: fromJust (insertAt i x ys));
  insert = dictOrd: insertBy (module."Data.Ord".compare dictOrd);
  findIndex = findIndexImpl module."Data.Maybe".Just module."Data.Maybe".Nothing;
  intersectBy = eq2: xs: ys: filter (x: module."Data.Maybe".isJust (findIndex (eq2 x) ys)) xs;
  intersect = dictEq: intersectBy (module."Data.Eq".eq dictEq);
  find = f: xs: map1 (module."Partial.Unsafe".unsafePartial (_: unsafeIndex1 xs)) (findIndex f xs);
  elemLastIndex = dictEq: 
    let
      eq2 = module."Data.Eq".eq dictEq;
    in
      x: findLastIndex (v: eq2 v x);
  elemIndex = dictEq: 
    let
      eq2 = module."Data.Eq".eq dictEq;
    in
      x: findIndex (v: eq2 v x);
  notElem = dictEq: 
    let
      elemIndex1 = elemIndex dictEq;
    in
      a: arr: module."Data.Maybe".isNothing (elemIndex1 a arr);
  elem = dictEq: 
    let
      elemIndex1 = elemIndex dictEq;
    in
      a: arr: module."Data.Maybe".isJust (elemIndex1 a arr);
  dropWhile = p: xs: (span p xs).rest;
  dropEnd = n: xs: take (sub (length xs) n) xs;
  drop = n: xs: 
    let
      __pattern0 = __fail: if lessThan n 1 then xs else __fail;
      __pattern1 = __fail: slice n (length xs) xs;
      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 912:13 - 912:57";
    in
      __pattern0 (__pattern1 __patternFail);
  takeEnd = n: xs: drop (sub (length xs) n) xs;
  deleteAt = _deleteAt module."Data.Maybe".Just module."Data.Maybe".Nothing;
  deleteBy = v: v1: v2: 
    let
      __pattern0 = __fail: if builtins.length v2 == 0 then [] else __fail;
      __pattern1 = __fail: 
        let
          eq2 = v;
          x = v1;
          ys = v2;
        in
          module."Data.Maybe".maybe ys (i: module."Partial.Unsafe".unsafePartial (_: fromJust (deleteAt i ys))) (findIndex (eq2 x) ys);
      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 1128:1 - 1128:69";
    in
      __pattern0 (__pattern1 __patternFail);
  unionBy = eq2: xs: ys: append xs (foldl (module."Data.Function".flip (deleteBy eq2)) (nubByEq eq2 ys) xs);
  union = dictEq: unionBy (module."Data.Eq".eq dictEq);
  delete = dictEq: deleteBy (module."Data.Eq".eq dictEq);
  difference = dictEq: foldr (delete dictEq);
  cons = x: xs: append [x] xs;
  some = dictAlternative: 
    let
      apply1 = module."Control.Apply".apply ((dictAlternative."Applicative0" module."Prim".undefined)."Apply0" module."Prim".undefined);
      map3 = module."Data.Functor".map (((dictAlternative."Plus1" module."Prim".undefined)."Alt0" module."Prim".undefined)."Functor0" module."Prim".undefined);
    in
      dictLazy: 
      let
        defer = module."Control.Lazy".defer dictLazy;
      in
        v: apply1 (map3 cons v) (defer (v1: many dictAlternative dictLazy v));
  many = dictAlternative: 
    let
      alt = module."Control.Alt".alt ((dictAlternative."Plus1" module."Prim".undefined)."Alt0" module."Prim".undefined);
      pure1 = module."Control.Applicative".pure (dictAlternative."Applicative0" module."Prim".undefined);
    in
      dictLazy: v: alt (some dictAlternative dictLazy v) (pure1 []);
  concatMap = module."Data.Function".flip (module."Control.Bind".bind module."Control.Bind".bindArray);
  mapMaybe = f: concatMap (compose (module."Data.Maybe".maybe [] singleton) f);
  filterA = dictApplicative: 
    let
      traverse1 = traverse dictApplicative;
      map3 = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
    in
      p: composeFlipped (traverse1 (x: map3 (module."Data.Tuple".Tuple x) (p x))) 
      ( map3 
        ( mapMaybe 
          ( v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Tuple"
                  then 
                    let
                      x = v.__field0;
                      b = v.__field1;
                    in
                      
                      let
                        __pattern0 = __fail: if b then module."Data.Maybe".Just x else __fail;
                        __pattern1 = __fail: module."Data.Maybe".Nothing;
                        __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 705:38 - 705:67";
                      in
                        __pattern0 (__pattern1 __patternFail)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 705:22 - 705:67";
            in
              __pattern0 __patternFail
          )
        )
      );
  catMaybes = mapMaybe (module."Control.Category".identity module."Control.Category".categoryFn);
  alterAt = i: f: xs: 
    let
      go = x: 
        let
          v = f x;
        in
          
          let
            __pattern0 = __fail: if v.__tag == "Nothing" then deleteAt i xs else __fail;
            __pattern1 = __fail: 
              if v.__tag == "Just"
                then 
                  let
                    x' = v.__field0;
                  in
                    updateAt i x' xs
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 591:10 - 593:32";
          in
            __pattern0 (__pattern1 __patternFail);
    in
      module."Data.Maybe".maybe module."Data.Maybe".Nothing go (index xs i);
in
  {inherit fromFoldable toUnfoldable singleton range replicate some many null length cons snoc insert insertBy head last tail init uncons unsnoc index elem notElem elemIndex elemLastIndex find findMap findIndex findLastIndex insertAt deleteAt updateAt updateAtIndices modifyAt modifyAtIndices alterAt intersperse reverse concat concatMap filter partition splitAt filterA mapMaybe catMaybes mapWithIndex foldl foldr foldMap fold intercalate scanl scanr sort sortBy sortWith slice take takeEnd takeWhile drop dropEnd dropWhile span group groupAll group' groupBy groupAllBy nub nubEq nubBy nubByEq union unionBy delete deleteBy difference intersect intersectBy zipWith zipWithA zip unzip any all foldM unsafeIndex;}