
let
  module = 
    { "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Symbol" = import ../Data.Symbol;
      "Data.Unit" = import ../Data.Unit;
      "Prim.Row" = import ../Prim.Row;
      "Prim.RowList" = import ../Prim.RowList;
      "Type.Proxy" = import ../Type.Proxy;
    };
  heytingAlgebraRecord = module."Data.HeytingAlgebra".heytingAlgebraRecord module."Prim".undefined;
  BooleanAlgebraRecord-Dict = x: x;
  BooleanAlgebra-Dict = x: x;
  booleanAlgebraUnit = {"HeytingAlgebra0" = _: module."Data.HeytingAlgebra".heytingAlgebraUnit;};
  booleanAlgebraRecordNil = {"HeytingAlgebraRecord0" = _: module."Data.HeytingAlgebra".heytingAlgebraRecordNil;};
  booleanAlgebraRecordCons = dictIsSymbol: 
    let
      heytingAlgebraRecordCons = module."Data.HeytingAlgebra".heytingAlgebraRecordCons dictIsSymbol module."Prim".undefined;
    in
      _: dictBooleanAlgebraRecord: 
      let
        heytingAlgebraRecordCons1 = heytingAlgebraRecordCons (dictBooleanAlgebraRecord."HeytingAlgebraRecord0" module."Prim".undefined);
      in
        dictBooleanAlgebra: 
        let
          heytingAlgebraRecordCons2 = heytingAlgebraRecordCons1 (dictBooleanAlgebra."HeytingAlgebra0" module."Prim".undefined);
        in
          {"HeytingAlgebraRecord0" = _: heytingAlgebraRecordCons2;};
  booleanAlgebraRecord = _: dictBooleanAlgebraRecord: 
    let
      heytingAlgebraRecord1 = heytingAlgebraRecord (dictBooleanAlgebraRecord."HeytingAlgebraRecord0" module."Prim".undefined);
    in
      {"HeytingAlgebra0" = _: heytingAlgebraRecord1;};
  booleanAlgebraProxy3 = {"HeytingAlgebra0" = _: module."Data.HeytingAlgebra".heytingAlgebraProxy3;};
  booleanAlgebraProxy2 = {"HeytingAlgebra0" = _: module."Data.HeytingAlgebra".heytingAlgebraProxy2;};
  booleanAlgebraProxy = {"HeytingAlgebra0" = _: module."Data.HeytingAlgebra".heytingAlgebraProxy;};
  booleanAlgebraFn = dictBooleanAlgebra: 
    let
      heytingAlgebraFunction = module."Data.HeytingAlgebra".heytingAlgebraFunction (dictBooleanAlgebra."HeytingAlgebra0" module."Prim".undefined);
    in
      {"HeytingAlgebra0" = _: heytingAlgebraFunction;};
  booleanAlgebraBoolean = {"HeytingAlgebra0" = _: module."Data.HeytingAlgebra".heytingAlgebraBoolean;};
in
  
  { inherit booleanAlgebraBoolean booleanAlgebraUnit booleanAlgebraFn booleanAlgebraRecord booleanAlgebraProxy booleanAlgebraProxy2 booleanAlgebraProxy3 booleanAlgebraRecordNil booleanAlgebraRecordCons;
    inherit (module."Data.HeytingAlgebra") conj disj ff implies not tt;
  }