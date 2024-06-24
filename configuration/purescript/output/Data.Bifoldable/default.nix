
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
      "Data.Functor.Clown" = import ../Data.Functor.Clown;
      "Data.Functor.Flip" = import ../Data.Functor.Flip;
      "Data.Functor.Joker" = import ../Data.Functor.Joker;
      "Data.Functor.Product2" = import ../Data.Functor.Product2;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Monoid.Conj" = import ../Data.Monoid.Conj;
      "Data.Monoid.Disj" = import ../Data.Monoid.Disj;
      "Data.Monoid.Dual" = import ../Data.Monoid.Dual;
      "Data.Monoid.Endo" = import ../Data.Monoid.Endo;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unit" = import ../Data.Unit;
      "Prelude" = import ../Prelude;
    };
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  identity = module."Control.Category".identity module."Control.Category".categoryFn;
  unwrap = module."Data.Newtype".unwrap module."Prim".undefined;
  monoidEndo = module."Data.Monoid.Endo".monoidEndo module."Control.Category".categoryFn;
  monoidDual = module."Data.Monoid.Dual".monoidDual monoidEndo;
  Bifoldable-Dict = x: x;
  bifoldr = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.bifoldr;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 38:3 - 38:77";
    in
      __pattern0 __patternFail;
  bitraverse_ = dictBifoldable: 
    let
      bifoldr1 = bifoldr dictBifoldable;
    in
      dictApplicative: 
      let
        applySecond = module."Control.Apply".applySecond (dictApplicative."Apply0" module."Prim".undefined);
        pure = module."Control.Applicative".pure dictApplicative;
      in
        f: g: bifoldr1 (compose applySecond f) (compose applySecond g) (pure module."Data.Unit".unit);
  bifor_ = dictBifoldable: 
    let
      bitraverse_1 = bitraverse_ dictBifoldable;
    in
      dictApplicative: 
      let
        bitraverse_2 = bitraverse_1 dictApplicative;
      in
        t: f: g: bitraverse_2 f g t;
  bisequence_ = dictBifoldable: 
    let
      bitraverse_1 = bitraverse_ dictBifoldable;
    in
      dictApplicative: bitraverse_1 dictApplicative identity identity;
  bifoldl = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.bifoldl;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 39:3 - 39:77";
    in
      __pattern0 __patternFail;
  bifoldableTuple = 
    { bifoldMap = dictMonoid: 
        let
          append = module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined);
        in
          f: g: v: 
          let
            __pattern0 = __fail: 
              if v.__tag == "Tuple"
                then 
                  let
                    f1 = f;
                    g1 = g;
                    a = v.__field0;
                    b = v.__field1;
                  in
                    append (f1 a) (g1 b)
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 70:1 - 73:42";
          in
            __pattern0 __patternFail;
      bifoldr = f: g: z: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  g1 = g;
                  z1 = z;
                  a = v.__field0;
                  b = v.__field1;
                in
                  f1 a (g1 b z1)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 70:1 - 73:42";
        in
          __pattern0 __patternFail;
      bifoldl = f: g: z: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  g1 = g;
                  z1 = z;
                  a = v.__field0;
                  b = v.__field1;
                in
                  g1 (f1 z1 a) b
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 70:1 - 73:42";
        in
          __pattern0 __patternFail;
    };
  bifoldableJoker = dictFoldable: 
    let
      foldr = module."Data.Foldable".foldr dictFoldable;
      foldl = module."Data.Foldable".foldl dictFoldable;
      foldMap = module."Data.Foldable".foldMap dictFoldable;
    in
      
      { bifoldr = v: r: u: v1: 
          let
            __pattern0 = __fail: 
              let
                r1 = r;
                u1 = u;
                f = v1;
              in
                foldr r1 u1 f;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 47:1 - 50:40";
          in
            __pattern0 __patternFail;
        bifoldl = v: r: u: v1: 
          let
            __pattern0 = __fail: 
              let
                r1 = r;
                u1 = u;
                f = v1;
              in
                foldl r1 u1 f;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 47:1 - 50:40";
          in
            __pattern0 __patternFail;
        bifoldMap = dictMonoid: 
          let
            foldMap1 = foldMap dictMonoid;
          in
            v: r: v1: 
            let
              __pattern0 = __fail: 
                let
                  r1 = r;
                  f = v1;
                in
                  foldMap1 r1 f;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 47:1 - 50:40";
            in
              __pattern0 __patternFail;
      };
  bifoldableEither = 
    { bifoldr = v: v1: z: v2: 
        let
          __pattern0 = __fail: 
            if v2.__tag == "Left"
              then 
                let
                  f = v;
                  z1 = z;
                  a = v2.__field0;
                in
                  f a z1
              else __fail;
          __pattern1 = __fail: 
            if v2.__tag == "Right"
              then 
                let
                  g = v1;
                  z1 = z;
                  b = v2.__field0;
                in
                  g b z1
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 62:1 - 68:32";
        in
          __pattern0 (__pattern1 __patternFail);
      bifoldl = v: v1: z: v2: 
        let
          __pattern0 = __fail: 
            if v2.__tag == "Left"
              then 
                let
                  f = v;
                  z1 = z;
                  a = v2.__field0;
                in
                  f z1 a
              else __fail;
          __pattern1 = __fail: 
            if v2.__tag == "Right"
              then 
                let
                  g = v1;
                  z1 = z;
                  b = v2.__field0;
                in
                  g z1 b
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 62:1 - 68:32";
        in
          __pattern0 (__pattern1 __patternFail);
      bifoldMap = dictMonoid: v: v1: v2: 
        let
          __pattern0 = __fail: 
            if v2.__tag == "Left"
              then 
                let
                  f = v;
                  a = v2.__field0;
                in
                  f a
              else __fail;
          __pattern1 = __fail: 
            if v2.__tag == "Right"
              then 
                let
                  g = v1;
                  b = v2.__field0;
                in
                  g b
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 62:1 - 68:32";
        in
          __pattern0 (__pattern1 __patternFail);
    };
  bifoldableConst = 
    { bifoldr = f: v: z: v1: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              a = v1;
            in
              f1 a z1;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 75:1 - 78:32";
        in
          __pattern0 __patternFail;
      bifoldl = f: v: z: v1: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              a = v1;
            in
              f1 z1 a;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 75:1 - 78:32";
        in
          __pattern0 __patternFail;
      bifoldMap = dictMonoid: f: v: v1: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              a = v1;
            in
              f1 a;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 75:1 - 78:32";
        in
          __pattern0 __patternFail;
    };
  bifoldableClown = dictFoldable: 
    let
      foldr = module."Data.Foldable".foldr dictFoldable;
      foldl = module."Data.Foldable".foldl dictFoldable;
      foldMap = module."Data.Foldable".foldMap dictFoldable;
    in
      
      { bifoldr = l: v: u: v1: 
          let
            __pattern0 = __fail: 
              let
                l1 = l;
                u1 = u;
                f = v1;
              in
                foldr l1 u1 f;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 42:1 - 45:40";
          in
            __pattern0 __patternFail;
        bifoldl = l: v: u: v1: 
          let
            __pattern0 = __fail: 
              let
                l1 = l;
                u1 = u;
                f = v1;
              in
                foldl l1 u1 f;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 42:1 - 45:40";
          in
            __pattern0 __patternFail;
        bifoldMap = dictMonoid: 
          let
            foldMap1 = foldMap dictMonoid;
          in
            l: v: v1: 
            let
              __pattern0 = __fail: 
                let
                  l1 = l;
                  f = v1;
                in
                  foldMap1 l1 f;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 42:1 - 45:40";
            in
              __pattern0 __patternFail;
      };
  bifoldMapDefaultR = dictBifoldable: 
    let
      bifoldr1 = bifoldr dictBifoldable;
    in
      dictMonoid: 
      let
        append = module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined);
        mempty = module."Data.Monoid".mempty dictMonoid;
      in
        f: g: bifoldr1 (compose append f) (compose append g) mempty;
  bifoldMapDefaultL = dictBifoldable: 
    let
      bifoldl1 = bifoldl dictBifoldable;
    in
      dictMonoid: 
      let
        append = module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined);
        mempty = module."Data.Monoid".mempty dictMonoid;
      in
        f: g: bifoldl1 (m: a: append m (f a)) (m: b: append m (g b)) mempty;
  bifoldMap = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.bifoldMap;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 40:3 - 40:76";
    in
      __pattern0 __patternFail;
  bifoldableFlip = dictBifoldable: 
    let
      bifoldr1 = bifoldr dictBifoldable;
      bifoldl1 = bifoldl dictBifoldable;
      bifoldMap1 = bifoldMap dictBifoldable;
    in
      
      { bifoldr = r: l: u: v: 
          let
            __pattern0 = __fail: 
              let
                r1 = r;
                l1 = l;
                u1 = u;
                p = v;
              in
                bifoldr1 l1 r1 u1 p;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 52:1 - 55:43";
          in
            __pattern0 __patternFail;
        bifoldl = r: l: u: v: 
          let
            __pattern0 = __fail: 
              let
                r1 = r;
                l1 = l;
                u1 = u;
                p = v;
              in
                bifoldl1 l1 r1 u1 p;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 52:1 - 55:43";
          in
            __pattern0 __patternFail;
        bifoldMap = dictMonoid: 
          let
            bifoldMap2 = bifoldMap1 dictMonoid;
          in
            r: l: v: 
            let
              __pattern0 = __fail: 
                let
                  r1 = r;
                  l1 = l;
                  p = v;
                in
                  bifoldMap2 l1 r1 p;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 52:1 - 55:43";
            in
              __pattern0 __patternFail;
      };
  bifoldlDefault = dictBifoldable: 
    let
      bifoldMap1 = bifoldMap dictBifoldable monoidDual;
    in
      f: g: z: p: unwrap (unwrap (bifoldMap1 (compose module."Data.Monoid.Dual".Dual (compose module."Data.Monoid.Endo".Endo (module."Data.Function".flip f))) (compose module."Data.Monoid.Dual".Dual (compose module."Data.Monoid.Endo".Endo (module."Data.Function".flip g))) p)) z;
  bifoldrDefault = dictBifoldable: 
    let
      bifoldMap1 = bifoldMap dictBifoldable monoidEndo;
    in
      f: g: z: p: unwrap (bifoldMap1 (compose module."Data.Monoid.Endo".Endo f) (compose module."Data.Monoid.Endo".Endo g) p) z;
  bifoldableProduct2 = dictBifoldable: 
    let
      bifoldMap1 = bifoldMap dictBifoldable;
    in
      dictBifoldable1: 
      let
        bifoldMap2 = bifoldMap dictBifoldable1;
      in
        
        { bifoldr = l: r: u: m: bifoldrDefault (bifoldableProduct2 dictBifoldable dictBifoldable1) l r u m;
          bifoldl = l: r: u: m: bifoldlDefault (bifoldableProduct2 dictBifoldable dictBifoldable1) l r u m;
          bifoldMap = dictMonoid: 
            let
              append = module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined);
              bifoldMap3 = bifoldMap1 dictMonoid;
              bifoldMap4 = bifoldMap2 dictMonoid;
            in
              l: r: v: 
              let
                __pattern0 = __fail: 
                  if v.__tag == "Product2"
                    then 
                      let
                        l1 = l;
                        r1 = r;
                        f = v.__field0;
                        g = v.__field1;
                      in
                        append (bifoldMap3 l1 r1 f) (bifoldMap4 l1 r1 g)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 57:1 - 60:68";
              in
                __pattern0 __patternFail;
        };
  bifold = dictBifoldable: 
    let
      bifoldMap1 = bifoldMap dictBifoldable;
    in
      dictMonoid: bifoldMap1 dictMonoid identity identity;
  biany = dictBifoldable: 
    let
      bifoldMap1 = bifoldMap dictBifoldable;
    in
      dictBooleanAlgebra: 
      let
        bifoldMap2 = bifoldMap1 (module."Data.Monoid.Disj".monoidDisj (dictBooleanAlgebra."HeytingAlgebra0" module."Prim".undefined));
      in
        p: q: compose unwrap (bifoldMap2 (compose module."Data.Monoid.Disj".Disj p) (compose module."Data.Monoid.Disj".Disj q));
  biall = dictBifoldable: 
    let
      bifoldMap1 = bifoldMap dictBifoldable;
    in
      dictBooleanAlgebra: 
      let
        bifoldMap2 = bifoldMap1 (module."Data.Monoid.Conj".monoidConj (dictBooleanAlgebra."HeytingAlgebra0" module."Prim".undefined));
      in
        p: q: compose unwrap (bifoldMap2 (compose module."Data.Monoid.Conj".Conj p) (compose module."Data.Monoid.Conj".Conj q));
in
  {inherit bifoldMap bifoldl bifoldr bifoldrDefault bifoldlDefault bifoldMapDefaultR bifoldMapDefaultL bifold bitraverse_ bifor_ bisequence_ biany biall bifoldableClown bifoldableJoker bifoldableFlip bifoldableProduct2 bifoldableEither bifoldableTuple bifoldableConst;}