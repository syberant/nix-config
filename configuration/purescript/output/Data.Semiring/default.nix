
let
  module = 
    { "Data.Symbol" = import ../Data.Symbol;
      "Data.Unit" = import ../Data.Unit;
      "Prim.Row" = import ../Prim.Row;
      "Prim.RowList" = import ../Prim.RowList;
      "Record.Unsafe" = import ../Record.Unsafe;
      "Type.Proxy" = import ../Type.Proxy;
    };
  foreign = import ./foreign.nix;
  intAdd = foreign.intAdd;
  intMul = foreign.intMul;
  numAdd = foreign.numAdd;
  numMul = foreign.numMul;
  SemiringRecord-Dict = x: x;
  Semiring-Dict = x: x;
  zeroRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.zeroRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring.purs at 103:3 - 103:86";
    in
      __pattern0 __patternFail;
  zero = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.zero;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring.purs at 36:3 - 36:12";
    in
      __pattern0 __patternFail;
  semiringUnit = 
    { add = v: v1: module."Data.Unit".unit;
      zero = module."Data.Unit".unit;
      mul = v: v1: module."Data.Unit".unit;
      one = module."Data.Unit".unit;
    };
  semiringRecordNil = 
    { addRecord = v: v1: v2: { };
      mulRecord = v: v1: v2: { };
      oneRecord = v: v1: { };
      zeroRecord = v: v1: { };
    };
  semiringProxy3 = 
    { add = v: v1: module."Type.Proxy".Proxy3;
      mul = v: v1: module."Type.Proxy".Proxy3;
      one = module."Type.Proxy".Proxy3;
      zero = module."Type.Proxy".Proxy3;
    };
  semiringProxy2 = 
    { add = v: v1: module."Type.Proxy".Proxy2;
      mul = v: v1: module."Type.Proxy".Proxy2;
      one = module."Type.Proxy".Proxy2;
      zero = module."Type.Proxy".Proxy2;
    };
  semiringProxy = 
    { add = v: v1: module."Type.Proxy".Proxy;
      mul = v: v1: module."Type.Proxy".Proxy;
      one = module."Type.Proxy".Proxy;
      zero = module."Type.Proxy".Proxy;
    };
  semiringNumber = 
    { add = numAdd;
      zero = 0.0;
      mul = numMul;
      one = 1.0;
    };
  semiringInt = 
    { add = intAdd;
      zero = 0;
      mul = intMul;
      one = 1;
    };
  oneRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.oneRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring.purs at 102:3 - 102:85";
    in
      __pattern0 __patternFail;
  one = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.one;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring.purs at 38:3 - 38:12";
    in
      __pattern0 __patternFail;
  mulRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.mulRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring.purs at 101:3 - 101:92";
    in
      __pattern0 __patternFail;
  mul = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.mul;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring.purs at 37:3 - 37:22";
    in
      __pattern0 __patternFail;
  addRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.addRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring.purs at 100:3 - 100:92";
    in
      __pattern0 __patternFail;
  semiringRecord = _: dictSemiringRecord: 
    { add = addRecord dictSemiringRecord module."Type.Proxy".Proxy;
      mul = mulRecord dictSemiringRecord module."Type.Proxy".Proxy;
      one = oneRecord dictSemiringRecord module."Type.Proxy".Proxy module."Type.Proxy".Proxy;
      zero = zeroRecord dictSemiringRecord module."Type.Proxy".Proxy module."Type.Proxy".Proxy;
    };
  add = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.add;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring.purs at 35:3 - 35:22";
    in
      __pattern0 __patternFail;
  semiringFn = dictSemiring: 
    let
      add1 = add dictSemiring;
      zero1 = zero dictSemiring;
      mul1 = mul dictSemiring;
      one1 = one dictSemiring;
    in
      
      { add = f: g: x: add1 (f x) (g x);
        zero = v: zero1;
        mul = f: g: x: mul1 (f x) (g x);
        one = v: one1;
      };
  semiringRecordCons = dictIsSymbol: 
    let
      reflectSymbol = module."Data.Symbol".reflectSymbol dictIsSymbol;
    in
      _: dictSemiringRecord: 
      let
        addRecord1 = addRecord dictSemiringRecord;
        mulRecord1 = mulRecord dictSemiringRecord;
        oneRecord1 = oneRecord dictSemiringRecord;
        zeroRecord1 = zeroRecord dictSemiringRecord;
      in
        dictSemiring: 
        let
          add1 = add dictSemiring;
          mul1 = mul dictSemiring;
          one1 = one dictSemiring;
          zero1 = zero dictSemiring;
        in
          
          { addRecord = v: ra: rb: 
              let
                tail = addRecord1 module."Type.Proxy".Proxy ra rb;
                key = reflectSymbol module."Type.Proxy".Proxy;
                insert = module."Record.Unsafe".unsafeSet key;
                get = module."Record.Unsafe".unsafeGet key;
              in
                insert (add1 (get ra) (get rb)) tail;
            mulRecord = v: ra: rb: 
              let
                tail = mulRecord1 module."Type.Proxy".Proxy ra rb;
                key = reflectSymbol module."Type.Proxy".Proxy;
                insert = module."Record.Unsafe".unsafeSet key;
                get = module."Record.Unsafe".unsafeGet key;
              in
                insert (mul1 (get ra) (get rb)) tail;
            oneRecord = v: v1: 
              let
                tail = oneRecord1 module."Type.Proxy".Proxy module."Type.Proxy".Proxy;
                key = reflectSymbol module."Type.Proxy".Proxy;
                insert = module."Record.Unsafe".unsafeSet key;
              in
                insert one1 tail;
            zeroRecord = v: v1: 
              let
                tail = zeroRecord1 module."Type.Proxy".Proxy module."Type.Proxy".Proxy;
                key = reflectSymbol module."Type.Proxy".Proxy;
                insert = module."Record.Unsafe".unsafeSet key;
              in
                insert zero1 tail;
          };
in
  {inherit add zero mul one addRecord mulRecord oneRecord zeroRecord semiringInt semiringNumber semiringFn semiringUnit semiringProxy semiringProxy2 semiringProxy3 semiringRecord semiringRecordNil semiringRecordCons;}