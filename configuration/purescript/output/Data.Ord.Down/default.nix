
let
  module = 
    { "Data.Bounded" = import ../Data.Bounded;
      "Data.Eq" = import ../Data.Eq;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  Down = x: x;
  showDown = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                a = v;
              in
                append "(Down " (append (show a) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/orders/master/src/Data/Ord/Down.purs at 25:1 - 26:44";
          in
            __pattern0 __patternFail;
      };
  newtypeDown = {"Coercible0" = _: module."Prim".undefined;};
  eqDown = dictEq: dictEq;
  ordDown = dictOrd: 
    let
      compare = module."Data.Ord".compare dictOrd;
      eqDown1 = eqDown (dictOrd."Eq0" module."Prim".undefined);
    in
      
      { compare = v: v1: 
          let
            __pattern0 = __fail: 
              let
                x = v;
                y = v1;
              in
                module."Data.Ordering".invert (compare x y);
            __patternFail = builtins.throw "Pattern match failure in .spago/orders/master/src/Data/Ord/Down.purs at 18:1 - 19:51";
          in
            __pattern0 __patternFail;
        "Eq0" = _: eqDown1;
      };
  boundedDown = dictBounded: 
    let
      ordDown1 = ordDown (dictBounded."Ord0" module."Prim".undefined);
    in
      
      { top = module."Data.Bounded".bottom dictBounded;
        bottom = module."Data.Bounded".top dictBounded;
        "Ord0" = _: ordDown1;
      };
in
  {inherit Down newtypeDown eqDown ordDown boundedDown showDown;}