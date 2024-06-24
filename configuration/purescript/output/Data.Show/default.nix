
let
  module = 
    { "Data.Symbol" = import ../Data.Symbol;
      "Prim.RowList" = import ../Prim.RowList;
      "Record.Unsafe" = import ../Record.Unsafe;
      "Type.Proxy" = import ../Type.Proxy;
    };
  foreign = import ./foreign.nix;
  showIntImpl = foreign.showIntImpl;
  showNumberImpl = foreign.showNumberImpl;
  showCharImpl = foreign.showCharImpl;
  showStringImpl = foreign.showStringImpl;
  showArrayImpl = foreign.showArrayImpl;
  cons = foreign.cons;
  intercalate = foreign.intercalate;
  ShowRecordFields-Dict = x: x;
  Show-Dict = x: x;
  showString = {show = showStringImpl;};
  showRecordFieldsNil = {showRecordFields = v: v1: [];};
  showRecordFields = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.showRecordFields;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Show.purs at 57:3 - 57:84";
    in
      __pattern0 __patternFail;
  showRecord = _: dictShowRecordFields: 
    let
      showRecordFields1 = showRecordFields dictShowRecordFields;
    in
      
      { show = record: 
          let
            v = showRecordFields1 module."Type.Proxy".Proxy record;
          in
            
            let
              __pattern0 = __fail: if builtins.length v == 0 then "{}" else __fail;
              __pattern1 = __fail: 
                let
                  fields = v;
                in
                  intercalate " " ["{"
                  (intercalate ", " fields)
                  "}"];
              __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Show.purs at 49:17 - 51:66";
            in
              __pattern0 (__pattern1 __patternFail);
      };
  showProxy3 = {show = v: "Proxy3";};
  showProxy2 = {show = v: "Proxy2";};
  showProxy = {show = v: "Proxy";};
  showNumber = {show = showNumberImpl;};
  showInt = {show = showIntImpl;};
  showChar = {show = showCharImpl;};
  showBoolean = 
    { show = v: 
        let
          __pattern0 = __fail: if v then "true" else __fail;
          __pattern1 = __fail: if !v then "false" else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Show.purs at 20:1 - 22:23";
        in
          __pattern0 (__pattern1 __patternFail);
    };
  show = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.show;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Show.purs at 18:3 - 18:22";
    in
      __pattern0 __patternFail;
  showArray = dictShow: {show = showArrayImpl (show dictShow);};
  showRecordFieldsCons = dictIsSymbol: 
    let
      reflectSymbol = module."Data.Symbol".reflectSymbol dictIsSymbol;
    in
      dictShowRecordFields: 
      let
        showRecordFields1 = showRecordFields dictShowRecordFields;
      in
        dictShow: 
        let
          show1 = show dictShow;
        in
          
          { showRecordFields = v: record: 
              let
                tail = showRecordFields1 module."Type.Proxy".Proxy record;
                key = reflectSymbol module."Type.Proxy".Proxy;
                focus = module."Record.Unsafe".unsafeGet key record;
              in
                cons (intercalate ": " [key
                (show1 focus)]) tail;
          };
in
  {inherit show showRecordFields showBoolean showInt showNumber showChar showString showArray showProxy showProxy2 showProxy3 showRecord showRecordFieldsNil showRecordFieldsCons;}