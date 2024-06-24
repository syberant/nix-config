
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Category" = import ../Control.Category;
      "Control.Monad" = import ../Control.Monad;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Boolean" = import ../Data.Boolean;
      "Data.BooleanAlgebra" = import ../Data.BooleanAlgebra;
      "Data.Bounded" = import ../Data.Bounded;
      "Data.CommutativeRing" = import ../Data.CommutativeRing;
      "Data.DivisionRing" = import ../Data.DivisionRing;
      "Data.Eq" = import ../Data.Eq;
      "Data.EuclideanRing" = import ../Data.EuclideanRing;
      "Data.Field" = import ../Data.Field;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.NaturalTransformation" = import ../Data.NaturalTransformation;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Ring" = import ../Data.Ring;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Show" = import ../Data.Show;
      "Data.Unit" = import ../Data.Unit;
      "Data.Void" = import ../Data.Void;
    };
in
  
  { inherit (module."Control.Applicative") liftA1 pure unless when;
    inherit (module."Control.Apply") apply;
    inherit (module."Control.Bind") bind discard ifM join;
    inherit (module."Control.Category") identity;
    inherit (module."Control.Monad") ap liftM1 unlessM whenM;
    inherit (module."Control.Semigroupoid") compose;
    inherit (module."Data.Boolean") otherwise;
    inherit (module."Data.BooleanAlgebra");
    inherit (module."Data.Bounded") bottom top;
    inherit (module."Data.CommutativeRing");
    inherit (module."Data.DivisionRing") recip;
    inherit (module."Data.Eq") eq notEq;
    inherit (module."Data.EuclideanRing") degree div gcd lcm mod;
    inherit (module."Data.Field");
    inherit (module."Data.Function") const flip;
    inherit (module."Data.Functor") flap map void;
    inherit (module."Data.HeytingAlgebra") conj disj not;
    inherit (module."Data.Monoid") mempty;
    inherit (module."Data.NaturalTransformation");
    inherit (module."Data.Ord") between clamp compare comparing max min;
    inherit (module."Data.Ordering") EQ GT LT;
    inherit (module."Data.Ring") negate sub;
    inherit (module."Data.Semigroup") append;
    inherit (module."Data.Semiring") add mul one zero;
    inherit (module."Data.Show") show;
    inherit (module."Data.Unit") unit;
    inherit (module."Data.Void") absurd;
  }