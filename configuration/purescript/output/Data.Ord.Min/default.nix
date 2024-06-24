
let
  module = 
    { "Data.Bounded" = import ../Data.Bounded;
      "Data.Eq" = import ../Data.Eq;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  Min = x: x;
  showMin = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                a = v;
              in
                append "(Min " (append (show a) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/orders/master/src/Data/Ord/Min.purs at 28:1 - 29:42";
          in
            __pattern0 __patternFail;
      };
  semigroupMin = dictOrd: 
    let
      min = module."Data.Ord".min dictOrd;
    in
      
      { append = v: v1: 
          let
            __pattern0 = __fail: 
              let
                x = v;
                y = v1;
              in
                min x y;
            __patternFail = builtins.throw "Pattern match failure in .spago/orders/master/src/Data/Ord/Min.purs at 22:1 - 23:41";
          in
            __pattern0 __patternFail;
      };
  newtypeMin = {"Coercible0" = _: module."Prim".undefined;};
  monoidMin = dictBounded: 
    let
      semigroupMin1 = semigroupMin (dictBounded."Ord0" module."Prim".undefined);
    in
      
      { mempty = module."Data.Bounded".top dictBounded;
        "Semigroup0" = _: semigroupMin1;
      };
  eqMin = dictEq: dictEq;
  ordMin = dictOrd: 
    let
      compare = module."Data.Ord".compare dictOrd;
      eqMin1 = eqMin (dictOrd."Eq0" module."Prim".undefined);
    in
      
      { compare = v: v1: 
          let
            __pattern0 = __fail: 
              let
                x = v;
                y = v1;
              in
                compare x y;
            __patternFail = builtins.throw "Pattern match failure in .spago/orders/master/src/Data/Ord/Min.purs at 19:1 - 20:40";
          in
            __pattern0 __patternFail;
        "Eq0" = _: eqMin1;
      };
in
  {inherit Min newtypeMin eqMin ordMin semigroupMin monoidMin showMin;}