
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Category" = import ../Control.Category;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Unit" = import ../Data.Unit;
      "Type.Proxy" = import ../Type.Proxy;
    };
  foreign = import ./foreign.nix;
  arrayBind = foreign.arrayBind;
  identity = module."Control.Category".identity module."Control.Category".categoryFn;
  Bind-Dict = x: x;
  Discard-Dict = x: x;
  discard = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.discard;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Control/Bind.purs at 102:3 - 102:60";
    in
      __pattern0 __patternFail;
  bindProxy = 
    { bind = v: v1: module."Type.Proxy".Proxy;
      "Apply0" = _: module."Control.Apply".applyProxy;
    };
  bindFn = 
    { bind = m: f: x: f (m x) x;
      "Apply0" = _: module."Control.Apply".applyFn;
    };
  bindArray = 
    { bind = arrayBind;
      "Apply0" = _: module."Control.Apply".applyArray;
    };
  bind = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.bind;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Control/Bind.purs at 51:3 - 51:47";
    in
      __pattern0 __patternFail;
  bindFlipped = dictBind: module."Data.Function".flip (bind dictBind);
  composeKleisliFlipped = dictBind: 
    let
      bindFlipped1 = bindFlipped dictBind;
    in
      f: g: a: bindFlipped1 f (g a);
  composeKleisli = dictBind: 
    let
      bind1 = bind dictBind;
    in
      f: g: a: bind1 (f a) g;
  discardProxy = {discard = dictBind: bind dictBind;};
  discardProxy2 = {discard = dictBind: bind dictBind;};
  discardProxy3 = {discard = dictBind: bind dictBind;};
  discardUnit = {discard = dictBind: bind dictBind;};
  ifM = dictBind: 
    let
      bind1 = bind dictBind;
    in
      cond: t: f: bind1 cond 
      ( cond': 
        let
          __pattern0 = __fail: if cond' then t else __fail;
          __pattern1 = __fail: f;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Control/Bind.purs at 150:35 - 150:57";
        in
          __pattern0 (__pattern1 __patternFail)
      );
  join = dictBind: 
    let
      bind1 = bind dictBind;
    in
      m: bind1 m identity;
in
  
  { inherit bind bindFlipped discard join composeKleisli composeKleisliFlipped ifM bindFn bindArray bindProxy discardUnit discardProxy discardProxy2 discardProxy3;
    inherit (module."Control.Applicative") liftA1 pure unless when;
    inherit (module."Control.Apply") apply;
    inherit (module."Data.Functor") map void;
  }