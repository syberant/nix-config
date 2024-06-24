
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Data.Functor" = import ../Data.Functor;
      "Data.Identity" = import ../Data.Identity;
      "Data.Monoid.Dual" = import ../Data.Monoid.Dual;
      "Data.Monoid.Multiplicative" = import ../Data.Monoid.Multiplicative;
      "Data.Semigroup.Foldable" = import ../Data.Semigroup.Foldable;
      "Data.Traversable" = import ../Data.Traversable;
      "Data.Tuple" = import ../Data.Tuple;
      "Prelude" = import ../Prelude;
    };
  identity = module."Control.Category".identity module."Control.Category".categoryFn;
  Traversable1-Dict = x: x;
  traverse1 = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.traverse1;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Traversable.purs at 36:3 - 36:69";
    in
      __pattern0 __patternFail;
  traversableTuple = 
    { traverse1 = dictApply: 
        let
          map = module."Data.Functor".map (dictApply."Functor0" module."Prim".undefined);
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
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Traversable.purs at 47:1 - 49:40";
          in
            __pattern0 __patternFail;
      sequence1 = dictApply: 
        let
          map = module."Data.Functor".map (dictApply."Functor0" module."Prim".undefined);
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
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Traversable.purs at 47:1 - 49:40";
          in
            __pattern0 __patternFail;
      "Foldable10" = _: module."Data.Semigroup.Foldable".foldableTuple;
      "Traversable1" = _: module."Data.Traversable".traversableTuple;
    };
  traversableIdentity = 
    { traverse1 = dictApply: 
        let
          map = module."Data.Functor".map (dictApply."Functor0" module."Prim".undefined);
        in
          f: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                x = v;
              in
                map module."Data.Identity".Identity (f1 x);
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Traversable.purs at 51:1 - 53:42";
          in
            __pattern0 __patternFail;
      sequence1 = dictApply: 
        let
          map = module."Data.Functor".map (dictApply."Functor0" module."Prim".undefined);
        in
          v: 
          let
            __pattern0 = __fail: 
              let
                x = v;
              in
                map module."Data.Identity".Identity x;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Traversable.purs at 51:1 - 53:42";
          in
            __pattern0 __patternFail;
      "Foldable10" = _: module."Data.Semigroup.Foldable".foldableIdentity;
      "Traversable1" = _: module."Data.Traversable".traversableIdentity;
    };
  sequence1Default = dictTraversable1: 
    let
      traverse11 = traverse1 dictTraversable1;
    in
      dictApply: traverse11 dictApply identity;
  traversableDual = 
    { traverse1 = dictApply: 
        let
          map = module."Data.Functor".map (dictApply."Functor0" module."Prim".undefined);
        in
          f: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                x = v;
              in
                map module."Data.Monoid.Dual".Dual (f1 x);
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Traversable.purs at 39:1 - 41:31";
          in
            __pattern0 __patternFail;
      sequence1 = dictApply: sequence1Default traversableDual dictApply;
      "Foldable10" = _: module."Data.Semigroup.Foldable".foldableDual;
      "Traversable1" = _: module."Data.Traversable".traversableDual;
    };
  traversableMultiplicative = 
    { traverse1 = dictApply: 
        let
          map = module."Data.Functor".map (dictApply."Functor0" module."Prim".undefined);
        in
          f: v: 
          let
            __pattern0 = __fail: 
              let
                f1 = f;
                x = v;
              in
                map module."Data.Monoid.Multiplicative".Multiplicative (f1 x);
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Traversable.purs at 43:1 - 45:31";
          in
            __pattern0 __patternFail;
      sequence1 = dictApply: sequence1Default traversableMultiplicative dictApply;
      "Foldable10" = _: module."Data.Semigroup.Foldable".foldableMultiplicative;
      "Traversable1" = _: module."Data.Traversable".traversableMultiplicative;
    };
  sequence1 = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.sequence1;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Traversable.purs at 37:3 - 37:57";
    in
      __pattern0 __patternFail;
  traverse1Default = dictTraversable1: 
    let
      sequence11 = sequence1 dictTraversable1;
      map = module."Data.Functor".map ((dictTraversable1."Traversable1" module."Prim".undefined)."Functor0" module."Prim".undefined);
    in
      dictApply: 
      let
        sequence12 = sequence11 dictApply;
      in
        f: ta: sequence12 (map f ta);
in
  {inherit sequence1 traverse1 traverse1Default sequence1Default traversableDual traversableMultiplicative traversableTuple traversableIdentity;}