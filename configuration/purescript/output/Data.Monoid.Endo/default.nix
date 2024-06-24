
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Bounded" = import ../Data.Bounded;
      "Data.Eq" = import ../Data.Eq;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Ord" = import ../Data.Ord;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  Endo = x: x;
  showEndo = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                x = v;
              in
                append "(Endo " (append (show x) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Endo.purs at 23:1 - 24:44";
          in
            __pattern0 __patternFail;
      };
  semigroupEndo = dictSemigroupoid: 
    let
      compose = module."Control.Semigroupoid".compose dictSemigroupoid;
    in
      
      { append = v: v1: 
          let
            __pattern0 = __fail: 
              let
                a = v;
                b = v1;
              in
                compose a b;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Endo.purs at 26:1 - 27:44";
          in
            __pattern0 __patternFail;
      };
  ordEndo = dictOrd: dictOrd;
  monoidEndo = dictCategory: 
    let
      semigroupEndo1 = semigroupEndo (dictCategory."Semigroupoid0" module."Prim".undefined);
    in
      
      { mempty = module."Control.Category".identity dictCategory;
        "Semigroup0" = _: semigroupEndo1;
      };
  eqEndo = dictEq: dictEq;
  boundedEndo = dictBounded: dictBounded;
in
  {inherit Endo eqEndo ordEndo boundedEndo showEndo semigroupEndo monoidEndo;}