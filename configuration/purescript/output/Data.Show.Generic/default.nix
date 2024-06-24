
let
  module = 
    { "Data.Generic.Rep" = import ../Data.Generic.Rep;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Data.Symbol" = import ../Data.Symbol;
      "Prelude" = import ../Prelude;
      "Type.Proxy" = import ../Type.Proxy;
    };
  foreign = import ./foreign.nix;
  intercalate = foreign.intercalate;
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupArray;
  append1 = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  GenericShowArgs-Dict = x: x;
  GenericShow-Dict = x: x;
  genericShowArgsNoArguments = {genericShowArgs = v: [];};
  genericShowArgsArgument = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      
      { genericShowArgs = v: 
          let
            __pattern0 = __fail: 
              let
                a = v;
              in
                [(show a)];
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Show/Generic.purs at 46:1 - 47:42";
          in
            __pattern0 __patternFail;
      };
  genericShowArgs = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericShowArgs;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Show/Generic.purs at 18:3 - 18:39";
    in
      __pattern0 __patternFail;
  genericShowArgsProduct = dictGenericShowArgs: 
    let
      genericShowArgs1 = genericShowArgs dictGenericShowArgs;
    in
      dictGenericShowArgs1: 
      let
        genericShowArgs2 = genericShowArgs dictGenericShowArgs1;
      in
        
        { genericShowArgs = v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Product"
                  then 
                    let
                      a = v.__field0;
                      b = v.__field1;
                    in
                      append (genericShowArgs1 a) (genericShowArgs2 b)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Show/Generic.purs at 30:1 - 33:73";
            in
              __pattern0 __patternFail;
        };
  genericShowConstructor = dictGenericShowArgs: 
    let
      genericShowArgs1 = genericShowArgs dictGenericShowArgs;
    in
      dictIsSymbol: 
      let
        reflectSymbol = module."Data.Symbol".reflectSymbol dictIsSymbol;
      in
        
        { genericShow' = v: 
            let
              __pattern0 = __fail: 
                let
                  a = v;
                in
                  
                  let
                    ctor = reflectSymbol module."Type.Proxy".Proxy;
                  in
                    
                    let
                      v1 = genericShowArgs1 a;
                    in
                      
                      let
                        __pattern0 = __fail: if builtins.length v1 == 0 then ctor else __fail;
                        __pattern1 = __fail: 
                          let
                            args = v1;
                          in
                            append1 "(" (append1 (intercalate " " (append [ctor] args)) ")");
                        __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Show/Generic.purs at 39:7 - 41:63";
                      in
                        __pattern0 (__pattern1 __patternFail);
              __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Show/Generic.purs at 35:1 - 44:49";
            in
              __pattern0 __patternFail;
        };
  genericShow' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericShow';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Show/Generic.purs at 15:3 - 15:30";
    in
      __pattern0 __patternFail;
  genericShowNoConstructors = {genericShow' = a: genericShow' genericShowNoConstructors a;};
  genericShowSum = dictGenericShow: 
    let
      genericShow'1 = genericShow' dictGenericShow;
    in
      dictGenericShow1: 
      let
        genericShow'2 = genericShow' dictGenericShow1;
      in
        
        { genericShow' = v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Inl"
                  then 
                    let
                      a = v.__field0;
                    in
                      genericShow'1 a
                  else __fail;
              __pattern1 = __fail: 
                if v.__tag == "Inr"
                  then 
                    let
                      b = v.__field0;
                    in
                      genericShow'2 b
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Show/Generic.purs at 26:1 - 28:40";
            in
              __pattern0 (__pattern1 __patternFail);
        };
  genericShow = dictGeneric: 
    let
      from = module."Data.Generic.Rep".from dictGeneric;
    in
      dictGenericShow: 
      let
        genericShow'1 = genericShow' dictGenericShow;
      in
        x: genericShow'1 (from x);
in
  {inherit genericShow' genericShow genericShowArgs genericShowNoConstructors genericShowArgsNoArguments genericShowSum genericShowArgsProduct genericShowConstructor genericShowArgsArgument;}