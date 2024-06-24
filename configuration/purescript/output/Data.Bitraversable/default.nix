
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Category" = import ../Control.Category;
      "Data.Bifoldable" = import ../Data.Bifoldable;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Const" = import ../Data.Const;
      "Data.Either" = import ../Data.Either;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.Clown" = import ../Data.Functor.Clown;
      "Data.Functor.Flip" = import ../Data.Functor.Flip;
      "Data.Functor.Joker" = import ../Data.Functor.Joker;
      "Data.Functor.Product2" = import ../Data.Functor.Product2;
      "Data.Traversable" = import ../Data.Traversable;
      "Data.Tuple" = import ../Data.Tuple;
      "Prelude" = import ../Prelude;
    };
  identity = module."Control.Category".identity module."Control.Category".categoryFn;
  Bitraversable-Dict = x: x;
  bitraverse = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.bitraverse;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 38:3 - 38:98";
    in
      __pattern0 __patternFail;
  lfor = dictBitraversable: 
    let
      bitraverse1 = bitraverse dictBitraversable;
    in
      dictApplicative: 
      let
        bitraverse2 = bitraverse1 dictApplicative;
        pure = module."Control.Applicative".pure dictApplicative;
      in
        t: f: bitraverse2 f pure t;
  ltraverse = dictBitraversable: 
    let
      bitraverse1 = bitraverse dictBitraversable;
    in
      dictApplicative: 
      let
        bitraverse2 = bitraverse1 dictApplicative;
        pure = module."Control.Applicative".pure dictApplicative;
      in
        f: bitraverse2 f pure;
  rfor = dictBitraversable: 
    let
      bitraverse1 = bitraverse dictBitraversable;
    in
      dictApplicative: 
      let
        bitraverse2 = bitraverse1 dictApplicative;
        pure = module."Control.Applicative".pure dictApplicative;
      in
        t: f: bitraverse2 pure f t;
  rtraverse = dictBitraversable: 
    let
      bitraverse1 = bitraverse dictBitraversable;
    in
      dictApplicative: bitraverse1 dictApplicative (module."Control.Applicative".pure dictApplicative);
  bitraversableTuple = 
    { bitraverse = dictApplicative: 
        let
          Apply0 = dictApplicative."Apply0" module."Prim".undefined;
          apply = module."Control.Apply".apply Apply0;
          map = module."Data.Functor".map (Apply0."Functor0" module."Prim".undefined);
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
                    apply (map module."Data.Tuple".Tuple (f1 a)) (g1 b)
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 63:1 - 65:45";
          in
            __pattern0 __patternFail;
      bisequence = dictApplicative: 
        let
          Apply0 = dictApplicative."Apply0" module."Prim".undefined;
          apply = module."Control.Apply".apply Apply0;
          map = module."Data.Functor".map (Apply0."Functor0" module."Prim".undefined);
        in
          v: 
          let
            __pattern0 = __fail: 
              if v.__tag == "Tuple"
                then 
                  let
                    a = v.__field0;
                    b = v.__field1;
                  in
                    apply (map module."Data.Tuple".Tuple a) b
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 63:1 - 65:45";
          in
            __pattern0 __patternFail;
      "Bifunctor0" = _: module."Data.Bifunctor".bifunctorTuple;
      "Bifoldable1" = _: module."Data.Bifoldable".bifoldableTuple;
    };
  bitraversableJoker = dictTraversable: 
    let
      traverse = module."Data.Traversable".traverse dictTraversable;
      sequence = module."Data.Traversable".sequence dictTraversable;
      bifunctorJoker = module."Data.Functor.Joker".bifunctorJoker (dictTraversable."Functor0" module."Prim".undefined);
      bifoldableJoker = module."Data.Bifoldable".bifoldableJoker (dictTraversable."Foldable1" module."Prim".undefined);
    in
      
      { bitraverse = dictApplicative: 
          let
            map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
            traverse1 = traverse dictApplicative;
          in
            v: r: v1: 
            let
              __pattern0 = __fail: 
                let
                  r1 = r;
                  f = v1;
                in
                  map module."Data.Functor.Joker".Joker (traverse1 r1 f);
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 45:1 - 47:46";
            in
              __pattern0 __patternFail;
        bisequence = dictApplicative: 
          let
            map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
            sequence1 = sequence dictApplicative;
          in
            v: 
            let
              __pattern0 = __fail: 
                let
                  f = v;
                in
                  map module."Data.Functor.Joker".Joker (sequence1 f);
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 45:1 - 47:46";
            in
              __pattern0 __patternFail;
        "Bifunctor0" = _: bifunctorJoker;
        "Bifoldable1" = _: bifoldableJoker;
      };
  bitraversableEither = 
    { bitraverse = dictApplicative: 
        let
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
        in
          v: v1: v2: 
          let
            __pattern0 = __fail: 
              if v2.__tag == "Left"
                then 
                  let
                    f = v;
                    a = v2.__field0;
                  in
                    map module."Data.Either".Left (f a)
                else __fail;
            __pattern1 = __fail: 
              if v2.__tag == "Right"
                then 
                  let
                    g = v1;
                    b = v2.__field0;
                  in
                    map module."Data.Either".Right (g b)
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 57:1 - 61:37";
          in
            __pattern0 (__pattern1 __patternFail);
      bisequence = dictApplicative: 
        let
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
        in
          v: 
          let
            __pattern0 = __fail: 
              if v.__tag == "Left"
                then 
                  let
                    a = v.__field0;
                  in
                    map module."Data.Either".Left a
                else __fail;
            __pattern1 = __fail: 
              if v.__tag == "Right"
                then 
                  let
                    b = v.__field0;
                  in
                    map module."Data.Either".Right b
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 57:1 - 61:37";
          in
            __pattern0 (__pattern1 __patternFail);
      "Bifunctor0" = _: module."Data.Bifunctor".bifunctorEither;
      "Bifoldable1" = _: module."Data.Bifoldable".bifoldableEither;
    };
  bitraversableConst = 
    { bitraverse = dictApplicative: 
        let
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
        in
          f: v: v1: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                a = v1;
              in
                map module."Data.Const".Const (f1 a);
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 67:1 - 69:37";
          in
            __pattern0 __patternFail;
      bisequence = dictApplicative: 
        let
          map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
        in
          v: 
          let
            __pattern0 = __fail: 
              let
                a = v;
              in
                map module."Data.Const".Const a;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 67:1 - 69:37";
          in
            __pattern0 __patternFail;
      "Bifunctor0" = _: module."Data.Bifunctor".bifunctorConst;
      "Bifoldable1" = _: module."Data.Bifoldable".bifoldableConst;
    };
  bitraversableClown = dictTraversable: 
    let
      traverse = module."Data.Traversable".traverse dictTraversable;
      sequence = module."Data.Traversable".sequence dictTraversable;
      bifunctorClown = module."Data.Functor.Clown".bifunctorClown (dictTraversable."Functor0" module."Prim".undefined);
      bifoldableClown = module."Data.Bifoldable".bifoldableClown (dictTraversable."Foldable1" module."Prim".undefined);
    in
      
      { bitraverse = dictApplicative: 
          let
            map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
            traverse1 = traverse dictApplicative;
          in
            l: v: v1: 
            let
              __pattern0 = __fail: 
                let
                  l1 = l;
                  f = v1;
                in
                  map module."Data.Functor.Clown".Clown (traverse1 l1 f);
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 41:1 - 43:46";
            in
              __pattern0 __patternFail;
        bisequence = dictApplicative: 
          let
            map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
            sequence1 = sequence dictApplicative;
          in
            v: 
            let
              __pattern0 = __fail: 
                let
                  f = v;
                in
                  map module."Data.Functor.Clown".Clown (sequence1 f);
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 41:1 - 43:46";
            in
              __pattern0 __patternFail;
        "Bifunctor0" = _: bifunctorClown;
        "Bifoldable1" = _: bifoldableClown;
      };
  bisequenceDefault = dictBitraversable: 
    let
      bitraverse1 = bitraverse dictBitraversable;
    in
      dictApplicative: bitraverse1 dictApplicative identity identity;
  bisequence = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.bisequence;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 39:3 - 39:74";
    in
      __pattern0 __patternFail;
  bitraversableFlip = dictBitraversable: 
    let
      bitraverse1 = bitraverse dictBitraversable;
      bisequence1 = bisequence dictBitraversable;
      bifunctorFlip = module."Data.Functor.Flip".bifunctorFlip (dictBitraversable."Bifunctor0" module."Prim".undefined);
      bifoldableFlip = module."Data.Bifoldable".bifoldableFlip (dictBitraversable."Bifoldable1" module."Prim".undefined);
    in
      
      { bitraverse = dictApplicative: 
          let
            map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
            bitraverse2 = bitraverse1 dictApplicative;
          in
            r: l: v: 
            let
              __pattern0 = __fail: 
                let
                  r1 = r;
                  l1 = l;
                  p = v;
                in
                  map module."Data.Functor.Flip".Flip (bitraverse2 l1 r1 p);
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 49:1 - 51:46";
            in
              __pattern0 __patternFail;
        bisequence = dictApplicative: 
          let
            map = module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
            bisequence2 = bisequence1 dictApplicative;
          in
            v: 
            let
              __pattern0 = __fail: 
                let
                  p = v;
                in
                  map module."Data.Functor.Flip".Flip (bisequence2 p);
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 49:1 - 51:46";
            in
              __pattern0 __patternFail;
        "Bifunctor0" = _: bifunctorFlip;
        "Bifoldable1" = _: bifoldableFlip;
      };
  bitraversableProduct2 = dictBitraversable: 
    let
      bitraverse1 = bitraverse dictBitraversable;
      bisequence1 = bisequence dictBitraversable;
      bifunctorProduct2 = module."Data.Functor.Product2".bifunctorProduct2 (dictBitraversable."Bifunctor0" module."Prim".undefined);
      bifoldableProduct2 = module."Data.Bifoldable".bifoldableProduct2 (dictBitraversable."Bifoldable1" module."Prim".undefined);
    in
      dictBitraversable1: 
      let
        bitraverse2 = bitraverse dictBitraversable1;
        bisequence2 = bisequence dictBitraversable1;
        bifunctorProduct21 = bifunctorProduct2 (dictBitraversable1."Bifunctor0" module."Prim".undefined);
        bifoldableProduct21 = bifoldableProduct2 (dictBitraversable1."Bifoldable1" module."Prim".undefined);
      in
        
        { bitraverse = dictApplicative: 
            let
              Apply0 = dictApplicative."Apply0" module."Prim".undefined;
              apply = module."Control.Apply".apply Apply0;
              map = module."Data.Functor".map (Apply0."Functor0" module."Prim".undefined);
              bitraverse3 = bitraverse1 dictApplicative;
              bitraverse4 = bitraverse2 dictApplicative;
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
                        apply (map module."Data.Functor.Product2".Product2 (bitraverse3 l1 r1 f)) (bitraverse4 l1 r1 g)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 53:1 - 55:73";
              in
                __pattern0 __patternFail;
          bisequence = dictApplicative: 
            let
              Apply0 = dictApplicative."Apply0" module."Prim".undefined;
              apply = module."Control.Apply".apply Apply0;
              map = module."Data.Functor".map (Apply0."Functor0" module."Prim".undefined);
              bisequence3 = bisequence1 dictApplicative;
              bisequence4 = bisequence2 dictApplicative;
            in
              v: 
              let
                __pattern0 = __fail: 
                  if v.__tag == "Product2"
                    then 
                      let
                        f = v.__field0;
                        g = v.__field1;
                      in
                        apply (map module."Data.Functor.Product2".Product2 (bisequence3 f)) (bisequence4 g)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 53:1 - 55:73";
              in
                __pattern0 __patternFail;
          "Bifunctor0" = _: bifunctorProduct21;
          "Bifoldable1" = _: bifoldableProduct21;
        };
  bitraverseDefault = dictBitraversable: 
    let
      bisequence1 = bisequence dictBitraversable;
      bimap = module."Data.Bifunctor".bimap (dictBitraversable."Bifunctor0" module."Prim".undefined);
    in
      dictApplicative: 
      let
        bisequence2 = bisequence1 dictApplicative;
      in
        f: g: t: bisequence2 (bimap f g t);
  bifor = dictBitraversable: 
    let
      bitraverse1 = bitraverse dictBitraversable;
    in
      dictApplicative: 
      let
        bitraverse2 = bitraverse1 dictApplicative;
      in
        t: f: g: bitraverse2 f g t;
in
  
  { inherit bitraverse bisequence bitraverseDefault bisequenceDefault ltraverse rtraverse bifor lfor rfor bitraversableClown bitraversableJoker bitraversableFlip bitraversableProduct2 bitraversableEither bitraversableTuple bitraversableConst;
    inherit (module."Data.Bifoldable") biall biany bifold bifoldMap bifoldMapDefaultL bifoldMapDefaultR bifoldl bifoldlDefault bifoldr bifoldrDefault bifor_ bisequence_ bitraverse_;
  }