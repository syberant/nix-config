
let
  module = 
    { "Data.Boolean" = import ../Data.Boolean;
      "Data.Eq" = import ../Data.Eq;
      "Data.EuclideanRing" = import ../Data.EuclideanRing;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Symbol" = import ../Data.Symbol;
      "Data.Unit" = import ../Data.Unit;
      "Prim.Row" = import ../Prim.Row;
      "Prim.RowList" = import ../Prim.RowList;
      "Record.Unsafe" = import ../Record.Unsafe;
      "Type.Proxy" = import ../Type.Proxy;
    };
  semigroupRecord = module."Data.Semigroup".semigroupRecord module."Prim".undefined;
  lessThanOrEq = module."Data.Ord".lessThanOrEq module."Data.Ord".ordInt;
  eq = module."Data.Eq".eq module."Data.Eq".eqInt;
  mod = module."Data.EuclideanRing".mod module."Data.EuclideanRing".euclideanRingInt;
  div = module."Data.EuclideanRing".div module."Data.EuclideanRing".euclideanRingInt;
  MonoidRecord-Dict = x: x;
  Monoid-Dict = x: x;
  monoidUnit = 
    { mempty = module."Data.Unit".unit;
      "Semigroup0" = _: module."Data.Semigroup".semigroupUnit;
    };
  monoidString = 
    { mempty = "";
      "Semigroup0" = _: module."Data.Semigroup".semigroupString;
    };
  monoidRecordNil = 
    { memptyRecord = v: { };
      "SemigroupRecord0" = _: module."Data.Semigroup".semigroupRecordNil;
    };
  monoidOrdering = 
    { mempty = module."Data.Ordering".EQ;
      "Semigroup0" = _: module."Data.Ordering".semigroupOrdering;
    };
  monoidArray = 
    { mempty = [];
      "Semigroup0" = _: module."Data.Semigroup".semigroupArray;
    };
  memptyRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.memptyRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid.purs at 102:3 - 102:67";
    in
      __pattern0 __patternFail;
  monoidRecord = _: dictMonoidRecord: 
    let
      semigroupRecord1 = semigroupRecord (dictMonoidRecord."SemigroupRecord0" module."Prim".undefined);
    in
      
      { mempty = memptyRecord dictMonoidRecord module."Type.Proxy".Proxy;
        "Semigroup0" = _: semigroupRecord1;
      };
  mempty = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.mempty;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid.purs at 45:3 - 45:14";
    in
      __pattern0 __patternFail;
  monoidFn = dictMonoid: 
    let
      mempty1 = mempty dictMonoid;
      semigroupFn = module."Data.Semigroup".semigroupFn (dictMonoid."Semigroup0" module."Prim".undefined);
    in
      
      { mempty = v: mempty1;
        "Semigroup0" = _: semigroupFn;
      };
  monoidRecordCons = dictIsSymbol: 
    let
      reflectSymbol = module."Data.Symbol".reflectSymbol dictIsSymbol;
      semigroupRecordCons = module."Data.Semigroup".semigroupRecordCons dictIsSymbol module."Prim".undefined;
    in
      dictMonoid: 
      let
        mempty1 = mempty dictMonoid;
        Semigroup0 = dictMonoid."Semigroup0" module."Prim".undefined;
      in
        _: dictMonoidRecord: 
        let
          memptyRecord1 = memptyRecord dictMonoidRecord;
          semigroupRecordCons1 = semigroupRecordCons (dictMonoidRecord."SemigroupRecord0" module."Prim".undefined) Semigroup0;
        in
          
          { memptyRecord = v: 
              let
                tail = memptyRecord1 module."Type.Proxy".Proxy;
                key = reflectSymbol module."Type.Proxy".Proxy;
                insert = module."Record.Unsafe".unsafeSet key;
              in
                insert mempty1 tail;
            "SemigroupRecord0" = _: semigroupRecordCons1;
          };
  power = dictMonoid: 
    let
      mempty1 = mempty dictMonoid;
      append = module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined);
    in
      x: 
      let
        go = p: 
          let
            __pattern0 = __fail: 
              let
                p1 = p;
              in
                
                if lessThanOrEq p1 0
                  then mempty1
                  else 
                    if eq p1 1
                      then x
                      else 
                        if eq (mod p1 2) 0
                          then 
                            let
                              x' = go (div p1 2);
                            in
                              append x' x'
                          else 
                            if module."Data.Boolean".otherwise
                              then 
                                let
                                  x' = go (div p1 2);
                                in
                                  append x' (append x' x)
                              else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid.purs at 86:3 - 86:17";
          in
            __pattern0 __patternFail;
      in
        go;
  guard = dictMonoid: 
    let
      mempty1 = mempty dictMonoid;
    in
      v: v1: 
      let
        __pattern0 = __fail: 
          if v
            then 
              let
                a = v1;
              in
                a
            else __fail;
        __pattern1 = __fail: if !v then mempty1 else __fail;
        __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid.purs at 94:1 - 94:49";
      in
        __pattern0 (__pattern1 __patternFail);
in
  
  { inherit mempty power guard memptyRecord monoidUnit monoidOrdering monoidFn monoidString monoidArray monoidRecord monoidRecordNil monoidRecordCons;
    inherit (module."Data.Semigroup");
  }