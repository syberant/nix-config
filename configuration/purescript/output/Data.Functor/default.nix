
let
  module = 
    { "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Function" = import ../Data.Function;
      "Data.Unit" = import ../Data.Unit;
      "Type.Proxy" = import ../Type.Proxy;
    };
  foreign = import ./foreign.nix;
  arrayMap = foreign.arrayMap;
  Functor-Dict = x: x;
  map = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.map;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Functor.purs at 26:3 - 26:44";
    in
      __pattern0 __patternFail;
  mapFlipped = dictFunctor: 
    let
      map1 = map dictFunctor;
    in
      fa: f: map1 f fa;
  void = dictFunctor: map dictFunctor (module."Data.Function".const module."Data.Unit".unit);
  voidLeft = dictFunctor: 
    let
      map1 = map dictFunctor;
    in
      f: x: map1 (module."Data.Function".const x) f;
  voidRight = dictFunctor: 
    let
      map1 = map dictFunctor;
    in
      x: map1 (module."Data.Function".const x);
  functorProxy = {map = v: v1: module."Type.Proxy".Proxy;};
  functorFn = {map = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;};
  functorArray = {map = arrayMap;};
  flap = dictFunctor: 
    let
      map1 = map dictFunctor;
    in
      ff: x: map1 (f: f x) ff;
in
  {inherit map mapFlipped void voidRight voidLeft flap functorFn functorArray functorProxy;}