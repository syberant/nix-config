
let
  module = 
    { "Data.CommutativeRing" = import ../Data.CommutativeRing;
      "Data.DivisionRing" = import ../Data.DivisionRing;
      "Data.EuclideanRing" = import ../Data.EuclideanRing;
      "Data.Ring" = import ../Data.Ring;
      "Data.Semiring" = import ../Data.Semiring;
    };
  Field-Dict = x: x;
  field = dictEuclideanRing: dictDivisionRing: 
    { "EuclideanRing0" = _: dictEuclideanRing;
      "DivisionRing1" = _: dictDivisionRing;
    };
in
  
  { inherit field;
    inherit (module."Data.CommutativeRing");
    inherit (module."Data.DivisionRing") recip;
    inherit (module."Data.EuclideanRing") degree div gcd lcm mod;
    inherit (module."Data.Ring") negate sub;
    inherit (module."Data.Semiring") add mul one zero;
  }