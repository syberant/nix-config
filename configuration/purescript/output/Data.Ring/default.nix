
let
  module = 
    { "Data.Semiring" = import ../Data.Semiring;
      "Data.Symbol" = import ../Data.Symbol;
      "Data.Unit" = import ../Data.Unit;
      "Prim.Row" = import ../Prim.Row;
      "Prim.RowList" = import ../Prim.RowList;
      "Record.Unsafe" = import ../Record.Unsafe;
      "Type.Proxy" = import ../Type.Proxy;
    };
  foreign = import ./foreign.nix;
  intSub = foreign.intSub;
  numSub = foreign.numSub;
  semiringRecord = module."Data.Semiring".semiringRecord module."Prim".undefined;
  RingRecord-Dict = x: x;
  Ring-Dict = x: x;
  subRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.subRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ring.purs at 63:3 - 63:92";
    in
      __pattern0 __patternFail;
  sub = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.sub;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ring.purs at 24:3 - 24:21";
    in
      __pattern0 __patternFail;
  ringUnit = 
    { sub = v: v1: module."Data.Unit".unit;
      "Semiring0" = _: module."Data.Semiring".semiringUnit;
    };
  ringRecordNil = 
    { subRecord = v: v1: v2: { };
      "SemiringRecord0" = _: module."Data.Semiring".semiringRecordNil;
    };
  ringRecordCons = dictIsSymbol: 
    let
      reflectSymbol = module."Data.Symbol".reflectSymbol dictIsSymbol;
      semiringRecordCons = module."Data.Semiring".semiringRecordCons dictIsSymbol module."Prim".undefined;
    in
      _: dictRingRecord: 
      let
        subRecord1 = subRecord dictRingRecord;
        semiringRecordCons1 = semiringRecordCons (dictRingRecord."SemiringRecord0" module."Prim".undefined);
      in
        dictRing: 
        let
          sub1 = sub dictRing;
          semiringRecordCons2 = semiringRecordCons1 (dictRing."Semiring0" module."Prim".undefined);
        in
          
          { subRecord = v: ra: rb: 
              let
                tail = subRecord1 module."Type.Proxy".Proxy ra rb;
                key = reflectSymbol module."Type.Proxy".Proxy;
                insert = module."Record.Unsafe".unsafeSet key;
                get = module."Record.Unsafe".unsafeGet key;
              in
                insert (sub1 (get ra) (get rb)) tail;
            "SemiringRecord0" = _: semiringRecordCons2;
          };
  ringRecord = _: dictRingRecord: 
    let
      semiringRecord1 = semiringRecord (dictRingRecord."SemiringRecord0" module."Prim".undefined);
    in
      
      { sub = subRecord dictRingRecord module."Type.Proxy".Proxy;
        "Semiring0" = _: semiringRecord1;
      };
  ringProxy3 = 
    { sub = v: v1: module."Type.Proxy".Proxy3;
      "Semiring0" = _: module."Data.Semiring".semiringProxy3;
    };
  ringProxy2 = 
    { sub = v: v1: module."Type.Proxy".Proxy2;
      "Semiring0" = _: module."Data.Semiring".semiringProxy2;
    };
  ringProxy = 
    { sub = v: v1: module."Type.Proxy".Proxy;
      "Semiring0" = _: module."Data.Semiring".semiringProxy;
    };
  ringNumber = 
    { sub = numSub;
      "Semiring0" = _: module."Data.Semiring".semiringNumber;
    };
  ringInt = 
    { sub = intSub;
      "Semiring0" = _: module."Data.Semiring".semiringInt;
    };
  ringFn = dictRing: 
    let
      sub1 = sub dictRing;
      semiringFn = module."Data.Semiring".semiringFn (dictRing."Semiring0" module."Prim".undefined);
    in
      
      { sub = f: g: x: sub1 (f x) (g x);
        "Semiring0" = _: semiringFn;
      };
  negate = dictRing: 
    let
      sub1 = sub dictRing;
      zero = module."Data.Semiring".zero (dictRing."Semiring0" module."Prim".undefined);
    in
      a: sub1 zero a;
in
  
  { inherit sub negate subRecord ringInt ringNumber ringUnit ringFn ringProxy ringProxy2 ringProxy3 ringRecord ringRecordNil ringRecordCons;
    inherit (module."Data.Semiring") add mul one zero;
  }