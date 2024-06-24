
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Functor.Contravariant" = import ../Data.Functor.Contravariant;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Prelude" = import ../Prelude;
    };
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  Op = x: x;
  semigroupoidOp = 
    { compose = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              g = v1;
            in
              compose g f;
          __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Op.purs at 15:1 - 16:43";
        in
          __pattern0 __patternFail;
    };
  semigroupOp = dictSemigroup: module."Data.Semigroup".semigroupFn dictSemigroup;
  newtypeOp = {"Coercible0" = _: module."Prim".undefined;};
  monoidOp = dictMonoid: module."Data.Monoid".monoidFn dictMonoid;
  contravariantOp = 
    { cmap = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              g = v;
            in
              compose g f1;
          __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Op.purs at 21:1 - 22:31";
        in
          __pattern0 __patternFail;
    };
  categoryOp = 
    { identity = module."Control.Category".identity module."Control.Category".categoryFn;
      "Semigroupoid0" = _: semigroupoidOp;
    };
in
  {inherit Op newtypeOp semigroupOp monoidOp semigroupoidOp categoryOp contravariantOp;}