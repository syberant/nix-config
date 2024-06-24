
let
  module = 
    { "Data.Symbol" = import ../Data.Symbol;
      "Data.Unit" = import ../Data.Unit;
      "Data.Void" = import ../Data.Void;
      "Prim.Row" = import ../Prim.Row;
      "Prim.RowList" = import ../Prim.RowList;
      "Record.Unsafe" = import ../Record.Unsafe;
      "Type.Proxy" = import ../Type.Proxy;
    };
  foreign = import ./foreign.nix;
  concatString = foreign.concatString;
  concatArray = foreign.concatArray;
  SemigroupRecord-Dict = x: x;
  Semigroup-Dict = x: x;
  semigroupVoid = {append = v: module."Data.Void".absurd;};
  semigroupUnit = {append = v: v1: module."Data.Unit".unit;};
  semigroupString = {append = concatString;};
  semigroupRecordNil = {appendRecord = v: v1: v2: { };};
  semigroupProxy3 = {append = v: v1: module."Type.Proxy".Proxy3;};
  semigroupProxy2 = {append = v: v1: module."Type.Proxy".Proxy2;};
  semigroupProxy = {append = v: v1: module."Type.Proxy".Proxy;};
  semigroupArray = {append = concatArray;};
  appendRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.appendRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semigroup.purs at 70:3 - 70:95";
    in
      __pattern0 __patternFail;
  semigroupRecord = _: dictSemigroupRecord: {append = appendRecord dictSemigroupRecord module."Type.Proxy".Proxy;};
  append = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.append;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semigroup.purs at 32:3 - 32:24";
    in
      __pattern0 __patternFail;
  semigroupFn = dictSemigroup: 
    let
      append1 = append dictSemigroup;
    in
      {append = f: g: x: append1 (f x) (g x);};
  semigroupRecordCons = dictIsSymbol: 
    let
      reflectSymbol = module."Data.Symbol".reflectSymbol dictIsSymbol;
    in
      _: dictSemigroupRecord: 
      let
        appendRecord1 = appendRecord dictSemigroupRecord;
      in
        dictSemigroup: 
        let
          append1 = append dictSemigroup;
        in
          
          { appendRecord = v: ra: rb: 
              let
                tail = appendRecord1 module."Type.Proxy".Proxy ra rb;
                key = reflectSymbol module."Type.Proxy".Proxy;
                insert = module."Record.Unsafe".unsafeSet key;
                get = module."Record.Unsafe".unsafeGet key;
              in
                insert (append1 (get ra) (get rb)) tail;
          };
in
  {inherit append appendRecord semigroupString semigroupUnit semigroupVoid semigroupFn semigroupArray semigroupProxy semigroupProxy2 semigroupProxy3 semigroupRecord semigroupRecordNil semigroupRecordCons;}