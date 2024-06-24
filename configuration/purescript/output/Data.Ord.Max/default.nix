
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
  Max = x: x;
  showMax = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                a = v;
              in
                append "(Max " (append (show a) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/orders/master/src/Data/Ord/Max.purs at 28:1 - 29:42";
          in
            __pattern0 __patternFail;
      };
  semigroupMax = dictOrd: 
    let
      max = module."Data.Ord".max dictOrd;
    in
      
      { append = v: v1: 
          let
            __pattern0 = __fail: 
              let
                x = v;
                y = v1;
              in
                max x y;
            __patternFail = builtins.throw "Pattern match failure in .spago/orders/master/src/Data/Ord/Max.purs at 22:1 - 23:41";
          in
            __pattern0 __patternFail;
      };
  newtypeMax = {"Coercible0" = _: module."Prim".undefined;};
  monoidMax = dictBounded: 
    let
      semigroupMax1 = semigroupMax (dictBounded."Ord0" module."Prim".undefined);
    in
      
      { mempty = module."Data.Bounded".bottom dictBounded;
        "Semigroup0" = _: semigroupMax1;
      };
  eqMax = dictEq: dictEq;
  ordMax = dictOrd: 
    let
      compare = module."Data.Ord".compare dictOrd;
      eqMax1 = eqMax (dictOrd."Eq0" module."Prim".undefined);
    in
      
      { compare = v: v1: 
          let
            __pattern0 = __fail: 
              let
                x = v;
                y = v1;
              in
                compare x y;
            __patternFail = builtins.throw "Pattern match failure in .spago/orders/master/src/Data/Ord/Max.purs at 19:1 - 20:40";
          in
            __pattern0 __patternFail;
        "Eq0" = _: eqMax1;
      };
in
  {inherit Max newtypeMax eqMax ordMax semigroupMax monoidMax showMax;}