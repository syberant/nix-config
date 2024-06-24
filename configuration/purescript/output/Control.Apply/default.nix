
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Type.Proxy" = import ../Type.Proxy;
    };
  foreign = import ./foreign.nix;
  arrayApply = foreign.arrayApply;
  identity = module."Control.Category".identity module."Control.Category".categoryFn;
  Apply-Dict = x: x;
  applyProxy = 
    { apply = v: v1: module."Type.Proxy".Proxy;
      "Functor0" = _: module."Data.Functor".functorProxy;
    };
  applyFn = 
    { apply = f: g: x: f x (g x);
      "Functor0" = _: module."Data.Functor".functorFn;
    };
  applyArray = 
    { apply = arrayApply;
      "Functor0" = _: module."Data.Functor".functorArray;
    };
  apply = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.apply;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Control/Apply.purs at 46:3 - 46:48";
    in
      __pattern0 __patternFail;
  applyFirst = dictApply: 
    let
      apply1 = apply dictApply;
      map = module."Data.Functor".map (dictApply."Functor0" module."Prim".undefined);
    in
      a: b: apply1 (map module."Data.Function".const a) b;
  applySecond = dictApply: 
    let
      apply1 = apply dictApply;
      map = module."Data.Functor".map (dictApply."Functor0" module."Prim".undefined);
    in
      a: b: apply1 (map (module."Data.Function".const identity) a) b;
  lift2 = dictApply: 
    let
      apply1 = apply dictApply;
      map = module."Data.Functor".map (dictApply."Functor0" module."Prim".undefined);
    in
      f: a: b: apply1 (map f a) b;
  lift3 = dictApply: 
    let
      apply1 = apply dictApply;
      map = module."Data.Functor".map (dictApply."Functor0" module."Prim".undefined);
    in
      f: a: b: c: apply1 (apply1 (map f a) b) c;
  lift4 = dictApply: 
    let
      apply1 = apply dictApply;
      map = module."Data.Functor".map (dictApply."Functor0" module."Prim".undefined);
    in
      f: a: b: c: d: apply1 (apply1 (apply1 (map f a) b) c) d;
  lift5 = dictApply: 
    let
      apply1 = apply dictApply;
      map = module."Data.Functor".map (dictApply."Functor0" module."Prim".undefined);
    in
      f: a: b: c: d: e: apply1 (apply1 (apply1 (apply1 (map f a) b) c) d) e;
in
  
  { inherit apply applyFirst applySecond lift2 lift3 lift4 lift5 applyFn applyArray applyProxy;
    inherit (module."Data.Functor") map void;
  }