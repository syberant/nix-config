
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Data.Functor" = import ../Data.Functor;
      "Data.Semigroup" = import ../Data.Semigroup;
    };
  foreign = import ./foreign.nix;
  arrayExtend = foreign.arrayExtend;
  identity = module."Control.Category".identity module."Control.Category".categoryFn;
  Extend-Dict = x: x;
  extendFn = dictSemigroup: 
    let
      append = module."Data.Semigroup".append dictSemigroup;
    in
      
      { extend = f: g: w: f (w': g (append w w'));
        "Functor0" = _: module."Data.Functor".functorFn;
      };
  extendArray = 
    { extend = arrayExtend;
      "Functor0" = _: module."Data.Functor".functorArray;
    };
  extend = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.extend;
      __patternFail = builtins.throw "Pattern match failure in .spago/control/master/src/Control/Extend.purs at 25:3 - 25:49";
    in
      __pattern0 __patternFail;
  extendFlipped = dictExtend: 
    let
      extend1 = extend dictExtend;
    in
      w: f: extend1 f w;
  duplicate = dictExtend: extend dictExtend identity;
  composeCoKleisliFlipped = dictExtend: 
    let
      extend1 = extend dictExtend;
    in
      f: g: w: f (extend1 g w);
  composeCoKleisli = dictExtend: 
    let
      extend1 = extend dictExtend;
    in
      f: g: w: g (extend1 f w);
in
  
  { inherit extend extendFlipped composeCoKleisli composeCoKleisliFlipped duplicate extendFn extendArray;
    inherit (module."Data.Functor") map void;
  }