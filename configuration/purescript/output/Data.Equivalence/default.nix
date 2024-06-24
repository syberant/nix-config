
let
  module = 
    { "Data.Comparison" = import ../Data.Comparison;
      "Data.Eq" = import ../Data.Eq;
      "Data.Function" = import ../Data.Function;
      "Data.Functor.Contravariant" = import ../Data.Functor.Contravariant;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Prelude" = import ../Prelude;
    };
  conj = module."Data.HeytingAlgebra".conj module."Data.HeytingAlgebra".heytingAlgebraBoolean;
  eq = module."Data.Eq".eq module."Data.Ordering".eqOrdering;
  Equivalence = x: x;
  semigroupEquivalence = 
    { append = v: v1: 
        let
          __pattern0 = __fail: 
            let
              p = v;
              q = v1;
            in
              a: b: conj (p a b) (q a b);
          __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Equivalence.purs at 19:1 - 20:80";
        in
          __pattern0 __patternFail;
    };
  newtypeEquivalence = {"Coercible0" = _: module."Prim".undefined;};
  monoidEquivalence = 
    { mempty = v: v1: true;
      "Semigroup0" = _: semigroupEquivalence;
    };
  defaultEquivalence = dictEq: module."Data.Eq".eq dictEq;
  contravariantEquivalence = 
    { cmap = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              g = v;
            in
              module."Data.Function".on g f1;
          __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Equivalence.purs at 16:1 - 17:50";
        in
          __pattern0 __patternFail;
    };
  comparisonEquivalence = v: 
    let
      __pattern0 = __fail: 
        let
          p = v;
        in
          a: b: eq (p a b) module."Data.Ordering".EQ;
      __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Equivalence.purs at 30:1 - 30:65";
    in
      __pattern0 __patternFail;
in
  {inherit Equivalence defaultEquivalence comparisonEquivalence newtypeEquivalence contravariantEquivalence semigroupEquivalence monoidEquivalence;}