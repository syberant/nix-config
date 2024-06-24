
let
  module = 
    { "Data.Eq" = import ../Data.Eq;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Ring" = import ../Data.Ring;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Symbol" = import ../Data.Symbol;
      "Data.Unit" = import ../Data.Unit;
      "Data.Void" = import ../Data.Void;
      "Prim.Row" = import ../Prim.Row;
      "Prim.RowList" = import ../Prim.RowList;
      "Record.Unsafe" = import ../Record.Unsafe;
      "Type.Proxy" = import ../Type.Proxy;
    };
  foreign = import ./foreign.nix;
  ordBooleanImpl = foreign.ordBooleanImpl;
  ordIntImpl = foreign.ordIntImpl;
  ordNumberImpl = foreign.ordNumberImpl;
  ordStringImpl = foreign.ordStringImpl;
  ordCharImpl = foreign.ordCharImpl;
  ordArrayImpl = foreign.ordArrayImpl;
  eqRec = module."Data.Eq".eqRec module."Prim".undefined;
  negate = module."Data.Ring".negate module."Data.Ring".ringInt;
  notEq = module."Data.Eq".notEq module."Data.Ordering".eqOrdering;
  OrdRecord-Dict = x: x;
  Ord-Dict = x: x;
  Ord1-Dict = x: x;
  ordVoid = 
    { compare = v: v1: module."Data.Ordering".EQ;
      "Eq0" = _: module."Data.Eq".eqVoid;
    };
  ordUnit = 
    { compare = v: v1: module."Data.Ordering".EQ;
      "Eq0" = _: module."Data.Eq".eqUnit;
    };
  ordString = 
    { compare = ordStringImpl module."Data.Ordering".LT module."Data.Ordering".EQ module."Data.Ordering".GT;
      "Eq0" = _: module."Data.Eq".eqString;
    };
  ordRecordNil = 
    { compareRecord = v: v1: v2: module."Data.Ordering".EQ;
      "EqRecord0" = _: module."Data.Eq".eqRowNil;
    };
  ordProxy3 = 
    { compare = v: v1: module."Data.Ordering".EQ;
      "Eq0" = _: module."Data.Eq".eqProxy3;
    };
  ordProxy2 = 
    { compare = v: v1: module."Data.Ordering".EQ;
      "Eq0" = _: module."Data.Eq".eqProxy2;
    };
  ordProxy = 
    { compare = v: v1: module."Data.Ordering".EQ;
      "Eq0" = _: module."Data.Eq".eqProxy;
    };
  ordOrdering = 
    { compare = v: v1: 
        let
          __pattern0 = __fail: if v.__tag == "LT" && v1.__tag == "LT" then module."Data.Ordering".EQ else __fail;
          __pattern1 = __fail: if v.__tag == "EQ" && v1.__tag == "EQ" then module."Data.Ordering".EQ else __fail;
          __pattern2 = __fail: if v.__tag == "GT" && v1.__tag == "GT" then module."Data.Ordering".EQ else __fail;
          __pattern3 = __fail: if v.__tag == "LT" then module."Data.Ordering".LT else __fail;
          __pattern4 = __fail: if v.__tag == "EQ" && v1.__tag == "LT" then module."Data.Ordering".GT else __fail;
          __pattern5 = __fail: if v.__tag == "EQ" && v1.__tag == "GT" then module."Data.Ordering".LT else __fail;
          __pattern6 = __fail: if v.__tag == "GT" then module."Data.Ordering".GT else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 121:1 - 128:21";
        in
          __pattern0 (__pattern1 (__pattern2 (__pattern3 (__pattern4 (__pattern5 (__pattern6 __patternFail))))));
      "Eq0" = _: module."Data.Ordering".eqOrdering;
    };
  ordNumber = 
    { compare = ordNumberImpl module."Data.Ordering".LT module."Data.Ordering".EQ module."Data.Ordering".GT;
      "Eq0" = _: module."Data.Eq".eqNumber;
    };
  ordInt = 
    { compare = ordIntImpl module."Data.Ordering".LT module."Data.Ordering".EQ module."Data.Ordering".GT;
      "Eq0" = _: module."Data.Eq".eqInt;
    };
  ordChar = 
    { compare = ordCharImpl module."Data.Ordering".LT module."Data.Ordering".EQ module."Data.Ordering".GT;
      "Eq0" = _: module."Data.Eq".eqChar;
    };
  ordBoolean = 
    { compare = ordBooleanImpl module."Data.Ordering".LT module."Data.Ordering".EQ module."Data.Ordering".GT;
      "Eq0" = _: module."Data.Eq".eqBoolean;
    };
  compareRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.compareRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 228:3 - 228:91";
    in
      __pattern0 __patternFail;
  ordRecord = _: dictOrdRecord: 
    let
      eqRec1 = eqRec (dictOrdRecord."EqRecord0" module."Prim".undefined);
    in
      
      { compare = compareRecord dictOrdRecord module."Type.Proxy".Proxy;
        "Eq0" = _: eqRec1;
      };
  compare1 = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.compare1;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 221:3 - 221:56";
    in
      __pattern0 __patternFail;
  compare = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.compare;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 38:3 - 38:32";
    in
      __pattern0 __patternFail;
  compare2 = compare ordInt;
  comparing = dictOrd: 
    let
      compare3 = compare dictOrd;
    in
      f: x: y: compare3 (f x) (f y);
  greaterThan = dictOrd: 
    let
      compare3 = compare dictOrd;
    in
      a1: a2: 
      let
        v = compare3 a1 a2;
      in
        
        let
          __pattern0 = __fail: if v.__tag == "GT" then true else __fail;
          __pattern1 = __fail: false;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 138:21 - 140:13";
        in
          __pattern0 (__pattern1 __patternFail);
  greaterThanOrEq = dictOrd: 
    let
      compare3 = compare dictOrd;
    in
      a1: a2: 
      let
        v = compare3 a1 a2;
      in
        
        let
          __pattern0 = __fail: if v.__tag == "LT" then false else __fail;
          __pattern1 = __fail: true;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 150:25 - 152:12";
        in
          __pattern0 (__pattern1 __patternFail);
  signum = dictOrd: 
    let
      greaterThanOrEq1 = greaterThanOrEq dictOrd;
    in
      dictRing: 
      let
        Semiring0 = dictRing."Semiring0" module."Prim".undefined;
        zero = module."Data.Semiring".zero Semiring0;
        one = module."Data.Semiring".one Semiring0;
        negate1 = module."Data.Ring".negate dictRing;
      in
        x: 
        let
          __pattern0 = __fail: if greaterThanOrEq1 x zero then one else __fail;
          __pattern1 = __fail: negate1 one;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 217:12 - 217:49";
        in
          __pattern0 (__pattern1 __patternFail);
  lessThan = dictOrd: 
    let
      compare3 = compare dictOrd;
    in
      a1: a2: 
      let
        v = compare3 a1 a2;
      in
        
        let
          __pattern0 = __fail: if v.__tag == "LT" then true else __fail;
          __pattern1 = __fail: false;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 132:18 - 134:13";
        in
          __pattern0 (__pattern1 __patternFail);
  lessThanOrEq = dictOrd: 
    let
      compare3 = compare dictOrd;
    in
      a1: a2: 
      let
        v = compare3 a1 a2;
      in
        
        let
          __pattern0 = __fail: if v.__tag == "GT" then false else __fail;
          __pattern1 = __fail: true;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 144:22 - 146:12";
        in
          __pattern0 (__pattern1 __patternFail);
  max = dictOrd: 
    let
      compare3 = compare dictOrd;
    in
      x: y: 
      let
        v = compare3 x y;
      in
        
        let
          __pattern0 = __fail: if v.__tag == "LT" then y else __fail;
          __pattern1 = __fail: if v.__tag == "EQ" then x else __fail;
          __pattern2 = __fail: if v.__tag == "GT" then x else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 176:3 - 179:12";
        in
          __pattern0 (__pattern1 (__pattern2 __patternFail));
  min = dictOrd: 
    let
      compare3 = compare dictOrd;
    in
      x: y: 
      let
        v = compare3 x y;
      in
        
        let
          __pattern0 = __fail: if v.__tag == "LT" then x else __fail;
          __pattern1 = __fail: if v.__tag == "EQ" then x else __fail;
          __pattern2 = __fail: if v.__tag == "GT" then y else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 167:3 - 170:12";
        in
          __pattern0 (__pattern1 (__pattern2 __patternFail));
  ordArray = dictOrd: 
    let
      compare3 = compare dictOrd;
      eqArray = module."Data.Eq".eqArray (dictOrd."Eq0" module."Prim".undefined);
    in
      
      { compare = 
          let
            toDelta = x: y: 
              let
                v = compare3 x y;
              in
                
                let
                  __pattern0 = __fail: if v.__tag == "EQ" then 0 else __fail;
                  __pattern1 = __fail: if v.__tag == "LT" then 1 else __fail;
                  __pattern2 = __fail: if v.__tag == "GT" then negate 1 else __fail;
                  __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 74:7 - 77:17";
                in
                  __pattern0 (__pattern1 (__pattern2 __patternFail));
          in
            xs: ys: compare2 0 (ordArrayImpl toDelta xs ys);
        "Eq0" = _: eqArray;
      };
  ord1Array = 
    { compare1 = dictOrd: compare (ordArray dictOrd);
      "Eq10" = _: module."Data.Eq".eq1Array;
    };
  ordRecordCons = dictOrdRecord: 
    let
      compareRecord1 = compareRecord dictOrdRecord;
      eqRowCons = module."Data.Eq".eqRowCons (dictOrdRecord."EqRecord0" module."Prim".undefined) module."Prim".undefined;
    in
      _: dictIsSymbol: 
      let
        reflectSymbol = module."Data.Symbol".reflectSymbol dictIsSymbol;
        eqRowCons1 = eqRowCons dictIsSymbol;
      in
        dictOrd: 
        let
          compare3 = compare dictOrd;
          eqRowCons2 = eqRowCons1 (dictOrd."Eq0" module."Prim".undefined);
        in
          
          { compareRecord = v: ra: rb: 
              let
                unsafeGet' = module."Record.Unsafe".unsafeGet;
                key = reflectSymbol module."Type.Proxy".Proxy;
                left = compare3 (unsafeGet' key ra) (unsafeGet' key rb);
              in
                
                let
                  __pattern0 = __fail: if notEq left module."Data.Ordering".EQ then left else __fail;
                  __pattern1 = __fail: compareRecord1 module."Type.Proxy".Proxy ra rb;
                  __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 241:7 - 243:62";
                in
                  __pattern0 (__pattern1 __patternFail);
            "EqRecord0" = _: eqRowCons2;
          };
  clamp = dictOrd: 
    let
      min1 = min dictOrd;
      max1 = max dictOrd;
    in
      low: hi: x: min1 hi (max1 low x);
  between = dictOrd: 
    let
      lessThan1 = lessThan dictOrd;
      greaterThan1 = greaterThan dictOrd;
    in
      low: hi: x: 
      let
        __pattern0 = __fail: 
          let
            low1 = low;
            hi1 = hi;
            x1 = x;
          in
            if lessThan1 x1 low1 then false else if greaterThan1 x1 hi1 then false else if true then true else __fail;
        __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 203:1 - 203:53";
      in
        __pattern0 __patternFail;
  abs = dictOrd: 
    let
      greaterThanOrEq1 = greaterThanOrEq dictOrd;
    in
      dictRing: 
      let
        zero = module."Data.Semiring".zero (dictRing."Semiring0" module."Prim".undefined);
        negate1 = module."Data.Ring".negate dictRing;
      in
        x: 
        let
          __pattern0 = __fail: if greaterThanOrEq1 x zero then x else __fail;
          __pattern1 = __fail: negate1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 212:9 - 212:42";
        in
          __pattern0 (__pattern1 __patternFail);
in
  
  { inherit compare compare1 lessThan lessThanOrEq greaterThan greaterThanOrEq comparing min max clamp between abs signum compareRecord ordBoolean ordInt ordNumber ordString ordChar ordUnit ordVoid ordProxy ordProxy2 ordProxy3 ordArray ordOrdering ord1Array ordRecordNil ordRecordCons ordRecord;
    inherit (module."Data.Ordering") EQ GT LT;
  }