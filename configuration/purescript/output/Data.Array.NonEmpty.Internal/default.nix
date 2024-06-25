
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Monad" = import ../Control.Monad;
      "Data.Eq" = import ../Data.Eq;
      "Data.Foldable" = import ../Data.Foldable;
      "Data.FoldableWithIndex" = import ../Data.FoldableWithIndex;
      "Data.Functor" = import ../Data.Functor;
      "Data.FunctorWithIndex" = import ../Data.FunctorWithIndex;
      "Data.Ord" = import ../Data.Ord;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Semigroup.Foldable" = import ../Data.Semigroup.Foldable;
      "Data.Semigroup.Traversable" = import ../Data.Semigroup.Traversable;
      "Data.Show" = import ../Data.Show;
      "Data.Traversable" = import ../Data.Traversable;
      "Data.TraversableWithIndex" = import ../Data.TraversableWithIndex;
      "Data.Unfoldable1" = import ../Data.Unfoldable1;
      "Prelude" = import ../Prelude;
    };
  foreign = import ./foreign.nix;
  foldr1Impl = foreign.foldr1Impl;
  foldl1Impl = foreign.foldl1Impl;
  traverse1Impl = foreign.traverse1Impl;
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  NonEmptyArray = x: x;
  unfoldable1NonEmptyArray = module."Data.Unfoldable1".unfoldable1Array;
  traversableWithIndexNonEmptyArray = module."Data.TraversableWithIndex".traversableWithIndexArray;
  traversableNonEmptyArray = module."Data.Traversable".traversableArray;
  showNonEmptyArray = dictShow: 
    let
      show = module."Data.Show".show (module."Data.Show".showArray dictShow);
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                xs = v;
              in
                append "(NonEmptyArray " (append (show xs) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/NonEmpty/Internal.purs at 33:1 - 34:64";
          in
            __pattern0 __patternFail;
      };
  semigroupNonEmptyArray = module."Data.Semigroup".semigroupArray;
  ordNonEmptyArray = dictOrd: module."Data.Ord".ordArray dictOrd;
  ord1NonEmptyArray = module."Data.Ord".ord1Array;
  monadNonEmptyArray = module."Control.Monad".monadArray;
  functorWithIndexNonEmptyArray = module."Data.FunctorWithIndex".functorWithIndexArray;
  functorNonEmptyArray = module."Data.Functor".functorArray;
  foldableWithIndexNonEmptyArray = module."Data.FoldableWithIndex".foldableWithIndexArray;
  foldableNonEmptyArray = module."Data.Foldable".foldableArray;
  foldable1NonEmptyArray = 
    { foldMap1 = dictSemigroup: module."Data.Semigroup.Foldable".foldMap1DefaultL foldable1NonEmptyArray functorNonEmptyArray dictSemigroup;
      foldr1 = foldr1Impl;
      foldl1 = foldl1Impl;
      "Foldable0" = _: foldableNonEmptyArray;
    };
  traversable1NonEmptyArray = 
    { traverse1 = dictApply: traverse1Impl (module."Control.Apply".apply dictApply) (module."Data.Functor".map (dictApply."Functor0" module."Prim".undefined));
      sequence1 = dictApply: module."Data.Semigroup.Traversable".sequence1Default traversable1NonEmptyArray dictApply;
      "Foldable10" = _: foldable1NonEmptyArray;
      "Traversable1" = _: traversableNonEmptyArray;
    };
  eqNonEmptyArray = dictEq: module."Data.Eq".eqArray dictEq;
  eq1NonEmptyArray = module."Data.Eq".eq1Array;
  bindNonEmptyArray = module."Control.Bind".bindArray;
  applyNonEmptyArray = module."Control.Apply".applyArray;
  applicativeNonEmptyArray = module."Control.Applicative".applicativeArray;
  altNonEmptyArray = module."Control.Alt".altArray;
in
  {inherit NonEmptyArray showNonEmptyArray eqNonEmptyArray eq1NonEmptyArray ordNonEmptyArray ord1NonEmptyArray semigroupNonEmptyArray functorNonEmptyArray functorWithIndexNonEmptyArray foldableNonEmptyArray foldableWithIndexNonEmptyArray foldable1NonEmptyArray unfoldable1NonEmptyArray traversableNonEmptyArray traversableWithIndexNonEmptyArray traversable1NonEmptyArray applyNonEmptyArray applicativeNonEmptyArray bindNonEmptyArray monadNonEmptyArray altNonEmptyArray;}