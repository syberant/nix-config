
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Identity" = import ../Data.Identity;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unit" = import ../Data.Unit;
      "Prelude" = import ../Prelude;
      "Type.Equality" = import ../Type.Equality;
    };
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  unwrap = module."Data.Newtype".unwrap module."Prim".undefined;
  identity = module."Control.Category".identity module."Control.Category".categoryFn;
  Distributive-Dict = x: x;
  distributiveIdentity = 
    { distribute = dictFunctor: compose module."Data.Identity".Identity (module."Data.Functor".map dictFunctor unwrap);
      collect = dictFunctor: 
        let
          map = module."Data.Functor".map dictFunctor;
        in
          f: compose module."Data.Identity".Identity (map (compose unwrap f));
      "Functor0" = _: module."Data.Identity".functorIdentity;
    };
  distribute = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.distribute;
      __patternFail = builtins.throw "Pattern match failure in .spago/distributive/master/src/Data/Distributive.purs at 25:3 - 25:60";
    in
      __pattern0 __patternFail;
  distributiveFunction = 
    { distribute = dictFunctor: 
        let
          map = module."Data.Functor".map dictFunctor;
        in
          a: e: map (v: v e) a;
      collect = dictFunctor: 
        let
          map = module."Data.Functor".map dictFunctor;
        in
          f: compose (distribute distributiveFunction dictFunctor) (map f);
      "Functor0" = _: module."Data.Functor".functorFn;
    };
  cotraverse = dictDistributive: 
    let
      map = module."Data.Functor".map (dictDistributive."Functor0" module."Prim".undefined);
      distribute1 = distribute dictDistributive;
    in
      dictFunctor: 
      let
        distribute2 = distribute1 dictFunctor;
      in
        f: compose (map f) distribute2;
  collectDefault = dictDistributive: 
    let
      distribute1 = distribute dictDistributive;
    in
      dictFunctor: 
      let
        distribute2 = distribute1 dictFunctor;
        map = module."Data.Functor".map dictFunctor;
      in
        f: compose distribute2 (map f);
  distributiveTuple = dictTypeEquals: 
    let
      from = module."Type.Equality".from dictTypeEquals;
    in
      
      { collect = dictFunctor: collectDefault (distributiveTuple dictTypeEquals) dictFunctor;
        distribute = dictFunctor: compose (module."Data.Tuple".Tuple (from module."Data.Unit".unit)) (module."Data.Functor".map dictFunctor module."Data.Tuple".snd);
        "Functor0" = _: module."Data.Tuple".functorTuple;
      };
  collect = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.collect;
      __patternFail = builtins.throw "Pattern match failure in .spago/distributive/master/src/Data/Distributive.purs at 26:3 - 26:69";
    in
      __pattern0 __patternFail;
  distributeDefault = dictDistributive: 
    let
      collect1 = collect dictDistributive;
    in
      dictFunctor: collect1 dictFunctor identity;
in
  {inherit collect distribute distributeDefault collectDefault cotraverse distributiveIdentity distributiveFunction distributiveTuple;}