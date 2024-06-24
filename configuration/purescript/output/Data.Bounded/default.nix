
let
  module = 
    { "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Symbol" = import ../Data.Symbol;
      "Data.Unit" = import ../Data.Unit;
      "Prim.Row" = import ../Prim.Row;
      "Prim.RowList" = import ../Prim.RowList;
      "Record.Unsafe" = import ../Record.Unsafe;
      "Type.Proxy" = import ../Type.Proxy;
    };
  foreign = import ./foreign.nix;
  topInt = foreign.topInt;
  bottomInt = foreign.bottomInt;
  topChar = foreign.topChar;
  bottomChar = foreign.bottomChar;
  topNumber = foreign.topNumber;
  bottomNumber = foreign.bottomNumber;
  ordRecord = module."Data.Ord".ordRecord module."Prim".undefined;
  BoundedRecord-Dict = x: x;
  Bounded-Dict = x: x;
  topRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.topRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Bounded.purs at 78:3 - 78:85";
    in
      __pattern0 __patternFail;
  top = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.top;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Bounded.purs at 24:3 - 24:11";
    in
      __pattern0 __patternFail;
  boundedUnit = 
    { top = module."Data.Unit".unit;
      bottom = module."Data.Unit".unit;
      "Ord0" = _: module."Data.Ord".ordUnit;
    };
  boundedRecordNil = 
    { topRecord = v: v1: { };
      bottomRecord = v: v1: { };
      "OrdRecord0" = _: module."Data.Ord".ordRecordNil;
    };
  boundedProxy3 = 
    { bottom = module."Type.Proxy".Proxy3;
      top = module."Type.Proxy".Proxy3;
      "Ord0" = _: module."Data.Ord".ordProxy3;
    };
  boundedProxy2 = 
    { bottom = module."Type.Proxy".Proxy2;
      top = module."Type.Proxy".Proxy2;
      "Ord0" = _: module."Data.Ord".ordProxy2;
    };
  boundedProxy = 
    { bottom = module."Type.Proxy".Proxy;
      top = module."Type.Proxy".Proxy;
      "Ord0" = _: module."Data.Ord".ordProxy;
    };
  boundedOrdering = 
    { top = module."Data.Ordering".GT;
      bottom = module."Data.Ordering".LT;
      "Ord0" = _: module."Data.Ord".ordOrdering;
    };
  boundedNumber = 
    { top = topNumber;
      bottom = bottomNumber;
      "Ord0" = _: module."Data.Ord".ordNumber;
    };
  boundedInt = 
    { top = topInt;
      bottom = bottomInt;
      "Ord0" = _: module."Data.Ord".ordInt;
    };
  boundedChar = 
    { top = topChar;
      bottom = bottomChar;
      "Ord0" = _: module."Data.Ord".ordChar;
    };
  boundedBoolean = 
    { top = true;
      bottom = false;
      "Ord0" = _: module."Data.Ord".ordBoolean;
    };
  bottomRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.bottomRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Bounded.purs at 79:3 - 79:88";
    in
      __pattern0 __patternFail;
  boundedRecord = _: dictBoundedRecord: 
    let
      ordRecord1 = ordRecord (dictBoundedRecord."OrdRecord0" module."Prim".undefined);
    in
      
      { top = topRecord dictBoundedRecord module."Type.Proxy".Proxy module."Type.Proxy".Proxy;
        bottom = bottomRecord dictBoundedRecord module."Type.Proxy".Proxy module."Type.Proxy".Proxy;
        "Ord0" = _: ordRecord1;
      };
  bottom = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.bottom;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Bounded.purs at 25:3 - 25:14";
    in
      __pattern0 __patternFail;
  boundedRecordCons = dictIsSymbol: 
    let
      reflectSymbol = module."Data.Symbol".reflectSymbol dictIsSymbol;
    in
      dictBounded: 
      let
        top1 = top dictBounded;
        bottom1 = bottom dictBounded;
        Ord0 = dictBounded."Ord0" module."Prim".undefined;
      in
        _: _: dictBoundedRecord: 
        let
          topRecord1 = topRecord dictBoundedRecord;
          bottomRecord1 = bottomRecord dictBoundedRecord;
          ordRecordCons = module."Data.Ord".ordRecordCons (dictBoundedRecord."OrdRecord0" module."Prim".undefined) module."Prim".undefined dictIsSymbol Ord0;
        in
          
          { topRecord = v: rowProxy: 
              let
                tail = topRecord1 module."Type.Proxy".Proxy rowProxy;
                key = reflectSymbol module."Type.Proxy".Proxy;
                insert = module."Record.Unsafe".unsafeSet key;
              in
                insert top1 tail;
            bottomRecord = v: rowProxy: 
              let
                tail = bottomRecord1 module."Type.Proxy".Proxy rowProxy;
                key = reflectSymbol module."Type.Proxy".Proxy;
                insert = module."Record.Unsafe".unsafeSet key;
              in
                insert bottom1 tail;
            "OrdRecord0" = _: ordRecordCons;
          };
in
  
  { inherit bottom top bottomRecord topRecord boundedBoolean boundedInt boundedChar boundedOrdering boundedUnit boundedNumber boundedProxy boundedProxy2 boundedProxy3 boundedRecordNil boundedRecordCons boundedRecord;
    inherit (module."Data.Ord") EQ GT LT compare;
  }