
let
  module = 
    { "Data.Ring" = import ../Data.Ring;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Symbol" = import ../Data.Symbol;
      "Data.Unit" = import ../Data.Unit;
      "Prim.Row" = import ../Prim.Row;
      "Prim.RowList" = import ../Prim.RowList;
      "Type.Proxy" = import ../Type.Proxy;
    };
  ringRecord = module."Data.Ring".ringRecord module."Prim".undefined;
  CommutativeRingRecord-Dict = x: x;
  CommutativeRing-Dict = x: x;
  commutativeRingUnit = {"Ring0" = _: module."Data.Ring".ringUnit;};
  commutativeRingRecordNil = {"RingRecord0" = _: module."Data.Ring".ringRecordNil;};
  commutativeRingRecordCons = dictIsSymbol: 
    let
      ringRecordCons = module."Data.Ring".ringRecordCons dictIsSymbol module."Prim".undefined;
    in
      _: dictCommutativeRingRecord: 
      let
        ringRecordCons1 = ringRecordCons (dictCommutativeRingRecord."RingRecord0" module."Prim".undefined);
      in
        dictCommutativeRing: 
        let
          ringRecordCons2 = ringRecordCons1 (dictCommutativeRing."Ring0" module."Prim".undefined);
        in
          {"RingRecord0" = _: ringRecordCons2;};
  commutativeRingRecord = _: dictCommutativeRingRecord: 
    let
      ringRecord1 = ringRecord (dictCommutativeRingRecord."RingRecord0" module."Prim".undefined);
    in
      {"Ring0" = _: ringRecord1;};
  commutativeRingProxy3 = {"Ring0" = _: module."Data.Ring".ringProxy3;};
  commutativeRingProxy2 = {"Ring0" = _: module."Data.Ring".ringProxy2;};
  commutativeRingProxy = {"Ring0" = _: module."Data.Ring".ringProxy;};
  commutativeRingNumber = {"Ring0" = _: module."Data.Ring".ringNumber;};
  commutativeRingInt = {"Ring0" = _: module."Data.Ring".ringInt;};
  commutativeRingFn = dictCommutativeRing: 
    let
      ringFn = module."Data.Ring".ringFn (dictCommutativeRing."Ring0" module."Prim".undefined);
    in
      {"Ring0" = _: ringFn;};
in
  
  { inherit commutativeRingInt commutativeRingNumber commutativeRingUnit commutativeRingFn commutativeRingRecord commutativeRingProxy commutativeRingProxy2 commutativeRingProxy3 commutativeRingRecordNil commutativeRingRecordCons;
    inherit (module."Data.Ring");
    inherit (module."Data.Semiring") add mul one zero;
  }