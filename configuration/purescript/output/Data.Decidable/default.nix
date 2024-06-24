
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Data.Comparison" = import ../Data.Comparison;
      "Data.Decide" = import ../Data.Decide;
      "Data.Divisible" = import ../Data.Divisible;
      "Data.Equivalence" = import ../Data.Equivalence;
      "Data.Op" = import ../Data.Op;
      "Data.Predicate" = import ../Data.Predicate;
      "Data.Void" = import ../Data.Void;
      "Prelude" = import ../Prelude;
    };
  identity = module."Control.Category".identity module."Control.Category".categoryFn;
  Decidable-Dict = x: x;
  lose = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.lose;
      __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Decidable.purs at 14:3 - 14:39";
    in
      __pattern0 __patternFail;
  lost = dictDecidable: lose dictDecidable identity;
  decidablePredicate = 
    { lose = f: a: module."Data.Void".absurd (f a);
      "Decide0" = _: module."Data.Decide".choosePredicate;
      "Divisible1" = _: module."Data.Divisible".divisiblePredicate;
    };
  decidableOp = dictMonoid: 
    let
      chooseOp = module."Data.Decide".chooseOp (dictMonoid."Semigroup0" module."Prim".undefined);
      divisibleOp = module."Data.Divisible".divisibleOp dictMonoid;
    in
      
      { lose = f: a: module."Data.Void".absurd (f a);
        "Decide0" = _: chooseOp;
        "Divisible1" = _: divisibleOp;
      };
  decidableEquivalence = 
    { lose = f: a: module."Data.Void".absurd (f a);
      "Decide0" = _: module."Data.Decide".chooseEquivalence;
      "Divisible1" = _: module."Data.Divisible".divisibleEquivalence;
    };
  decidableComparison = 
    { lose = f: a: v: module."Data.Void".absurd (f a);
      "Decide0" = _: module."Data.Decide".chooseComparison;
      "Divisible1" = _: module."Data.Divisible".divisibleComparison;
    };
in
  {inherit lose lost decidableComparison decidableEquivalence decidablePredicate decidableOp;}