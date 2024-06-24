
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
  boolConj = foreign.boolConj;
  boolDisj = foreign.boolDisj;
  boolNot = foreign.boolNot;
  HeytingAlgebraRecord-Dict = x: x;
  HeytingAlgebra-Dict = x: x;
  ttRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.ttRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra.purs at 114:3 - 114:84";
    in
      __pattern0 __patternFail;
  tt = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.tt;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra.purs at 40:3 - 40:10";
    in
      __pattern0 __patternFail;
  notRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.notRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra.purs at 118:3 - 118:78";
    in
      __pattern0 __patternFail;
  not = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.not;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra.purs at 44:3 - 44:16";
    in
      __pattern0 __patternFail;
  impliesRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.impliesRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra.purs at 115:3 - 115:96";
    in
      __pattern0 __patternFail;
  implies = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.implies;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra.purs at 41:3 - 41:25";
    in
      __pattern0 __patternFail;
  heytingAlgebraUnit = 
    { ff = module."Data.Unit".unit;
      tt = module."Data.Unit".unit;
      implies = v: v1: module."Data.Unit".unit;
      conj = v: v1: module."Data.Unit".unit;
      disj = v: v1: module."Data.Unit".unit;
      not = v: module."Data.Unit".unit;
    };
  heytingAlgebraRecordNil = 
    { conjRecord = v: v1: v2: { };
      disjRecord = v: v1: v2: { };
      ffRecord = v: v1: { };
      impliesRecord = v: v1: v2: { };
      notRecord = v: v1: { };
      ttRecord = v: v1: { };
    };
  heytingAlgebraProxy3 = 
    { conj = v: v1: module."Type.Proxy".Proxy3;
      disj = v: v1: module."Type.Proxy".Proxy3;
      implies = v: v1: module."Type.Proxy".Proxy3;
      ff = module."Type.Proxy".Proxy3;
      not = v: module."Type.Proxy".Proxy3;
      tt = module."Type.Proxy".Proxy3;
    };
  heytingAlgebraProxy2 = 
    { conj = v: v1: module."Type.Proxy".Proxy2;
      disj = v: v1: module."Type.Proxy".Proxy2;
      implies = v: v1: module."Type.Proxy".Proxy2;
      ff = module."Type.Proxy".Proxy2;
      not = v: module."Type.Proxy".Proxy2;
      tt = module."Type.Proxy".Proxy2;
    };
  heytingAlgebraProxy = 
    { conj = v: v1: module."Type.Proxy".Proxy;
      disj = v: v1: module."Type.Proxy".Proxy;
      implies = v: v1: module."Type.Proxy".Proxy;
      ff = module."Type.Proxy".Proxy;
      not = v: module."Type.Proxy".Proxy;
      tt = module."Type.Proxy".Proxy;
    };
  ffRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.ffRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra.purs at 113:3 - 113:84";
    in
      __pattern0 __patternFail;
  ff = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.ff;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra.purs at 39:3 - 39:10";
    in
      __pattern0 __patternFail;
  disjRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.disjRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra.purs at 116:3 - 116:93";
    in
      __pattern0 __patternFail;
  disj = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.disj;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra.purs at 43:3 - 43:22";
    in
      __pattern0 __patternFail;
  heytingAlgebraBoolean = 
    { ff = false;
      tt = true;
      implies = a: b: disj heytingAlgebraBoolean (not heytingAlgebraBoolean a) b;
      conj = boolConj;
      disj = boolDisj;
      not = boolNot;
    };
  conjRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.conjRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra.purs at 117:3 - 117:93";
    in
      __pattern0 __patternFail;
  heytingAlgebraRecord = _: dictHeytingAlgebraRecord: 
    { ff = ffRecord dictHeytingAlgebraRecord module."Type.Proxy".Proxy module."Type.Proxy".Proxy;
      tt = ttRecord dictHeytingAlgebraRecord module."Type.Proxy".Proxy module."Type.Proxy".Proxy;
      conj = conjRecord dictHeytingAlgebraRecord module."Type.Proxy".Proxy;
      disj = disjRecord dictHeytingAlgebraRecord module."Type.Proxy".Proxy;
      implies = impliesRecord dictHeytingAlgebraRecord module."Type.Proxy".Proxy;
      not = notRecord dictHeytingAlgebraRecord module."Type.Proxy".Proxy;
    };
  conj = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.conj;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra.purs at 42:3 - 42:22";
    in
      __pattern0 __patternFail;
  heytingAlgebraFunction = dictHeytingAlgebra: 
    let
      ff1 = ff dictHeytingAlgebra;
      tt1 = tt dictHeytingAlgebra;
      implies1 = implies dictHeytingAlgebra;
      conj1 = conj dictHeytingAlgebra;
      disj1 = disj dictHeytingAlgebra;
      not1 = not dictHeytingAlgebra;
    in
      
      { ff = v: ff1;
        tt = v: tt1;
        implies = f: g: a: implies1 (f a) (g a);
        conj = f: g: a: conj1 (f a) (g a);
        disj = f: g: a: disj1 (f a) (g a);
        not = f: a: not1 (f a);
      };
  heytingAlgebraRecordCons = dictIsSymbol: 
    let
      reflectSymbol = module."Data.Symbol".reflectSymbol dictIsSymbol;
    in
      _: dictHeytingAlgebraRecord: 
      let
        conjRecord1 = conjRecord dictHeytingAlgebraRecord;
        disjRecord1 = disjRecord dictHeytingAlgebraRecord;
        impliesRecord1 = impliesRecord dictHeytingAlgebraRecord;
        ffRecord1 = ffRecord dictHeytingAlgebraRecord;
        notRecord1 = notRecord dictHeytingAlgebraRecord;
        ttRecord1 = ttRecord dictHeytingAlgebraRecord;
      in
        dictHeytingAlgebra: 
        let
          conj1 = conj dictHeytingAlgebra;
          disj1 = disj dictHeytingAlgebra;
          implies1 = implies dictHeytingAlgebra;
          ff1 = ff dictHeytingAlgebra;
          not1 = not dictHeytingAlgebra;
          tt1 = tt dictHeytingAlgebra;
        in
          
          { conjRecord = v: ra: rb: 
              let
                tail = conjRecord1 module."Type.Proxy".Proxy ra rb;
                key = reflectSymbol module."Type.Proxy".Proxy;
                insert = module."Record.Unsafe".unsafeSet key;
                get = module."Record.Unsafe".unsafeGet key;
              in
                insert (conj1 (get ra) (get rb)) tail;
            disjRecord = v: ra: rb: 
              let
                tail = disjRecord1 module."Type.Proxy".Proxy ra rb;
                key = reflectSymbol module."Type.Proxy".Proxy;
                insert = module."Record.Unsafe".unsafeSet key;
                get = module."Record.Unsafe".unsafeGet key;
              in
                insert (disj1 (get ra) (get rb)) tail;
            impliesRecord = v: ra: rb: 
              let
                tail = impliesRecord1 module."Type.Proxy".Proxy ra rb;
                key = reflectSymbol module."Type.Proxy".Proxy;
                insert = module."Record.Unsafe".unsafeSet key;
                get = module."Record.Unsafe".unsafeGet key;
              in
                insert (implies1 (get ra) (get rb)) tail;
            ffRecord = v: row: 
              let
                tail = ffRecord1 module."Type.Proxy".Proxy row;
                key = reflectSymbol module."Type.Proxy".Proxy;
                insert = module."Record.Unsafe".unsafeSet key;
              in
                insert ff1 tail;
            notRecord = v: row: 
              let
                tail = notRecord1 module."Type.Proxy".Proxy row;
                key = reflectSymbol module."Type.Proxy".Proxy;
                insert = module."Record.Unsafe".unsafeSet key;
                get = module."Record.Unsafe".unsafeGet key;
              in
                insert (not1 (get row)) tail;
            ttRecord = v: row: 
              let
                tail = ttRecord1 module."Type.Proxy".Proxy row;
                key = reflectSymbol module."Type.Proxy".Proxy;
                insert = module."Record.Unsafe".unsafeSet key;
              in
                insert tt1 tail;
          };
in
  {inherit tt ff implies conj disj not ffRecord ttRecord impliesRecord conjRecord disjRecord notRecord heytingAlgebraBoolean heytingAlgebraUnit heytingAlgebraFunction heytingAlgebraProxy heytingAlgebraProxy2 heytingAlgebraProxy3 heytingAlgebraRecord heytingAlgebraRecordNil heytingAlgebraRecordCons;}