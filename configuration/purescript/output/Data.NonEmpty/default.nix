
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Alternative" = import ../Control.Alternative;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Plus" = import ../Control.Plus;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Eq" = import ../Data.Eq;
      "Data.Foldable" = import ../Data.Foldable;
      "Data.FoldableWithIndex" = import ../Data.FoldableWithIndex;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.FunctorWithIndex" = import ../Data.FunctorWithIndex;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Semigroup.Foldable" = import ../Data.Semigroup.Foldable;
      "Data.Show" = import ../Data.Show;
      "Data.Traversable" = import ../Data.Traversable;
      "Data.TraversableWithIndex" = import ../Data.TraversableWithIndex;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unfoldable" = import ../Data.Unfoldable;
      "Data.Unfoldable1" = import ../Data.Unfoldable1;
      "Prelude" = import ../Prelude;
      "Prim.TypeError" = import ../Prim.TypeError;
    };
  map = module."Data.Functor".map module."Data.Tuple".functorTuple;
  map1 = module."Data.Functor".map module."Data.Maybe".functorMaybe;
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  conj = module."Data.HeytingAlgebra".conj module."Data.HeytingAlgebra".heytingAlgebraBoolean;
  NonEmpty = value0: value1: 
    { __tag = "NonEmpty";
      __field0 = value0;
      __field1 = value1;
    };
  unfoldable1NonEmpty = dictUnfoldable: 
    let
      unfoldr = module."Data.Unfoldable".unfoldr dictUnfoldable;
    in
      {unfoldr1 = f: b: module."Data.Tuple".uncurry NonEmpty (map (unfoldr (map1 f)) (f b));};
  tail = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "NonEmpty"
          then 
            let
              xs = v.__field1;
            in
              xs
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 120:1 - 120:40";
    in
      __pattern0 __patternFail;
  singleton = dictPlus: 
    let
      empty = module."Control.Plus".empty dictPlus;
    in
      a: NonEmpty a empty;
  showNonEmpty = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      dictShow1: 
      let
        show1 = module."Data.Show".show dictShow1;
      in
        
        { show = v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "NonEmpty"
                  then 
                    let
                      a = v.__field0;
                      fa = v.__field1;
                    in
                      append "(NonEmpty " (append (show a) (append " " (append (show1 fa) ")")))
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 123:1 - 124:67";
            in
              __pattern0 __patternFail;
        };
  oneOf = dictAlternative: 
    let
      alt = module."Control.Alt".alt ((dictAlternative."Plus1" module."Prim".undefined)."Alt0" module."Prim".undefined);
      pure = module."Control.Applicative".pure (dictAlternative."Applicative0" module."Prim".undefined);
    in
      v: 
      let
        __pattern0 = __fail: 
          if v.__tag == "NonEmpty"
            then 
              let
                a = v.__field0;
                fa = v.__field1;
              in
                alt (pure a) fa
            else __fail;
        __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 104:1 - 104:58";
      in
        __pattern0 __patternFail;
  head = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "NonEmpty"
          then 
            let
              x = v.__field0;
            in
              x
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 112:1 - 112:38";
    in
      __pattern0 __patternFail;
  functorNonEmpty = dictFunctor: 
    let
      map2 = module."Data.Functor".map dictFunctor;
    in
      
      { map = f: m: 
          let
            __pattern0 = __fail: 
              if m.__tag == "NonEmpty"
                then 
                  let
                    v = m.__field0;
                    v1 = m.__field1;
                  in
                    NonEmpty (f v) (map2 f v1)
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 0:0 - 0:0";
          in
            __pattern0 __patternFail;
      };
  functorWithIndex = dictFunctorWithIndex: 
    let
      mapWithIndex = module."Data.FunctorWithIndex".mapWithIndex dictFunctorWithIndex;
      functorNonEmpty1 = functorNonEmpty (dictFunctorWithIndex."Functor0" module."Prim".undefined);
    in
      
      { mapWithIndex = f: v: 
          let
            __pattern0 = __fail: 
              if v.__tag == "NonEmpty"
                then 
                  let
                    f1 = f;
                    a = v.__field0;
                    fa = v.__field1;
                  in
                    NonEmpty (f1 module."Data.Maybe".Nothing a) (mapWithIndex (compose f1 module."Data.Maybe".Just) fa)
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 136:1 - 139:73";
          in
            __pattern0 __patternFail;
        "Functor0" = _: functorNonEmpty1;
      };
  fromNonEmpty = f: v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "NonEmpty"
          then 
            let
              f1 = f;
              a = v.__field0;
              fa = v.__field1;
            in
              f1 a fa
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 89:1 - 89:67";
    in
      __pattern0 __patternFail;
  foldableNonEmpty = dictFoldable: 
    let
      foldMap = module."Data.Foldable".foldMap dictFoldable;
      foldl = module."Data.Foldable".foldl dictFoldable;
      foldr = module."Data.Foldable".foldr dictFoldable;
    in
      
      { foldMap = dictMonoid: 
          let
            append1 = module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined);
            foldMap1 = foldMap dictMonoid;
          in
            f: v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "NonEmpty"
                  then 
                    let
                      f1 = f;
                      a = v.__field0;
                      fa = v.__field1;
                    in
                      append1 (f1 a) (foldMap1 f1 fa)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 141:1 - 144:43";
            in
              __pattern0 __patternFail;
        foldl = f: b: v: 
          let
            __pattern0 = __fail: 
              if v.__tag == "NonEmpty"
                then 
                  let
                    f1 = f;
                    b1 = b;
                    a = v.__field0;
                    fa = v.__field1;
                  in
                    foldl f1 (f1 b1 a) fa
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 141:1 - 144:43";
          in
            __pattern0 __patternFail;
        foldr = f: b: v: 
          let
            __pattern0 = __fail: 
              if v.__tag == "NonEmpty"
                then 
                  let
                    f1 = f;
                    b1 = b;
                    a = v.__field0;
                    fa = v.__field1;
                  in
                    f1 a (foldr f1 b1 fa)
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 141:1 - 144:43";
          in
            __pattern0 __patternFail;
      };
  foldableWithIndexNonEmpty = dictFoldableWithIndex: 
    let
      foldMapWithIndex = module."Data.FoldableWithIndex".foldMapWithIndex dictFoldableWithIndex;
      foldlWithIndex = module."Data.FoldableWithIndex".foldlWithIndex dictFoldableWithIndex;
      foldrWithIndex = module."Data.FoldableWithIndex".foldrWithIndex dictFoldableWithIndex;
      foldableNonEmpty1 = foldableNonEmpty (dictFoldableWithIndex."Foldable0" module."Prim".undefined);
    in
      
      { foldMapWithIndex = dictMonoid: 
          let
            append1 = module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined);
            foldMapWithIndex1 = foldMapWithIndex dictMonoid;
          in
            f: v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "NonEmpty"
                  then 
                    let
                      f1 = f;
                      a = v.__field0;
                      fa = v.__field1;
                    in
                      append1 (f1 module."Data.Maybe".Nothing a) (foldMapWithIndex1 (compose f1 module."Data.Maybe".Just) fa)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 146:1 - 151:80";
            in
              __pattern0 __patternFail;
        foldlWithIndex = f: b: v: 
          let
            __pattern0 = __fail: 
              if v.__tag == "NonEmpty"
                then 
                  let
                    f1 = f;
                    b1 = b;
                    a = v.__field0;
                    fa = v.__field1;
                  in
                    foldlWithIndex (compose f1 module."Data.Maybe".Just) (f1 module."Data.Maybe".Nothing b1 a) fa
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 146:1 - 151:80";
          in
            __pattern0 __patternFail;
        foldrWithIndex = f: b: v: 
          let
            __pattern0 = __fail: 
              if v.__tag == "NonEmpty"
                then 
                  let
                    f1 = f;
                    b1 = b;
                    a = v.__field0;
                    fa = v.__field1;
                  in
                    f1 module."Data.Maybe".Nothing a (foldrWithIndex (compose f1 module."Data.Maybe".Just) b1 fa)
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 146:1 - 151:80";
          in
            __pattern0 __patternFail;
        "Foldable0" = _: foldableNonEmpty1;
      };
  traversableNonEmpty = dictTraversable: 
    let
      sequence = module."Data.Traversable".sequence dictTraversable;
      traverse = module."Data.Traversable".traverse dictTraversable;
      functorNonEmpty1 = functorNonEmpty (dictTraversable."Functor0" module."Prim".undefined);
      foldableNonEmpty1 = foldableNonEmpty (dictTraversable."Foldable1" module."Prim".undefined);
    in
      
      { sequence = dictApplicative: 
          let
            Apply0 = dictApplicative."Apply0" module."Prim".undefined;
            apply = module."Control.Apply".apply Apply0;
            map2 = module."Data.Functor".map (Apply0."Functor0" module."Prim".undefined);
            sequence1 = sequence dictApplicative;
          in
            v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "NonEmpty"
                  then 
                    let
                      a = v.__field0;
                      fa = v.__field1;
                    in
                      apply (map2 NonEmpty a) (sequence1 fa)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 153:1 - 155:60";
            in
              __pattern0 __patternFail;
        traverse = dictApplicative: 
          let
            Apply0 = dictApplicative."Apply0" module."Prim".undefined;
            apply = module."Control.Apply".apply Apply0;
            map2 = module."Data.Functor".map (Apply0."Functor0" module."Prim".undefined);
            traverse1 = traverse dictApplicative;
          in
            f: v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "NonEmpty"
                  then 
                    let
                      f1 = f;
                      a = v.__field0;
                      fa = v.__field1;
                    in
                      apply (map2 NonEmpty (f1 a)) (traverse1 f1 fa)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 153:1 - 155:60";
            in
              __pattern0 __patternFail;
        "Functor0" = _: functorNonEmpty1;
        "Foldable1" = _: foldableNonEmpty1;
      };
  traversableWithIndexNonEmpty = dictTraversableWithIndex: 
    let
      traverseWithIndex = module."Data.TraversableWithIndex".traverseWithIndex dictTraversableWithIndex;
      functorWithIndex1 = functorWithIndex (dictTraversableWithIndex."FunctorWithIndex0" module."Prim".undefined);
      foldableWithIndexNonEmpty1 = foldableWithIndexNonEmpty (dictTraversableWithIndex."FoldableWithIndex1" module."Prim".undefined);
      traversableNonEmpty1 = traversableNonEmpty (dictTraversableWithIndex."Traversable2" module."Prim".undefined);
    in
      
      { traverseWithIndex = dictApplicative: 
          let
            Apply0 = dictApplicative."Apply0" module."Prim".undefined;
            apply = module."Control.Apply".apply Apply0;
            map2 = module."Data.Functor".map (Apply0."Functor0" module."Prim".undefined);
            traverseWithIndex1 = traverseWithIndex dictApplicative;
          in
            f: v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "NonEmpty"
                  then 
                    let
                      f1 = f;
                      a = v.__field0;
                      fa = v.__field1;
                    in
                      apply (map2 NonEmpty (f1 module."Data.Maybe".Nothing a)) (traverseWithIndex1 (compose f1 module."Data.Maybe".Just) fa)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 157:1 - 161:67";
            in
              __pattern0 __patternFail;
        "FunctorWithIndex0" = _: functorWithIndex1;
        "FoldableWithIndex1" = _: foldableWithIndexNonEmpty1;
        "Traversable2" = _: traversableNonEmpty1;
      };
  foldable1NonEmpty = dictFoldable: 
    let
      foldl = module."Data.Foldable".foldl dictFoldable;
      foldr = module."Data.Foldable".foldr dictFoldable;
      foldableNonEmpty1 = foldableNonEmpty dictFoldable;
    in
      
      { foldMap1 = dictSemigroup: 
          let
            append1 = module."Data.Semigroup".append dictSemigroup;
          in
            f: v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "NonEmpty"
                  then 
                    let
                      f1 = f;
                      a = v.__field0;
                      fa = v.__field1;
                    in
                      foldl (s: a1: append1 s (f1 a1)) (f1 a) fa
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 163:1 - 166:36";
            in
              __pattern0 __patternFail;
        foldr1 = f: v: 
          let
            __pattern0 = __fail: 
              if v.__tag == "NonEmpty"
                then 
                  let
                    f1 = f;
                    a = v.__field0;
                    fa = v.__field1;
                  in
                    module."Data.Maybe".maybe a (f1 a) (foldr (a1: compose module."Data.Maybe".Just (module."Data.Maybe".maybe a1 (f1 a1))) module."Data.Maybe".Nothing fa)
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 163:1 - 166:36";
          in
            __pattern0 __patternFail;
        foldl1 = f: v: 
          let
            __pattern0 = __fail: 
              if v.__tag == "NonEmpty"
                then 
                  let
                    f1 = f;
                    a = v.__field0;
                    fa = v.__field1;
                  in
                    foldl f1 a fa
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 163:1 - 166:36";
          in
            __pattern0 __patternFail;
        "Foldable0" = _: foldableNonEmpty1;
      };
  foldl1 = dictFoldable: 
    let
      foldl11 = module."Data.Semigroup.Foldable".foldl1 (foldable1NonEmpty dictFoldable);
    in
      _: foldl11;
  eqNonEmpty = dictEq1: 
    let
      eq1 = module."Data.Eq".eq1 dictEq1;
    in
      dictEq: 
      let
        eq = module."Data.Eq".eq dictEq;
        eq11 = eq1 dictEq;
      in
        
        { eq = x: y: 
            let
              __pattern0 = __fail: 
                if x.__tag == "NonEmpty" && y.__tag == "NonEmpty"
                  then 
                    let
                      l = x.__field0;
                      l1 = x.__field1;
                      r = y.__field0;
                      r1 = y.__field1;
                    in
                      conj (eq l r) (eq11 l1 r1)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 0:0 - 0:0";
            in
              __pattern0 __patternFail;
        };
  ordNonEmpty = dictOrd1: 
    let
      compare1 = module."Data.Ord".compare1 dictOrd1;
      eqNonEmpty1 = eqNonEmpty (dictOrd1."Eq10" module."Prim".undefined);
    in
      dictOrd: 
      let
        compare = module."Data.Ord".compare dictOrd;
        compare11 = compare1 dictOrd;
        eqNonEmpty2 = eqNonEmpty1 (dictOrd."Eq0" module."Prim".undefined);
      in
        
        { compare = x: y: 
            let
              __pattern0 = __fail: 
                if x.__tag == "NonEmpty" && y.__tag == "NonEmpty"
                  then 
                    let
                      l = x.__field0;
                      l1 = x.__field1;
                      r = y.__field0;
                      r1 = y.__field1;
                    in
                      
                      let
                        v = compare l r;
                      in
                        
                        let
                          __pattern0 = __fail: if v.__tag == "LT" then module."Data.Ordering".LT else __fail;
                          __pattern1 = __fail: if v.__tag == "GT" then module."Data.Ordering".GT else __fail;
                          __pattern2 = __fail: compare11 l1 r1;
                          __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 0:0 - 0:0";
                        in
                          __pattern0 (__pattern1 (__pattern2 __patternFail))
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 0:0 - 0:0";
            in
              __pattern0 __patternFail;
          "Eq0" = _: eqNonEmpty2;
        };
  eq1NonEmpty = dictEq1: 
    let
      eqNonEmpty1 = eqNonEmpty dictEq1;
    in
      {eq1 = dictEq: module."Data.Eq".eq (eqNonEmpty1 dictEq);};
  ord1NonEmpty = dictOrd1: 
    let
      ordNonEmpty1 = ordNonEmpty dictOrd1;
      eq1NonEmpty1 = eq1NonEmpty (dictOrd1."Eq10" module."Prim".undefined);
    in
      
      { compare1 = dictOrd: module."Data.Ord".compare (ordNonEmpty1 dictOrd);
        "Eq10" = _: eq1NonEmpty1;
      };
in
  {inherit NonEmpty singleton foldl1 fromNonEmpty oneOf head tail showNonEmpty eqNonEmpty eq1NonEmpty ordNonEmpty ord1NonEmpty functorNonEmpty functorWithIndex foldableNonEmpty foldableWithIndexNonEmpty traversableNonEmpty traversableWithIndexNonEmpty foldable1NonEmpty unfoldable1NonEmpty;}